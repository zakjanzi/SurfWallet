import 'package:flutter/material.dart';
import 'package:surf_wallet/screens/send_receive/select_assets.dart';
import 'package:surf_wallet/utils/constants.dart';
import 'package:surf_wallet/utils/widgets/appbar.dart';
import 'package:surf_wallet/utils/widgets/genericButton.dart';
import 'package:surf_wallet/utils/widgets/genericText.dart';
import 'package:surf_wallet/utils/widgets/screenBody.dart';
import 'package:get/get.dart';

class Sent extends StatelessWidget {
  const Sent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: buildGenricAppBar(context: context, title: "Bitcoin Sent"),
      body: AppBody(
          child: Column(
        children: [
          buildHeightBox(context, 0.05),
          GenericText(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            title: "-\$241.96",
          ),
          buildHeightBox(context, 0.01),
          GenericText(
            fontSize: 16,
            title: "-0.0040BTC",
          ),
          buildHeightBox(context, 0.05),
          Divider(
            color: context.theme.shadowColor,
          ),
          buildHeightBox(context, 0.02),
          buildRow(context, "Price per coin", "\$44,0470.22"),
          buildRow(context, "Confirmations", "345"),
          buildRow(context, "Fee", "0.00000001 BTC "),
          buildRow(context, "To", "3DeLu7CZYD..3dW6P37pnp"),
          buildRow(context, "Date", "2:25pm - Aug 22, 2021"),
          buildRow(context, "Note", "Thank you!"),
          buildRow(context, "Status", "Completed"),
          Spacer(),
          GenericButton(
            onPressed: () {
              Get.offAll(SelectAsset());
            },
            title: "View on block  explorer",
            width: double.infinity,
          ),
          buildHeightBox(context, 0.10),
        ],
      )),
    );
  }

  Widget buildRow(BuildContext context, String title, String subTitle) {
    return Container(
      margin: EdgeInsets.only(bottom: 30, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GenericText(
            fontSize: 16,
            title: title,
            textColor: context.theme.shadowColor,
          ),
          GenericText(
            fontSize: 16,
            title: subTitle,
          ),
        ],
      ),
    );
  }
}
