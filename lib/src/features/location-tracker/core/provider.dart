import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/injection/injector.dart';
import '../managers/location_tracker_bloc.dart';

class LocationTrackerProvider {
  const LocationTrackerProvider._();

  static final List<BlocProvider> blocProviders = [
    BlocProvider<LocationTrackerBloc>(create: (_) => locator<LocationTrackerBloc>()),
  ];
}
