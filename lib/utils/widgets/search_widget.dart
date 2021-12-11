import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';

class SeearchWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final Function validator;
  final Function onSaved;
  final String placeholder;
  
  SeearchWidget(
      {Key key, this.formKey, this.validator, this.onSaved, this.placeholder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.5),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: context.theme.textTheme.headline1.color,
          ),
          hintText: placeholder,
          hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.normal),
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: context.theme.shadowColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: context.theme.shadowColor,
              width: 1.0,
            ),
          ),
        ),
        onSaved: onSaved,
        validator: validator,
      ),
    );
  }
}
