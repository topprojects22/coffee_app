import 'package:boilerplate/utils/locale/app_localization.dart';
import 'package:flutter/material.dart';

enum TextType {
  headlineMedium,
  headlineSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  titleLarge,
  titleMedium,
  titleSmall,
  labelLarge,
  labelSmall,
}

class TextUi extends StatelessWidget {
  const TextUi({
    required this.title,
    required this.type,
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.gradient,
    this.softWrap,
    this.isCustomTitle, // TODO Подумать над названием переменной
  });

  final title;
  final TextType type;
  final Color? color;
  final TextAlign? textAlign;
  final maxLines;
  final List<Color>? gradient;
  final softWrap;
  final bool? isCustomTitle;

  @override
  Widget build(BuildContext context) {
    TextStyle? resultStyle;
    Shader? linearGradient;

    if (type == TextType.headlineMedium) {
      resultStyle = Theme.of(context).textTheme.headlineMedium;
    } else if (type == TextType.bodySmall) {
      resultStyle = Theme.of(context).textTheme.bodySmall;
    } else if (type == TextType.headlineSmall) {
      resultStyle = Theme.of(context).textTheme.headlineSmall;
    } else if (type == TextType.titleMedium) {
      resultStyle = Theme.of(context).textTheme.titleMedium;
    } else if (type == TextType.labelSmall) {
      resultStyle = Theme.of(context).textTheme.labelSmall;
    } else if (type == TextType.bodyLarge) {
      resultStyle = Theme.of(context).textTheme.bodyLarge;
    } else if (type == TextType.titleSmall) {
      resultStyle = Theme.of(context).textTheme.titleSmall;
    } else if (type == TextType.bodyMedium) {
      resultStyle = Theme.of(context).textTheme.bodyMedium;
    } else if (type == TextType.titleLarge) {
      resultStyle = Theme.of(context).textTheme.titleLarge;
    } else if (type == TextType.labelLarge) {
      resultStyle = Theme.of(context).textTheme.labelLarge;
    } else {
      throw 'Wrong text type!';
    }

    if (gradient != null) {
      linearGradient = LinearGradient(
        colors: gradient ?? [],
        begin: Alignment.centerLeft,
        end: Alignment.bottomRight,
      ).createShader(const Rect.fromLTWH(0.0, 0.0, 320.0, 80.0));
    }

    final TextStyle textStyle;

    if (gradient != null) {
      textStyle = TextStyle(
        fontWeight: resultStyle?.fontWeight,
        fontSize: resultStyle?.fontSize,
        fontFamily: resultStyle?.fontFamily,
        foreground: Paint()..shader = gradient != null ? linearGradient : null,
        decoration: TextDecoration.none,
      );
    } else if (color != null) {
      textStyle = TextStyle(
        color: color ?? Theme.of(context).colorScheme.tertiary,
        fontWeight: resultStyle?.fontWeight,
        fontSize: resultStyle?.fontSize,
        fontFamily: resultStyle?.fontFamily,
        decoration: TextDecoration.none,
      );
    } else {
      textStyle = TextStyle(
        fontWeight: resultStyle?.fontWeight,
        fontSize: resultStyle?.fontSize,
        fontFamily: resultStyle?.fontFamily,
        decoration: TextDecoration.none,
      );
    }

    var text = title;
    if (isCustomTitle == false || isCustomTitle == null) {
      text = AppLocalizations.of(context).translate(title);
    }

    return Text(
      text,
      maxLines: maxLines ?? 1,
      overflow: TextOverflow.ellipsis,
      softWrap: softWrap ?? false,
      textAlign: textAlign,
      style: textStyle,
    );
  }
}
