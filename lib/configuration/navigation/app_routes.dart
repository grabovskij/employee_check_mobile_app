typedef AppRoute = ({String name, String path});

abstract final class AppRoutes {
  // Root
  static const AppRoute home = (name: 'home', path: '/');

  // Reports - sub-routes of home
  static const AppRoute reports = (name: 'reports', path: 'reports');
  static const AppRoute reportDetails = (name: 'reportDetails', path: 'report-details');

  // Profile - sub-routes of home
  static const AppRoute profile = (name: 'profile', path: 'profile');

  // Auth
  static const AppRoute sign = (name: 'sign', path: '/sign');
  static const AppRoute signUp = (name: 'signUp', path: 'signUp');
}
