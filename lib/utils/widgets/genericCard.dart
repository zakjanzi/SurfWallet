import 'package:flutter/material.dart';
import 'package:get/get.dart';
class GenericCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final double height;
  final double width;
  final int elevation;
  final Offset offset;
  const GenericCard(
      {Key key,
      this.child,
      this.padding,
      this.height,
      this.width,
      this.elevation,
      this.offset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: context.theme.cardColor, width: 1),
          color: context.theme.cardColor,
          boxShadow: [
            BoxShadow(
              offset: offset ?? Offset(0, 20),
              blurRadius: 10,
              spreadRadius: 2,
              color: Color.fromRGBO(0, 0, 0, 0.08),
            )
          ]),
      height: height ?? 50.0,
      width: width ?? 100.0,
      padding: padding ?? EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: child,
    );
  }
}
