import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:gps_location_tracker_sentinel_tech/src/app.dart';
import 'package:gps_location_tracker_sentinel_tech/src/core/core.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'firebase_options.dart';
import 'src/core/injection/injector.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
