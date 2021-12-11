import 'package:get/get.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:clipboard/clipboard.dart';

import '../home/bottom_nav_screen.dart';
import '../../utils/widgets/toast.dart';
import './widgets/seed_phrase_dialog.dart';

class AccountInformationScreen extends StatefulWidget {
  const AccountInformationScreen({Key key}) : super(key: key);

  @override
  State<AccountInformationScreen> createState() =>
      _AccountInformationScreenState();
}

class _AccountInformationScreenState extends State<AccountInformationScreen> {
  bool isShown = false;
  bool isSelected = true;
  bool isPasswordSeen = false;

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
          'Account Information',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: context.theme.primaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mq.width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: mq.height * 0.02,
            ),
            Text(
              'Secure your wallet',
              style: TextStyle(
                fontSize: 16.5,
                fontWeight: FontWeight.w600,
                color: context.theme.primaryColor,
              ),
            ),
            SizedBox(
              height: mq.height * 0.02,
            ),
            RichText(
              text: TextSpan(
                text: 'Remember to write down your ',
                style: TextStyle(
                  color: context.theme.primaryColor,
                  height: 1.5,
                  fontSize: 14.5,
                ),
                children: [
                  TextSpan(
                    text: 'Seed phrase',
                    style: TextStyle(
                      color: context.theme.canvasColor,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        buildBottomSheet(mq, context);
                      },
                  ),
                  TextSpan(
                    text:
                        ' somewhere secure and accessible. You will be asked to share your private key or seed phrase by scammers - so be very careful. The private key is intended for the wallet’s owner only.',
                    style: TextStyle(
                      color: context.theme.primaryColor,
                      height: 1.5,
                      fontSize: 14.5,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: mq.height * 0.04,
            ),
            Row(
              children: [
                Text(
                  'Show account information',
                  style: TextStyle(
                    fontSize: 16.5,
                    fontWeight: FontWeight.w600,
                    color: context.theme.primaryColor,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isShown = !(isShown);
                    });
                  },
                  icon: isShown == false
                      ? Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: context.theme.primaryColor,
                        )
                      : Icon(
                          Icons.keyboard_arrow_up_sharp,
                          color: context.theme.primaryColor,
                        ),
                ),
              ],
            ),
            if (isShown == true) buildAccountInfo(mq),
            if (isShown == true)
              SizedBox(
                height: mq.height * 0.01,
              ),
            if (isShown == false) const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  value: isSelected,
                  onChanged: (_) {
                    setState(() {
                      isSelected = !(isSelected);
                    });
                  },
                  fillColor: MaterialStateColor.resolveWith(
                    (states) => context.theme.canvasColor,
                  ),
                ),
                SizedBox(
                  width: mq.width * 0.8,
                  child: Text(
                    'I understand that Surf Inc. can not recover my wallet and funds. It is my own responsibility to store my seed phrase in a safe place',
                    style: TextStyle(
                      color: context.theme.primaryColor,
                      height: 1.5,
                      fontSize: 14.5,
                    ),
                  ),
                ),
              ],
            ),
            if (isShown == false)
              SizedBox(
                height: mq.height * 0.04,
              ),
            if (isShown == true) const Spacer(),
            Center(child: buildContinueButton(mq)),
            SizedBox(
              height: mq.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContinueButton(Size mq) {
    return SizedBox(
      height: 48,
      width: mq.width * 0.8,
      child: ElevatedButton(
        onPressed: isSelected == true
            ? () {
                Get.to(
                  () => BottomNavScreen(),
                );
              }
            : () {},
        style: ElevatedButton.styleFrom(
          elevation: 1,
          primary: isSelected == true
              ? context.theme.canvasColor
              : context.theme.canvasColor.withOpacity(0.25),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: const Text(
          'Continue & Finish',
          style: TextStyle(
            fontSize: 16,
            letterSpacing: 1,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget buildAccountInfo(Size mq) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: mq.width * 0.04, horizontal: mq.width * 0.04),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: context.theme.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Seed phrase :',
                style: TextStyle(
                    color: Color.fromRGBO(160, 160, 162, 1), fontSize: 16),
              ),
              IconButton(
                icon: Icon(
                  Icons.copy,
                  color: context.theme.canvasColor,
                  size: 20,
                ),
                onPressed: () async {
                  await FlutterClipboard.copy(
                      'Book man test spoon wallet normal easy show hand slow rest');
                  toast('Copied to clipboard');
                },
              ),
            ],
          ),
          SizedBox(
            height: mq.height * 0.01,
          ),
          Text(
            'Book man test spoon wallet normal easy show hand slow rest',
            style: TextStyle(
                color: context.theme.primaryColor, fontSize: 14.5, height: 1.5),
          ),
          SizedBox(
            height: mq.height * 0.01,
          ),
          const Divider(
            color: Color.fromRGBO(160, 160, 162, 1),
          ),
          SizedBox(
            height: mq.height * 0.01,
          ),
          Row(
            children: [
              const Text(
                'Password: ',
                style: TextStyle(
                    color: Color.fromRGBO(160, 160, 162, 1), fontSize: 16),
              ),
              const SizedBox(
                width: 10,
              ),
              isPasswordSeen == true
                  ? Text(
                      'Account#44!',
                      style: TextStyle(
                          color: context.theme.primaryColor, fontSize: 16),
                    )
                  : Text(
                      '*********',
                      style: TextStyle(
                          color: context.theme.primaryColor, fontSize: 16),
                    ),
              const Spacer(),
              IconButton(
                icon: Icon(
                  isPasswordSeen == true
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: context.theme.canvasColor,
                  size: 20,
                ),
                onPressed: () {
                  setState(() {
                    isPasswordSeen = !(isPasswordSeen);
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
