import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/injection/injector.dart';
import '../managers/bloc.dart';

class SettingProvider {
  const SettingProvider._();

  static final List<BlocProvider> blocProviders = [BlocProvider<SettingBloc>(create: (_) => locator<SettingBloc>())];
}
