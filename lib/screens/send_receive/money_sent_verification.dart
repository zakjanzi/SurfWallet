import 'package:flutter/material.dart';
import 'package:surf_wallet/screens/send_receive/Sent.dart';
import 'package:surf_wallet/screens/send_receive/select_assets.dart';
import 'package:surf_wallet/utils/constants.dart';
import 'package:surf_wallet/utils/widgets/genericText.dart';
import 'package:surf_wallet/utils/widgets/screenBody.dart';
import 'package:get/get.dart';

class MoneySentVerification extends StatelessWidget {
  final bool isSentTo;
  final String imageUrl;
  MoneySentVerification({Key key, this.isSentTo = false, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildHeightBox(context, 0.20),
              Image.asset(
                "assets/images/Money.png",
                width: 300,
              ),
              GenericText(
                title: "You’ve sent \$30.40 to ",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              isSentTo
                  ? Column(
                      children: [
                        buildHeightBox(context, 0.03),
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
                        ),
                        buildHeightBox(context, 0.03),
                        GenericText(
                          title: "Note: Thanks!",
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          textColor: Colors.grey,
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        buildHeightBox(context, 0.03),
                        GenericText(
                          title: "Wallet Adress",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          textColor: Colors.grey,
                        ),
                        buildHeightBox(context, 0.01),
                        GenericText(
                          title: "3DeLu7CZYD..3dW6P37pnp",
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          textColor: context.theme.primaryColor,
                        ),
                        buildHeightBox(context, 0.02),
                        GenericText(
                          title: "Note: Thanks!",
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          textColor: Colors.grey,
                        ),
                      ],
                    ),

              // buildHeightBox(context, 0.02),
            ],
          ),
          Spacer(),
          Container(
            width: double.infinity,
            height: getHeightWidth(context, true) * 0.08,
            padding: EdgeInsets.symmetric(
                horizontal: getHeightWidth(context, false) * 0.15),
            child: Container(
              child: OutlinedButton(
                onPressed: () {
                  if (isSentTo) {
                    Get.to(Sent());
                  } else {
                    Get.offAll(SelectAsset());
                  }
                },
                child: GenericText(
                  title: "Review Payment",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  textColor: context.textTheme.headline1.color,
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                      color: context.textTheme.headline1.color, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ),
          buildHeightBox(context, 0.10),
        ],
      ),
    );
  }
}
