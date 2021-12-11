import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:surf_wallet/screens/send_receive/confirm.dart';
import 'package:surf_wallet/utils/constants.dart';
import 'package:surf_wallet/utils/widgets/appbar.dart';
import 'package:surf_wallet/utils/widgets/genericButton.dart';
import 'package:surf_wallet/utils/widgets/genericText.dart';
import 'package:surf_wallet/utils/widgets/screenBody.dart';
import 'package:get/get.dart';

class SelectContact extends StatefulWidget {
  SelectContact({Key key}) : super(key: key);

  @override
  _SelectContactState createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  final _formKey = GlobalKey<FormState>();

  bool isError = false;
  final _controller1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var inputDecoration = InputDecoration(
      hintStyle: TextStyle(color: Colors.grey),
      border: InputBorder.none,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: context.theme.shadowColor,
          width: 1.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: context.theme.shadowColor,
          width: 1.0,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: context.theme.shadowColor,
          width: 1.0,
        ),
      ),
    );
    return Scaffold(
      appBar: buildGenricAppBar(context: context, title: "Select Contacts"),
      backgroundColor: context.theme.backgroundColor,
      body: AppBody(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      buildHeightBox(context, 0.03),
                      GenericText(
                        title: "Enter the amount you want to send",
                        fontSize: 15,
                        textColor: Colors.grey,
                      ),
                      buildHeightBox(context, 0.02),
                      GenericText(
                        title: "Balance: \$1,200",
                        fontSize: 15,
                        textColor: context.theme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      buildHeightBox(context, 0.02),
                    ],
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 48),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "\$00.00",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                          onSaved: (_) {},
                          validator: (_) {},
                        ),
                        buildHeightBox(context, 0.02),
                        GenericText(
                          title: "0.00000000 BTC",
                          fontSize: 15,
                          textColor: context.theme.shadowColor,
                        ),
                        buildHeightBox(context, 0.07),
                        Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GenericText(
                                title: "Enter the wallet address",
                                fontSize: 14,
                                textColor: context.theme.shadowColor,
                              ),
                              SizedBox(
                                height: 05,
                              ),
                              TextFormField(
                                controller: _controller1,
                                style: TextStyle(
                                    color: context.theme.primaryColor,
                                    fontSize: 15.5),
                                maxLines: 5,
                                decoration: inputDecoration.copyWith(
                                    suffix: GestureDetector(
                                  onTap: () {
                                    FlutterClipboard.paste().then((value) {
                                      setState(() {
                                        _controller1.text = value;
                                      });
                                    });
                                  },
                                  child: GenericText(
                                    title: "Paste",
                                    fontSize: 14,
                                    textColor:
                                        context.textTheme.headline1.color,
                                  ),
                                )),
                                onSaved: (_) {},
                                validator: (_) {},
                              ),
                              isError ?? false
                                  ? Column(
                                      children: [
                                        SizedBox(
                                          height: 05,
                                        ),
                                        GenericText(
                                          title:
                                              "The wallet adress network matches ",
                                          fontSize: 13,
                                          textColor: Colors.green,
                                        ),
                                      ],
                                    )
                                  : Container(),
                              buildHeightBox(context, 0.04),
                              GenericText(
                                title: "Add a note",
                                fontSize: 14,
                                textColor: context.theme.shadowColor,
                              ),
                              SizedBox(
                                height: 05,
                              ),
                              TextFormField(
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.5),
                                decoration: inputDecoration,
                                onSaved: (_) {},
                                validator: (_) {},
                              ),
                              buildHeightBox(context, 0.02),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 60,
                                    height: 30,
                                    child: Container(
                                      child: OutlinedButton(
                                        onPressed: () {},
                                        child: GenericText(
                                          title: "GIF",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          textColor:
                                              context.textTheme.headline1.color,
                                        ),
                                        style: OutlinedButton.styleFrom(
                                          side: BorderSide(
                                              color: context.theme.textTheme
                                                  .headline1.color,
                                              width: 2),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Image.asset(
                                    context.isDarkMode
                                        ? "assets/images/add-user-dark.png"
                                        : "assets/images/addContact.png",
                                    width: 20,
                                  ),
                                  buildWidthBox(context, 0.02),
                                  GenericText(
                                    title: "Add to contacts",
                                    fontSize: 15,
                                    textColor:
                                        context.theme.textTheme.headline1.color,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              alignment: Alignment.center,
              child: GenericButton(
                width: double.infinity,
                onPressed: () {
                  if (!isError) {
                    setState(() => isError = !isError);
                  } else {
                    Get.to(ConfirmAsset());
                  }
                },
                title: "Continue",
              ),
            ),
            buildHeightBox(context, 0.06),
          ],
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration(
    BuildContext context,
    String placeholder,
  ) {
    return InputDecoration(
      hintText: placeholder,
      hintStyle: TextStyle(color: Colors.grey),
      border: InputBorder.none,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: context.theme.dividerColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: context.theme.dividerColor,
          width: 2.0,
        ),
      ),
    );
  }
}
