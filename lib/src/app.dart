import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_location_tracker_sentinel_tech/l10n/app_localizations.dart';

import 'core/core.dart';
import 'features/location-tracker/core/core.dart';
import 'features/setting/core/core.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final _appRouter = AppRouter();
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();

    _router = _appRouter.router;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...LocationTracker.blocProviders, ...Setting.blocProviders],
      child: MaterialApp.router(
        title: 'GPS Location Tracker - Sentinel Tech',
        builder: EasyLoading.init(
          builder: (context, child) {
            final content = child ?? const SizedBox.shrink();
            if (Platform.isAndroid) {
              return SafeArea(top: false, left: false, right: false, child: content);
            }

            return content;
          },
        ),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en'), Locale('id')],
        routerDelegate: _router.routerDelegate,
        routeInformationParser: _router.routeInformationParser,
        routeInformationProvider: _router.routeInformationProvider,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
