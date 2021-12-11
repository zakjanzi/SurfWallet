import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardContent extends StatelessWidget {
  const OnBoardContent({
    Key key,
    this.type,
    this.header,
    this.text,
    this.image,
  }) : super(key: key);

  final String text, image, header, type;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        AppBar(
          backgroundColor: context.theme.backgroundColor,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: context.theme.primaryColor,
            ),
          ),
          title: Text(
            type,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: context.theme.primaryColor,
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(
          height: mq.height * 0.05,
        ),
        SizedBox(
          width: mq.width * 0.8,
          height: mq.height * 0.34,
          child: Center(
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: mq.height * 0.04,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: mq.width * 0.1),
          child: Text(
            header,
            style: TextStyle(
              fontSize: 22,
              letterSpacing: 1,
              color: context.theme.highlightColor,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        SizedBox(
          height: mq.height * 0.012,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: mq.width * 0.1),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1.5,
              fontSize: 15.5,
              color: context.theme.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
