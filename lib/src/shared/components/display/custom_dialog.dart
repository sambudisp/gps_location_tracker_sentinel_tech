import 'package:flutter/material.dart';
import 'package:gps_location_tracker_sentinel_tech/assets/colors.gen.dart';
import 'package:gps_location_tracker_sentinel_tech/src/shared/utils/shared_value.dart';

import '../../../../assets/assets.gen.dart';
import '../interactive/button.dart';

enum DialogStyle {
  info,
  succeed,
  error;

  Widget icon(BuildContext context) {
    switch (this) {
      case DialogStyle.succeed:
        return Assets.icons.icSucceed.svg(width: context.dimens80pt, height: context.dimens80pt);
      case DialogStyle.info:
        return Assets.icons.icInfo.svg(width: context.dimens80pt, height: context.dimens80pt);
      case DialogStyle.error:
        return Assets.icons.icError.svg(width: context.dimens80pt, height: context.dimens80pt);
    }
  }

  Color get color {
    switch (this) {
      case DialogStyle.info:
      case DialogStyle.succeed:
      case DialogStyle.error:
        return Colors.black;
    }
  }
}

class CustomDialog extends StatelessWidget {
  const CustomDialog.info({
    super.key,
    this.style = DialogStyle.info,
    required this.title,
    this.description = '',
    this.customIcon,
    this.twoButtonVariants = false,
    this.onPositiveTap,
    this.onNegativeTap,
    this.positiveWord,
    this.negativeWord,
    this.popCurrentStackValue,
    this.closeOnTap = true,
  });

  const CustomDialog.succeed({
    super.key,
    this.style = DialogStyle.succeed,
    required this.title,
    this.description = '',
    this.customIcon,
    this.twoButtonVariants = false,
    this.onPositiveTap,
    this.onNegativeTap,
    this.positiveWord,
    this.negativeWord,
    this.popCurrentStackValue,
    this.closeOnTap = true,
  });

  const CustomDialog.error({
    super.key,
    this.style = DialogStyle.error,
    required this.title,
    this.description = '',
    this.customIcon,
    this.twoButtonVariants = false,
    this.onPositiveTap,
    this.onNegativeTap,
    this.positiveWord,
    this.negativeWord,
    this.popCurrentStackValue,
    this.closeOnTap = true,
  });

  final DialogStyle style;
  final String title;
  final String? description;
  final bool twoButtonVariants;
  final Widget? customIcon;
  final VoidCallback? onPositiveTap;
  final VoidCallback? onNegativeTap;
  final String? positiveWord;
  final String? negativeWord;
  final bool? popCurrentStackValue;
  final bool closeOnTap;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: context.borderRadius16pt),
      child: Padding(
        padding: EdgeInsets.all(context.dimens16pt),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            customIcon ?? style.icon(context),
            context.vWhitespace(context.dimens16pt),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(color: style.color, fontSize: context.dimens16pt, fontWeight: FontWeight.w700),
            ),
            context.vWhitespace(context.dimens8pt),
            description!.isEmpty
                ? const SizedBox.shrink()
                : Text(
                    description.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: ColorName.darkGrey,
                      fontSize: context.dimens14pt,
                    ),
                  ),
            context.vWhitespace(context.dimens24pt),
            twoButtonVariants
                ? IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Button.outlined(
                            onPressed: onNegativeTap ?? context.popCurrentStack,
                            label: negativeWord ?? context.l10n.cancelLabel,
                            textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: ColorName.black),
                          ),
                        ),
                        context.hWhitespace(context.dimens16pt),
                        Expanded(
                          child: Button.filled(
                            onPressed: () {
                              context.popCurrentStack();
                              if (onPositiveTap != null) onPositiveTap!();
                            },
                            label: positiveWord ?? context.l10n.yesLabel,
                            color: ColorName.primary,
                            textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: ColorName.white),
                          ),
                        ),
                      ],
                    ),
                  )
                : Button.filled(
                    onPressed: () {
                      if (closeOnTap) {
                        if (popCurrentStackValue != null) {
                          context.popCurrentStackWithValue(value: popCurrentStackValue);
                        } else {
                          context.popCurrentStack();
                        }
                      }

                      if (onPositiveTap != null) onPositiveTap!();
                    },
                    label: positiveWord ?? context.l10n.okLabel,
                    color: ColorName.primary,
                    textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: ColorName.white),
                  ),
          ],
        ),
      ),
    );
  }
}
