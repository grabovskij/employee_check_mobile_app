import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:mobile_app/core/app.dart';
import 'package:mobile_app/core/di/dependency.dart';
import 'package:url_strategy/url_strategy.dart';

void runApplication(Dependency dependency) {
  Intl.defaultLocale = 'ru_RU';
  initializeDateFormatting(Intl.defaultLocale);
  setPathUrlStrategy();
  runApp(App(dependency));
}
