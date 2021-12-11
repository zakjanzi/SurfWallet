import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBody extends StatelessWidget {
  final Widget child;
  const AppBody({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: Platform.isIOS ? false : true,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15), child: child),
    );
  }
}
