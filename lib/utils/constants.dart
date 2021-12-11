import 'package:flutter/material.dart';

const kAnimationDuration = Duration(milliseconds: 400);
SizedBox buildHeightBox(BuildContext context, double heightPer) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * heightPer,
  );
}

SizedBox buildWidthBox(BuildContext context, double heightPer) {
  return SizedBox(
    width: MediaQuery.of(context).size.height * heightPer,
  );
}

double getHeightWidth(BuildContext context, bool height) {
  if (height) {
    return MediaQuery.of(context).size.height;
  } else {
    return MediaQuery.of(context).size.width;
  }
}
