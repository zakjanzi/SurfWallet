import 'package:flutter/material.dart';
import 'package:surf_wallet/screens/send_receive/confirm.dart';
import 'package:surf_wallet/utils/constants.dart';
import 'package:surf_wallet/utils/widgets/appbar.dart';
import 'package:surf_wallet/utils/widgets/genericButton.dart';
import 'package:surf_wallet/utils/widgets/genericText.dart';
import 'package:surf_wallet/utils/widgets/screenBody.dart';
import 'package:get/get.dart';

class SendTo extends StatelessWidget {
  SendTo({Key key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

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
      backgroundColor: context.theme.backgroundColor,
      appBar: buildGenricAppBar(context: context, title: "Send To"),
      body: AppBody(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildHeightBox(context, 0.05),
              Center(
                child: CircleAvatar(
                  maxRadius: 40,
                  backgroundImage: AssetImage(
                    "assets/images/crypto2.png",
                  ),
                ),
              ),
              buildHeightBox(context, 0.01),
              GenericText(
                title: "Joey B.",
                fontSize: 14,
                textColor: context.theme.shadowColor,
              ),
              buildHeightBox(context, 0.03),
              GenericText(
                title: "Wallet Adress",
                fontSize: 15,
                textColor: Colors.grey,
              ),
              GenericText(
                title: "3DeLu7CZYD..3dW6P37pnp",
                fontSize: 17,
                textColor: context.theme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
              buildHeightBox(context, 0.05),
              GenericText(
                title: "\$35.00",
                fontSize: 48,
                textColor: context.textTheme.headline1.color,
                fontWeight: FontWeight.bold,
              ),
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
                            color: context.theme.primaryColor, fontSize: 15.5),
                        decoration: inputDecoration,
                        onSaved: (_) {},
                        validator: (_) {},
                      ),
                      buildHeightBox(context, 0.02),
                      Container(
                        width: 80,
                        height: 40,
                        child: Container(
                          child: OutlinedButton(
                            onPressed: () {},
                            child: GenericText(
                              title: "GIF",
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              textColor: context.textTheme.headline1.color,
                            ),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                  color: context.textTheme.headline1.color,
                                  width: 2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              buildHeightBox(context, 0.12),
              Container(
                alignment: Alignment.center,
                child: GenericButton(
                  width: double.infinity,
                  onPressed: () {
                    Get.to(ConfirmAsset(
                      isSendTo: true,
                    ));
                  },
                  title: "Continue",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
