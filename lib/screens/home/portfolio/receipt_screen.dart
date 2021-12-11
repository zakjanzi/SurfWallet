import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../data/models/history_tile_modal.dart';

class ReceiptScreen extends StatelessWidget {
  final HistoryTileModel historyTileModel;

  const ReceiptScreen({Key key, this.historyTileModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: context.theme.backgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: context.theme.primaryColor,
          ),
        ),
        title: Text(
          'Bitcoin Sent',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: context.theme.primaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mq.width * 0.01),
        child: Column(
          children: [
            SizedBox(
              height: mq.height * 0.025,
            ),
            const Text(
              '-\$241.96',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '-0.0040BTC',
              style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 0.2,
                  color: context.theme.shadowColor),
            ),
            SizedBox(
              height: mq.height * 0.04,
            ),
            Divider(
              color: context.theme.shadowColor.withOpacity(0.5),
              thickness: 0.2,
            ),
            SizedBox(
              height: mq.height * 0.02,
            ),
            buildListTile(context, 'Price per coin', '\$44,0470.22'),
            buildListTile(context, 'Confirmations', '345'),
            buildListTile(context, 'Fee', '0.00000001 BTC'),
            buildListTile(context, 'To', '3DeLu7CZYD..3dW6P37pnp'),
            buildListTile(context, 'Date', '2:25pm - Aug 22, 2021'),
            buildListTile(context, 'Note', 'Thank you!'),
            buildListTile(context, 'Status', 'Completed'),
            const Spacer(),
            buildContinueButton(mq, context),
            SizedBox(
              height: mq.height * 0.07,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListTile(BuildContext context, String type, String value) {
    return ListTile(
      leading: Text(
        type,
        style: TextStyle(
            color: context.theme.shadowColor,
            fontSize: 16,
            fontWeight: FontWeight.w600),
      ),
      trailing: Text(
        value,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.5,
        ),
      ),
    );
  }

  Widget buildContinueButton(Size mq, BuildContext context) {
    return SizedBox(
      height: mq.height * 0.068,
      width: mq.width * 0.9,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 1,
          primary: context.theme.canvasColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        child: const Text(
          'View on block explorer',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
