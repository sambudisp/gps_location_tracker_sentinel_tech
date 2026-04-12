import 'package:flutter/material.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:gps_location_tracker_sentinel_tech/src/app.dart';
import 'package:gps_location_tracker_sentinel_tech/src/core/core.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'src/core/injection/injector.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // DB
  final dbHelper = DbHelper();
  await dbHelper.database;

  // Injection
  di.init();

  // Date init
  await initializeDateFormatting('en', null);

  FlutterForegroundTask.initCommunicationPort();

  // Run App
  runApp(const App());
}
