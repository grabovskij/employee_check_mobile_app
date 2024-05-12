import 'package:flutter/widgets.dart';
import 'package:mobile_app/core/utils/geolocator.dart';
import 'package:mobile_app/data/data_sources/local_data_sources/employee_reports_data_source/employee_reports_data_source.dart';
import 'package:mobile_app/data/data_sources/photo_picking_data_source.dart';
import 'package:mobile_app/data/data_sources/remote_data_sources/files_data_source.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

sealed class CheckingState {}

class CheckingInitialState extends CheckingState {}

class CheckingWaitingState extends CheckingState {}

class CheckingSuccessState extends CheckingState {}

class CheckingErrorState extends CheckingState {
  final String message;

  CheckingErrorState(this.message);
}

class UserCheckController {
  final PhotoPickingDataSource _pickingDataSource;
  final FilesDataSource _userPhotoDataSource;
  final CheckingDataSource _checkingDataSource;

  final _stateSubject = BehaviorSubject<CheckingState>.seeded(CheckingInitialState());

  UserCheckController({
    required CheckingDataSource checkingDataSource,
    required PhotoPickingDataSource pickingDataSource,
    required FilesDataSource userPhotoDataSource,
  })  : _checkingDataSource = checkingDataSource,
        _pickingDataSource = pickingDataSource,
        _userPhotoDataSource = userPhotoDataSource;

  factory UserCheckController.create(BuildContext context) => UserCheckController(
        checkingDataSource: context.read(),
        pickingDataSource: context.read(),
        userPhotoDataSource: context.read(),
      );

  CheckingState get state => _stateSubject.value;

  Stream<CheckingState> get stateStream => _stateSubject;

  Future<void> createReport({
    bool enterStatus = true,
  }) async {
    _stateSubject.add(CheckingWaitingState());
    Geolocation geolocation;

    try {
      geolocation = await determinePosition();
    } catch (e) {
      return _stateSubject.add(CheckingErrorState('Не удалось получить доступ к местоположению'));
    }

    final photo = await _pickingDataSource.getPhoto(ImageDataSource.camera);

    if (photo == null) {
      _stateSubject.add(CheckingErrorState('Не удалось получить фото'));

      return;
    }

    try {
      final path = await _userPhotoDataSource.uploadPhoto(photo);

      _checkingDataSource.createEmployeeReport(
        photo: path,
        enterStatus: enterStatus,
        geolocation: geolocation,
      );

      _stateSubject.add(CheckingSuccessState());
    } catch (e) {
      _stateSubject.add(CheckingErrorState('Не удалось выгрузить фото'));
    }
  }

  void dispose() {
    _stateSubject.close();
  }
}
