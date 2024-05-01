import 'package:flutter/widgets.dart';
import 'package:mobile_app/data/data_sources/checking_data_source.dart';
import 'package:mobile_app/data/data_sources/photo_picking_data_source.dart';
import 'package:mobile_app/data/data_sources/user_photo_data_source.dart';
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
  final UserPhotoDataSource _userPhotoDataSource;
  final CheckingDataSource _checkingDataSource;

  final _stateSubject =
      BehaviorSubject<CheckingState>.seeded(CheckingInitialState());

  UserCheckController({
    required CheckingDataSource checkingDataSource,
    required PhotoPickingDataSource pickingDataSource,
    required UserPhotoDataSource userPhotoDataSource,
  })  : _checkingDataSource = checkingDataSource,
        _pickingDataSource = pickingDataSource,
        _userPhotoDataSource = userPhotoDataSource;

  factory UserCheckController.create(BuildContext context) =>
      UserCheckController(
        checkingDataSource: context.read(),
        pickingDataSource: context.read(),
        userPhotoDataSource: context.read(),
      );

  CheckingState get state => _stateSubject.value;

  Stream<CheckingState> get stateStream => _stateSubject;

  Future<void> a() async {
    _stateSubject.add(CheckingWaitingState());

    final photo = await _pickingDataSource.getPhoto();

    if (photo == null) {
      _stateSubject.add(CheckingErrorState('Не удалось получить фото'));

      return;
    }

    try {
      final path = await _userPhotoDataSource.uploadPhoto(photo);

      _checkingDataSource.makeEmployeeCheck(photo: path, isEnter: true);

      _stateSubject.add(CheckingSuccessState());
    } catch (e) {
      _stateSubject.add(CheckingErrorState('Не удалось выгрузить фото'));
    }
  }

  void dispose() {
    _stateSubject.close();
  }
}
