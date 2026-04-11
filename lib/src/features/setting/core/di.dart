import '../../../core/injection/injector.dart';
import '../data/data.dart';
import '../domain/domain.dart';
import '../managers/bloc.dart';

class SettingDependency {
  const SettingDependency._();

  static void init() {
    /// [STATE_MANAGEMENT]
    locator.registerFactory(() => SettingBloc(locator()));

    /// [REPOSITORY]
    locator.registerLazySingleton<SettingRepository>(() => SettingRepositoryImpl());
  }
}
