import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? height;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool? softWrap;
  final TextWidthBasis? textWidthBasis;
  final TextDirection? textDirection;
  final Locale? locale;
  final StrutStyle? strutStyle;
  final TextScaler? textScaler;
  final String? semanticsLabel;
  final List<Shadow>? shadows;

  const AppText(
    this.text, {
    super.key,
    this.style,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.decoration,
    this.decorationColor,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.textWidthBasis,
    this.textDirection,
    this.locale,
    this.strutStyle,
    this.textScaler,
    this.semanticsLabel,
    this.shadows,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      textWidthBasis: textWidthBasis,
      textDirection: textDirection,
      locale: locale,
      strutStyle: strutStyle,
      textScaler: textScaler,
      semanticsLabel: semanticsLabel,
      style: (style ?? const TextStyle()).copyWith(
        color: color ?? style?.color,
        fontSize: fontSize ?? style?.fontSize,
        fontWeight: fontWeight ?? style?.fontWeight,
        fontStyle: fontStyle ?? style?.fontStyle,
        letterSpacing: letterSpacing ?? style?.letterSpacing,
        wordSpacing: wordSpacing ?? style?.wordSpacing,
        height: height ?? style?.height,
        decoration: decoration ?? style?.decoration,
        decorationColor: decorationColor ?? style?.decorationColor,
        shadows: shadows ?? style?.shadows,
      ),
    );
  }
}
