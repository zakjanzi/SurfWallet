import 'package:flutter/material.dart';
import 'package:surf_wallet/screens/send_receive/money_sent_verification.dart';
import 'package:surf_wallet/utils/constants.dart';
import 'package:surf_wallet/utils/widgets/appbar.dart';
import 'package:surf_wallet/utils/widgets/genericButton.dart';
import 'package:surf_wallet/utils/widgets/genericCard.dart';
import 'package:surf_wallet/utils/widgets/genericText.dart';
import 'package:surf_wallet/utils/widgets/screenBody.dart';
import 'package:get/get.dart';

class ConfirmAsset extends StatelessWidget {
  final bool isSendTo;
  const ConfirmAsset({Key key, this.isSendTo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: buildGenricAppBar(
          context: context, onLeading: null, title: "Confirm"),
      body: AppBody(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    buildHeightBox(context, 0.03),
                    GenericText(
                      title: "Balance: \$1,200",
                      fontSize: 15,
                      textColor: context.theme.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                    buildHeightBox(context, 0.02),
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
                    buildHeightBox(context, 0.03),
                    GenericCard(
                      height: getHeightWidth(context, true) * 0.10,
                      width: getHeightWidth(context, false) * 0.80,
                      elevation: 1,
                      offset: Offset(0, 10),
                      child: ListTile(
                          onTap: () {},
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage("assets/images/crypto1.png"),
                          ),
                          title: GenericText(
                              title: "Bitcoin",
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              textColor: context.theme.primaryColor),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GenericText(
                                  title: "0.00BTC",
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  textColor: context.theme.shadowColor),
                              SizedBox(
                                height: 5,
                              ),
                              GenericText(
                                  title: "0.00USD",
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  textColor: context.theme.primaryColor),
                            ],
                          )),
                    ),
                    buildHeightBox(context, 0.05),
                    Image.asset(
                      "assets/images/gifDummpy.png",
                      width: 200,
                    ),
                    buildHeightBox(context, 0.03),
                    GenericText(
                        title: "Note: Thanks!",
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        textColor: context.theme.shadowColor),
                  ],
                ),
              ),
              // buildHeightBox(context, 0.03),
              Spacer(),
              GenericButton(
                width: double.infinity,
                onPressed: () {
                  Get.to(MoneySentVerification(
                    isSentTo: isSendTo ?? false,
                  ));
                },
                title: "Send",
              ),
              buildHeightBox(context, 0.06),
            ],
          ),
        ),
      ),
    );
  }
}
