import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:surf_wallet/screens/send_receive/select_assets.dart';
import 'package:surf_wallet/utils/constants.dart';
import 'package:surf_wallet/utils/widgets/genericButton.dart';
import 'package:surf_wallet/utils/widgets/genericCard.dart';
import 'package:surf_wallet/utils/widgets/genericText.dart';

class QRCodeConfirmed extends StatelessWidget {
  const QRCodeConfirmed({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/blurBg.png"),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: getHeightWidth(context, true) * 0.60,
              decoration: BoxDecoration(color: context.theme.backgroundColor),
              child: Column(
                children: [
                  buildHeightBox(context, 0.02),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(Icons.arrow_back_ios)),
                      Expanded(
                          child: Center(
                        child: GenericText(
                          title: "QR Code",
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ))
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        buildHeightBox(context, 0.05),
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                          leading: CircleAvatar(
                            maxRadius: 30,
                            backgroundImage: AssetImage(
                              "assets/images/crypto4.png",
                            ),
                          ),
                          title: GenericText(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            title: "Joey B.",
                          ),
                        ),
                        buildHeightBox(context, 0.04),
                        GenericCard(
                          width: double.infinity,
                          height: getHeightWidth(context, true) * 0.07,
                          child: Row(
                            children: [
                              Expanded(
                                child: GenericText(
                                  title: "MIGfMA0GCSqGSIb3DQEBAQUAA4G",
                                  fontSize: 15,
                                ),
                              ),
                              Icon(
                                Icons.copy,
                                color: context.textTheme.headline1.color,
                              )
                            ],
                          ),
                        ),
                        buildHeightBox(context, 0.04),
                        Row(
                          children: [
                            Image.asset(
                              context.isDarkMode
                                  ? "assets/images/add-user-dark.png"
                                  : "assets/images/addContact.png",
                              width: 22,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GenericText(
                              title: "Add to contacts",
                              textColor: context.textTheme.headline1.color,
                              fontSize: 18,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: GenericButton(
                      onPressed: () {
                        Get.to(SelectAsset(
                          isSendTo: true,
                        ));
                      },
                      width: double.infinity,
                      title: "Confirm",
                    ),
                  ),
                  buildHeightBox(context, 0.05),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
