import 'package:flutter/material.dart';

import '../../../assets/colors.gen.dart';

class AppDecorations {
  static const BoxDecoration mainGradientBackground = BoxDecoration(
    gradient: LinearGradient(
      colors: [ColorName.secondary, ColorName.primary, ColorName.darkBlue],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  );
}
