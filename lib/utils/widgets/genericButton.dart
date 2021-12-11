import 'package:flutter/material.dart';

import '../constants.dart';
import 'genericText.dart';
import 'package:get/get.dart';

class GenericButton extends StatelessWidget {
  final String title;
  final double height;
  final double width;
  final double radius;
  final Color bgColor;
  final Function onPressed;
  final Widget textWidget;
  const GenericButton({
    Key key,
    this.title,
    this.height,
    this.width,
    this.radius,
    this.bgColor,
    this.onPressed,
    this.textWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: width ?? getHeightWidth(context, false) * 0.70,
      height: height ?? getHeightWidth(context, true) * 0.07,
      child: RaisedButton(
        child: textWidget ??
            GenericText(
              textColor: Colors.white,
              title: title,
              fontWeight: FontWeight.bold,
            ),
        color: bgColor ?? context.theme.buttonColor,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? 50),
          ),
        ),
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
      ),
    );
  }
}
