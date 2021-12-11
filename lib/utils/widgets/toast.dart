import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool> toast(String message) {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.grey[200],
    textColor: Colors.black,
    fontSize: 15.0,
  );
}
