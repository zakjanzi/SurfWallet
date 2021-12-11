import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:surf_wallet/screens/send_receive/select_assets.dart';
import 'package:surf_wallet/utils/constants.dart';
import 'package:surf_wallet/utils/widgets/appbar.dart';
import 'package:surf_wallet/utils/widgets/genericButton.dart';
import 'package:surf_wallet/utils/widgets/genericText.dart';
import 'package:surf_wallet/utils/widgets/screenBody.dart';
import 'package:get/get.dart';

class NewContact extends StatefulWidget {
  NewContact({Key key}) : super(key: key);

  @override
  _NewContactState createState() => _NewContactState();
}

class _NewContactState extends State<NewContact> {
  final _formKey = GlobalKey<FormState>();
  final _controller1 = TextEditingController();

  bool isConfirm = false;

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
    );
    return Scaffold(
      appBar: buildGenricAppBar(context: context, title: "New Contact"),
      backgroundColor: context.theme.backgroundColor,
      body: AppBody(
        child: isConfirm
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildHeightBox(context, 0.15),
                  Center(
                    child: Image.asset(
                      "assets/images/contactConfirm.png",
                      width: getHeightWidth(context, false) * 0.80,
                    ),
                  ),
                  GenericText(
                    title: "Your contact has been added",
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  Spacer(),
                  Container(
                    alignment: Alignment.center,
                    child: GenericButton(
                      width: double.infinity,
                      onPressed: () {
                        if (!isConfirm) {
                          setState(() => isConfirm = !isConfirm);
                        } else {
                          Get.to(SelectAsset(
                            isSendTo: true,
                          ));
                        }
                      },
                      title: isConfirm ? "Continue" : "Create",
                    ),
                  ),
                  buildHeightBox(context, 0.09),
                ],
              )
            : Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildHeightBox(context, 0.06),
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
                                fontSize: 15.5,
                                color: context.theme.primaryColor),
                            decoration: inputDecoration,
                            onSaved: (_) {},
                            validator: (_) {},
                          ),
                          buildHeightBox(context, 0.04),

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
                                textColor: context.textTheme.headline1.color,
                              ),
                            )),
                            onSaved: (_) {},
                            validator: (_) {},
                          ),
                          // Column(
                          //   children: [
                          //     SizedBox(
                          //       height: 05,
                          //     ),
                          //     GenericText(
                          //       title: "The wallet adress network matches ",
                          //       fontSize: 13,
                          //       textColor: Colors.green,
                          //     ),
                          //   ],
                          // ),

                          buildHeightBox(context, 0.06),
                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  context.isDarkMode
                                      ? "assets/images/qr-code-dark.png"
                                      : "assets/images/qrIcon.png",
                                  width: 60,
                                ),
                                buildHeightBox(context, 0.01),
                                GenericText(
                                  title: "Or scan QR",
                                  fontSize: 14,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    alignment: Alignment.center,
                    child: GenericButton(
                      width: double.infinity,
                      onPressed: () {
                        if (!isConfirm) {
                          setState(() => isConfirm = !isConfirm);
                        } else {
                          Get.to(SelectAsset(
                            isSendTo: true,
                          ));
                        }
                      },
                      title: "Create",
                    ),
                  ),
                  buildHeightBox(context, 0.09),
                ],
              ),
      ),
    );
  }
}
