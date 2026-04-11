import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gps_location_tracker_sentinel_tech/l10n/app_localizations.dart';

import '../../components/components.dart';

extension KtSharedValue on BuildContext {
  /// Get access to typography for text style property
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Get access to localizations where all static texts stored
  AppLocalizations get l10n => AppLocalizations.of(this)!;

  /// [MediaQuery] Get access to device width
  double get deviceWidth => MediaQuery.of(this).size.width;

  /// [MediaQuery] Get access to device height
  double get deviceHeight => MediaQuery.of(this).size.height;

  /// Get access to dimensions for component spacing and font size
  double get dimens0pt => 0.0;
  double get dimens2pt => 2.0;
  double get dimens4pt => 4.0;
  double get dimens8pt => 8.0;
  double get dimens10pt => 10.0;
  double get dimens12pt => 12.0;
  double get dimens14pt => 14.0;
  double get dimens16pt => 16.0;
  double get dimens18pt => 18.0;
  double get dimens20pt => 20.0;
  double get dimens24pt => 24.0;
  double get dimens28pt => 28.0;
  double get dimens32pt => 32.0;
  double get dimens80pt => 80.0;
  double get dimens128pt => 128.0;
  BorderRadius get borderRadius4pt => BorderRadius.circular(4.0);
  BorderRadius get borderRadius8pt => BorderRadius.circular(8.0);
  BorderRadius get borderRadius10pt => BorderRadius.circular(10.0);
  BorderRadius get borderRadius12pt => BorderRadius.circular(12.0);
  BorderRadius get borderRadius16pt => BorderRadius.circular(16.0);
  BorderRadius get borderRadius18pt => BorderRadius.circular(18.0);
  BorderRadius get borderRadius20pt => BorderRadius.circular(20.0);
  BorderRadius get borderRadius28pt => BorderRadius.circular(28.0);
  BorderRadius get borderRadius32pt => BorderRadius.circular(32.0);
  BorderRadius get borderRadius48pt => BorderRadius.circular(48.0);
  BorderRadius get borderRadius100pt => BorderRadius.circular(100.0);
  Radius get radius4pt => const Radius.circular(4.0);
  Radius get radius8pt => const Radius.circular(8.0);
  Radius get radius10pt => const Radius.circular(10.0);
  Radius get radius16pt => const Radius.circular(16.0);
  Radius get radius18pt => const Radius.circular(18.0);
  Radius get radius20pt => const Radius.circular(20.0);

  /// Create a vertical whitespace
  SizedBox vWhitespace(double size) => SizedBox(height: size);

  /// Create a horizontal whitespace
  SizedBox hWhitespace(double size) => SizedBox(width: size);

  /// [popCurrentStack] is built to simplify navigating back between pages
  popCurrentStack({bool rootNavigator = false}) {
    Navigator.of(this, rootNavigator: rootNavigator).pop();
  }

  popCurrentStackWithValue({bool rootNavigator = false, dynamic value}) {
    Navigator.of(this, rootNavigator: rootNavigator).pop(value);
  }

  /// Show a loading dialog with text [message]
  Future showLoadingDialog({String? message}) {
    return EasyLoading.show(
      maskType: EasyLoadingMaskType.black,
      status: message ?? l10n.loadingLabel,
      dismissOnTap: false,
    );
  }

  /// Dismiss current showed loading dialog
  Future dismissLoadingDialog() => EasyLoading.dismiss();

  /// Show dynamic alert dialog
  Future showAlertDialog(CustomDialog dialog, {bool barrierDismissible = true}) {
    return showDialog(context: this, barrierDismissible: barrierDismissible, builder: (context) => dialog);
  }
}

extension StringExtension on String? {
  String capitalizeWords() {
    if (this == null) return '';
    final trimmed = this!.trim();
    if (trimmed.isEmpty) return '';

    return trimmed
        .split(RegExp(r'\s+'))
        .map((word) {
          if (word.isEmpty) return '';
          final firstLetter = word[0].toUpperCase();
          final restOfTheWord = word.substring(1).toLowerCase();
          return '$firstLetter$restOfTheWord';
        })
        .join(' ');
  }

  String? capitalizeFirstLetter() {
    if (this == null) return '-';
    if (this!.isEmpty) return '-';
    final firstLetter = this![0].toUpperCase();
    final restOfTheWord = this!.substring(1).toLowerCase();
    return '$firstLetter$restOfTheWord';
  }
}
