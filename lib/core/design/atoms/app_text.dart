import 'package:flutter/material.dart';
import 'package:weather/core/design/tokens/tokens.dart';

class AppText extends StatelessWidget {
  const AppText(
    this.text, {
    super.key,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.style,
  });

  final String? text;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      textAlign: textAlign,
      maxLines: maxLines ?? 100,
      overflow: overflow,
      style: style ?? AppTextStyle.regularBody1,
    );
  }
}
