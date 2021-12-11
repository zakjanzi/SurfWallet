import 'package:flutter/material.dart';
import 'package:get/get.dart';

PreferredSize buildGenricAppBar(
    {BuildContext context, Function onLeading, String title}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(50.0),
    child: AppBar(
      centerTitle: true,
      backgroundColor: context.theme.backgroundColor,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          onLeading() ?? Get.back();
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: context.theme.primaryColor,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: context.theme.primaryColor,
        ),
      ),
    ),
  );
}
