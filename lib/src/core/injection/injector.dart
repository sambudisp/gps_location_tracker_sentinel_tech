import 'package:get_it/get_it.dart';

import '../../features/location-tracker/core/core.dart';
import '../../features/setting/core/core.dart';

final GetIt locator = GetIt.instance;

void init() {
  LocationTracker.injection();
  Setting.injection();
}
