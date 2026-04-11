import 'core.dart';

class Setting {
  const Setting._();

  static void injection() => SettingDependency.init();
  static final blocProviders = SettingProvider.blocProviders;
  static final routes = SettingRouter.init;
}
