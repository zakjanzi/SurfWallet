import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpDownArrowScreen extends StatelessWidget {
  const UpDownArrowScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: Text('up down screen'),
      ),
    );
  }
}
