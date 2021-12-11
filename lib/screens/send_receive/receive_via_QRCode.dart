import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:surf_wallet/screens/send_receive/amountReceivedQR_dialog.dart';
import 'package:surf_wallet/utils/constants.dart';
import 'package:surf_wallet/utils/widgets/genericButton.dart';
import 'package:surf_wallet/utils/widgets/genericCard.dart';
import 'package:surf_wallet/utils/widgets/genericText.dart';

class ReceiveViaQRCode extends StatelessWidget {
  const ReceiveViaQRCode({Key key}) : super(key: key);

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
              height: getHeightWidth(context, true) * 0.70,
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
                          title: "Receive",
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ))
                    ],
                  ),
                  buildHeightBox(context, 0.05),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AmtReceiveViaQR();
                          });
                    },
                    child: Center(
                      child: Image.asset(
                        context.isDarkMode
                            ? "assets/images/qr-sample-dark.png"
                            : "assets/images/sampleQR.png",
                        width: getHeightWidth(context, true) * 0.28,
                      ),
                    ),
                  ),
                  buildHeightBox(context, 0.02),
                  GenericText(
                    title: "Scan adress to receive payment",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  buildHeightBox(context, 0.05),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: GenericCard(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: GenericText(
                                      title: "MIGfMA0GCSqGSIb3DQEBAQUAA4G",
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.copy,
                                  color: context.textTheme.headline1.color,
                                )
                              ],
                            ),
                            height: getHeightWidth(context, true) * 0.07,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GenericCard(
                          width: 80,
                          child: Icon(
                            Icons.share,
                            color: context.textTheme.headline1.color,
                          ),
                          height: getHeightWidth(context, true) * 0.06,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
