import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      this.data, {
        super.key,
        this.style,
        this.maxLines,
        this.textAlign,
        this.locale,
        this.selectionColor,
        this.semanticsLabel,
        this.softWrap,
        this.strutStyle,
        this.textDirection,
        this.textHeightBehavior,
        this.textScaleFactor,
        this.textWidthBasis,
      });

  final String data;
  final TextStyle? style;
  final int? maxLines;
  final TextAlign? textAlign;
  final Locale? locale;
  final Color? selectionColor;
  final String? semanticsLabel;
  final bool? softWrap;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextHeightBehavior? textHeightBehavior;
  final double? textScaleFactor;
  final TextWidthBasis? textWidthBasis;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
      locale: locale,
      selectionColor: selectionColor,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
    );
  }
}
