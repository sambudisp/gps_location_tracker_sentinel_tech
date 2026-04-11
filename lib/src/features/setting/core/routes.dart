import 'package:go_router/go_router.dart';

import '../pages/pages.dart';

class SettingRouter {
  const SettingRouter._();

  static final List<GoRoute> init = [
    GoRoute(
      name: setting,
      path: settingPath,
      builder: (context, state) {
        return const SettingPage();
      },
      routes: [],
    ),
  ];

  static const String setting = 'setting';
  static const String settingPath = '/setting';
}
