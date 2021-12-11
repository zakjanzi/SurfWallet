import 'package:flutter/material.dart';
import 'package:surf_wallet/data/controllers/send_receive_cont.dart';
import 'package:surf_wallet/screens/send_receive/contacts.dart';
import 'package:surf_wallet/screens/send_receive/qrCode_confirmed.dart';
import 'package:surf_wallet/screens/send_receive/select_assets.dart';
import 'package:surf_wallet/utils/constants.dart';
import 'package:surf_wallet/utils/widgets/genericCard.dart';
import 'package:surf_wallet/utils/widgets/genericText.dart';
import 'package:get/get.dart';
import 'package:surf_wallet/utils/widgets/screenBody.dart';

import 'receive_via_QRCode.dart';

class ReceiveSendBottomSheet extends StatelessWidget {
  const ReceiveSendBottomSheet({Key key}) : super(key: key);

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
            GetX<SendReceiveController>(
                init: SendReceiveController(),
                builder: (controller) {
                  final selectedSection = controller.sendReciveBottoSheet;
                  bool isSend = selectedSection == SendReceive.Send;
                  bool isReceive = selectedSection == SendReceive.Receive;
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 400),
                    height:
                        controller.sendReciveBottoSheet == SendReceive.NON ||
                                controller.sendReciveBottoSheet ==
                                    SendReceive.Receive
                            ? getHeightWidth(context, true) * 0.30
                            : getHeightWidth(context, true) * 0.70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: context.theme.backgroundColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        )),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        buildHeightBox(
                            context,
                            controller.sendReciveBottoSheet ==
                                        SendReceive.NON ||
                                    controller.sendReciveBottoSheet ==
                                        SendReceive.Receive
                                ? 0.10
                                : 0.08),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller
                                    .sendReciveBottoSheet(SendReceive.Receive);
                                Future.delayed(Duration(seconds: 1), () {
                                  Get.to(ReceiveViaQRCode());
                                });
                              },
                              child: Column(
                                children: [
                                  CircleAvatar(
                                      radius: 35,
                                      backgroundColor: Color.fromRGBO(
                                          82, 134, 255, !isReceive ? 90 : 1),
                                      child: Icon(
                                        Icons.arrow_downward,
                                        color: Colors.black,
                                        size: 25,
                                      )),
                                  buildHeightBox(context, 0.01),
                                  GenericText(
                                    title: "Receive",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    textColor: !isReceive
                                        ? Colors.grey[400]
                                        : context.theme.primaryColor,
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller
                                    .sendReciveBottoSheet(SendReceive.Send);
                              },
                              child: Column(
                                children: [
                                  CircleAvatar(
                                      radius: 35,
                                      backgroundColor: Color.fromRGBO(
                                          187, 134, 252, isSend ? 1 : 90),
                                      child: Icon(
                                        Icons.arrow_upward,
                                        color: Colors.black,
                                        size: 25,
                                      )),
                                  buildHeightBox(context, 0.01),
                                  GenericText(
                                    title: "Send",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    textColor: !isSend
                                        ? Colors.grey[400]
                                        : context.theme.primaryColor,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        controller.sendReciveBottoSheet == SendReceive.NON
                            ? Container()
                            : AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: [
                                    buildHeightBox(context, 0.02),
                                    Divider(
                                      endIndent: 30,
                                      indent: 30,
                                    ),
                                    buildHeightBox(context, 0.03),
                                    GenericCard(
                                      offset: Offset(0, 2),
                                      child: buildListTile(
                                          leadingImage:
                                              "assets/images/wallet.png",
                                          onTap: () {
                                            Get.to(SelectAsset());
                                          },
                                          title: "Wallet Address",
                                          context: context,
                                          trailing: Icons.chevron_right),
                                      elevation: 1,
                                      height:
                                          getHeightWidth(context, true) * 0.10,
                                      width: double.infinity,
                                    ),
                                    buildHeightBox(context, 0.02),
                                    GenericCard(
                                      offset: Offset(0, 2),
                                      child: buildListTile(
                                          leadingImage:
                                              "assets/images/contact.png",
                                          onTap: () {
                                            Get.to(Contacts());
                                          },
                                          title: "Contact",
                                          context: context,
                                          trailing: Icons.chevron_right),
                                      elevation: 1,
                                      height:
                                          getHeightWidth(context, true) * 0.10,
                                      width: double.infinity,
                                    ),
                                    buildHeightBox(context, 0.02),
                                    GenericCard(
                                      offset: Offset(0, 2),
                                      child: buildListTile(
                                          leadingImage: "assets/images/Qr.png",
                                          onTap: () {
                                            Get.to(QRCodeConfirmed());
                                          },
                                          title: "QR Code",
                                          context: context,
                                          trailing: Icons.chevron_right),
                                      elevation: 1,
                                      height:
                                          getHeightWidth(context, true) * 0.10,
                                      width: double.infinity,
                                    ),
                                  ],
                                ),
                              )
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }

  ListTile buildListTile(
      {String title,
      String leadingImage,
      IconData trailing,
      Function onTap,
      BuildContext context}) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(leadingImage),
      ),
      title: GenericText(
        title: title,
        fontSize: 18,
        textColor: context.textTheme.headline1.color,
      ),
      trailing: Icon(
        trailing,
        size: 30,
        color: context.textTheme.headline1.color,
      ),
    );
  }
}
