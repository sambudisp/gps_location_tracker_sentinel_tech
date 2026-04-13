import 'package:flutter/material.dart';
import 'package:gps_location_tracker_sentinel_tech/assets/colors.gen.dart';
import 'package:gps_location_tracker_sentinel_tech/src/shared/constants/app_theme.dart';

enum ButtonStyle { filled, outlined }

extension ButtonStyleX on ButtonStyle {
  bool get isFilled => this == ButtonStyle.filled;

  bool get isOutlined => this == ButtonStyle.outlined;
}

class Button extends StatelessWidget {
  const Button.filled({
    super.key,
    required this.onPressed,
    required this.label,
    this.widget,
    this.style = ButtonStyle.filled,
    this.color = ColorName.primary,
    this.textColor = Colors.white,
    this.enabled = true,
    this.textStyle,
    this.padding = 16.0,
    this.contentPadding,
    this.width = double.infinity,
    this.borderRadius = 16.0,
    this.maxLines,
  });

  const Button.outlined({
    super.key,
    required this.onPressed,
    required this.label,
    this.widget,
    this.style = ButtonStyle.outlined,
    this.color = ColorName.lightGrey,
    this.textColor = ColorName.black,
    this.enabled = true,
    this.textStyle,
    this.padding = 16.0,
    this.contentPadding,
    this.width = double.infinity,
    this.borderRadius = 16.0,
    this.maxLines,
  });

  final Function() onPressed;
  final String label;
  final Widget? widget;
  final ButtonStyle style;
  final Color color;
  final Color textColor;
  final bool enabled;
  final TextStyle? textStyle;
  final double padding;
  final EdgeInsetsGeometry? contentPadding;
  final double? width;
  final double borderRadius;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: MaterialButton(
        onPressed: enabled ? onPressed : null,
        padding: contentPadding ?? EdgeInsets.all(padding),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: style.isFilled
              ? BorderSide.none
              : BorderSide(color: enabled ? color : Colors.grey.shade300, width: 1.2),
        ),
        elevation: 0.0,
        highlightElevation: 0.0,
        focusElevation: 0.0,
        disabledElevation: 0.0,
        color: style.isFilled ? color : null,
        splashColor: style.isFilled ? Colors.white.withValues(alpha: 0.2) : color.withValues(alpha: 0.2),
        disabledColor: style.isFilled ? Colors.grey.shade300 : null,
        disabledTextColor: Colors.white,
        child:
            widget ??
            Text(
              label,
              style: (textStyle != null)
                  ? textStyle
                  : style.isFilled
                  ? AppTheme.darkTextTheme.displaySmall?.copyWith(
                      color: enabled ? textColor : Colors.white,
                      fontSize: 16.0,
                    )
                  : AppTheme.lightTextTheme.displaySmall?.copyWith(
                      color: enabled ? textColor : Colors.grey.shade300,
                      fontSize: 16.0,
                    ),
              textAlign: TextAlign.center,
              maxLines: maxLines,
            ),
      ),
    );
  }
}
