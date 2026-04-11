import 'package:flutter/material.dart';
import 'package:gps_location_tracker_sentinel_tech/src/app.dart';
import 'package:gps_location_tracker_sentinel_tech/src/core/core.dart';
import 'src/core/injection/injector.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // DB
  final dbHelper = DbHelper();
  await dbHelper.database;

  // Injection
  di.init();

  runApp(const App());
}