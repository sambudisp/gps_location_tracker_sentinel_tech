import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/location-tracker/core/core.dart';
import '../../features/setting/core/core.dart';
import '../../features/splash/pages/splash_page.dart';

class AppRouter {
  late final router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: null,
    observers: [],
    initialLocation: RouteConstants.splashPath,
    routes: [
      GoRoute(
        name: RouteConstants.splash,
        path: RouteConstants.splashPath,
        builder: (context, state) => const SplashPage(),
      ),
      ...LocationTracker.routes,
      ...Setting.routes,
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          body: Center(child: Text(state.error.toString(), textAlign: TextAlign.center)),
        ),
      );
    },
  );
}

class RouteConstants {
  static const String splash = 'splash';
  static const String splashPath = '/splash';
  static const String root = 'root';
  static const String rootPath = '/:tab';
  static const String locationTracker = 'locationTracker';
  static const String locationTrackerPath = '/locationTracker';
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((dynamic _) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
