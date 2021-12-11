import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenericText extends StatelessWidget {
  final String title;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  GenericText(
      {Key key, this.title, this.fontSize, this.fontWeight, this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: fontSize ?? 15,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: textColor ?? context.theme.primaryColor,
      ),
    );
  }
}
