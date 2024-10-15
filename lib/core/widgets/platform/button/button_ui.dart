import 'package:boilerplate/core/widgets/platform/text/text_ui.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/constants/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.textColor,
    this.backgroundColor,
    this.fontSize,
    this.borderRadius,
    this.padding,
    this.leadingIcon,
    this.trailingIcon,
    this.mainAxisSize,
    this.side,
  });
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final double? fontSize;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final MainAxisSize? mainAxisSize;
  final Color? textColor;
  final dynamic side;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        overlayColor: Colors.black,
        backgroundColor: backgroundColor ?? AppColors.orange[500],
        padding: padding ??
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
          side: side,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: mainAxisSize ?? MainAxisSize.max,
        children: [
          if (leadingIcon != null) ...[
            leadingIcon!,
            const SizedBox(width: 8.0),
          ],
          TextUi(
            title: text,
            type: TextType.bodySmall,
            color: textColor ?? AppColors.orange[50],
          ),
          if (trailingIcon != null) ...[
            const SizedBox(width: 8.0),
            trailingIcon!,
          ],
        ],
      ),
    );
  }
}
