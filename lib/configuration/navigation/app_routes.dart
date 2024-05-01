typedef AppRoute = ({String name, String path});

abstract final class AppRoutes {
  // Root
  static const AppRoute home = (name: 'home', path: '/');

  // Reports
  static const AppRoute reports = (name: 'reports', path: 'reports');
  static const AppRoute reportDetails = (name: 'reportDetails', path: 'report-details');

  // Auth
  static const AppRoute sign = (name: 'sign', path: '/sign');
  static const AppRoute signUp = (name: 'signUp', path: 'signUp');
}
