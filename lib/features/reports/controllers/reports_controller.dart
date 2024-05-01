import 'package:mobile_app/data/data_sources/checking_data_source.dart';
import 'package:mobile_app/domain/report.dart';
import 'package:rxdart/rxdart.dart';

sealed class ReportsState {}

class ReportsLoadingState extends ReportsState {}

class ReportsLoadedState extends ReportsState {
  final List<Report> reports;

  ReportsLoadedState(this.reports);
}

class ReportsErrorState extends ReportsState {}

class ReportsController {
  final _stateSubject = BehaviorSubject<ReportsState>.seeded(ReportsLoadingState());

  final CheckingDataSource dataSource;

  ReportsController(this.dataSource);

  ReportsState get state => _stateSubject.value;

  Stream<ReportsState> get stateStream => _stateSubject;

  Future<void> init() async {
    _stateSubject.add(ReportsLoadingState());

    try {
      final reports = await dataSource.getReports();

      _stateSubject.add(ReportsLoadedState(reports));
    } catch (e) {
      _stateSubject.add(ReportsErrorState());
    }
  }

  void dispose() {
    _stateSubject.close();
  }
}
