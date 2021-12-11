import 'dart:async';

import 'package:get/get.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:surf_wallet/service/token_service.dart';
import 'package:web3dart/credentials.dart';
import './seed_phrase.dart';
import '../../utils/widgets/toast.dart';
import './widgets/seed_phrase_dialog.dart';
import '../../data/controllers/generate_wallet_controller.dart';

class GenerateWalletScreen extends StatefulWidget {
  const GenerateWalletScreen({Key key}) : super(key: key);

  @override
  _GenerateWalletScreenState createState() => _GenerateWalletScreenState();
}

class _GenerateWalletScreenState extends State<GenerateWalletScreen> {
  final generateWalletController = Get.put(GenerateWalletController());

  int step = 0;
  double percent = 0.0;
  bool isCopied = false;
  bool changeButton = false;
  bool startAnimation1 = false;
  bool startAnimation2 = false;
  String randomMnemonic = '';
  String privateKey = '';
  String publicKeyNoHex = '';

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    void _GestureTap() async {
      setState(() {
        changeButton = true;
        step++;
        percent = 100;
        randomMnemonic = TokenService.generateMnemonic();
        privateKey = TokenService.getPrivateKey(randomMnemonic);
      });

      await Future.delayed(const Duration(milliseconds: 1800), () {});
      EthereumAddress publicKey = await TokenService.getPublicAddress(privateKey);
      setState(() {
        publicKeyNoHex = publicKey.hexNo0x;
        step++;

        if (step == 2) {
          Future.delayed(const Duration(milliseconds: 100), () {
            setState(() {
              startAnimation1 = true;
            });
          });
        }

        percent = 0;
        changeButton = false;
      });

      if (step == 4) {
        Future.delayed(const Duration(milliseconds: 100), () {
          setState(() {
            startAnimation2 = true;
          });
        });
      }
    }

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
          'Generate A Wallet',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: context.theme.primaryColor,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: mq.height * 0.01,
          ),
          if (step == 1)
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text(
                    'Public Key:  ',
                    style: TextStyle(
                      color: Get.isDarkMode
                          ? const Color.fromRGBO(165, 165, 165, 1)
                          : context.theme.primaryColor,
                    ),
                  ),
                  SizedBox(
                    width: mq.width * 0.7,
                    child: LinearPercentIndicator(
                      animation: true,
                      animationDuration: 1800,
                      lineHeight: 10.0,
                      percent: 1,
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: context.theme.canvasColor,
                      backgroundColor: Colors.grey[100],
                    ),
                  ),
                ],
              ),
            ),
          if (step >= 2)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: mq.width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Public Key:',
                    style: TextStyle(
                      color: Get.isDarkMode
                          ? const Color.fromRGBO(165, 165, 165, 1)
                          : context.theme.primaryColor,
                    ),
                  ),
                  SizedBox(
                    height: mq.height * 0.01,
                  ),
                  buildKeyTextField(mq, publicKeyNoHex, "public"),
                ],
              ),
            ),
          if (step == 2)
            SizedBox(
              height: mq.height * 0.15,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    right: startAnimation1 ? mq.width * 0.02 : -100,
                    left: startAnimation1 ? mq.width * 0.02 : 0,
                    duration: const Duration(seconds: 1),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: mq.width * 0.02),
                      child: Container(
                        // height: mq.height * 0.125,
                        padding: EdgeInsets.symmetric(vertical: mq.width * 0.03),
                        width: mq.width,
                        decoration: BoxDecoration(
                          color: context.theme.cardColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Icon(
                              Icons.info,
                              size: 20,
                              color: !Get.isDarkMode
                                  ? const Color.fromRGBO(140, 140, 140, 1)
                                  : const Color.fromRGBO(163, 162, 173, 1),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Your public key is similar to your bank\naccount number. Use it to receive\npayments.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: !Get.isDarkMode
                                      ? const Color.fromRGBO(52, 52, 52, 1)
                                      : const Color.fromRGBO(163, 162, 173, 1),
                                  fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: context.theme.canvasColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          SizedBox(
            height: mq.height * 0.035,
          ),
          if (step == 3)
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text(
                    'Private Key:  ',
                    style: TextStyle(
                      color: Get.isDarkMode
                          ? const Color.fromRGBO(165, 165, 165, 1)
                          : context.theme.primaryColor,
                    ),
                  ),
                  SizedBox(
                    width: mq.width * 0.7,
                    child: LinearPercentIndicator(
                      animation: true,
                      animationDuration: 1800,
                      lineHeight: 10.0,
                      percent: percent / 100,
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: context.theme.canvasColor,
                      backgroundColor: Colors.grey[100],
                    ),
                  ),
                ],
              ),
            ),
          if (step >= 4)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: mq.width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Private Key:  ',
                    style: TextStyle(
                      color: Get.isDarkMode
                          ? const Color.fromRGBO(165, 165, 165, 1)
                          : context.theme.primaryColor,
                    ),
                  ),
                  SizedBox(
                    height: mq.height * 0.01,
                  ),
                  buildKeyTextField(mq, privateKey, "private"),
                ],
              ),
            ),
          if (step == 4)
            SizedBox(
              height: mq.height * 0.17,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    right: startAnimation2 ? mq.width * 0.02 : -100,
                    left: startAnimation2 ? mq.width * 0.02 : 0,
                    duration: const Duration(seconds: 1),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: mq.width * 0.02),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: mq.width * 0.03),
                        width: mq.width,
                        decoration: BoxDecoration(
                          color: context.theme.cardColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.info,
                              size: 20,
                              color: !Get.isDarkMode
                                  ? const Color.fromRGBO(140, 140, 140, 1)
                                  : const Color.fromRGBO(163, 162, 173, 1),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Your private key is your like your password\nMemorizing a bunch of random characters\nis hard, so let’s turn  your private key into\nhuman language.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: !Get.isDarkMode
                                      ? const Color.fromRGBO(52, 52, 52, 1)
                                      : const Color.fromRGBO(163, 162, 173, 1),
                                  fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: context.theme.canvasColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          if (step == 6)
            SizedBox(
              height: mq.height * 0.025,
            ),
          if (step >= 6)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: mq.width * 0.04),
              child: Text(
                'Seed phrase:  ',
                style: TextStyle(
                  color: Get.isDarkMode
                      ? const Color.fromRGBO(165, 165, 165, 1)
                      : context.theme.primaryColor,
                ),
              ),
            ),
          if (step == 5)
            SizedBox(
              height: mq.height * 0.05,
            ),
          if (step == 5)
            Center(
              child: SizedBox(
                width: mq.width * 0.7,
                child: LinearPercentIndicator(
                  animation: true,
                  animationDuration: 1800,
                  lineHeight: 10.0,
                  percent: percent / 100,
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: context.theme.canvasColor,
                  backgroundColor: Colors.grey[100],
                ),
              ),
            ),
          if (step == 6)
            Column(
              children: [
                SizedBox(
                  height: mq.height * 0.034,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: getRandomMnemonicComponent().sublist(0, 4),
                ),
                SizedBox(
                  height: mq.height * 0.036,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: getRandomMnemonicComponent().sublist(4, 8),
                ),
                SizedBox(
                  height: mq.height * 0.036,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: getRandomMnemonicComponent().sublist(8, 12),
                ),
                SizedBox(
                  height: mq.height * 0.09,
                ),
                SizedBox(
                  width: mq.width * 0.26,
                  height: 47,
                  child: OutlinedButton(
                    onPressed: () async {
                      await FlutterClipboard.copy(randomMnemonic);
                      toast('Copied to clipboard');
                      setState(() {
                        isCopied = true;
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: context.theme.canvasColor,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Copy',
                      style: TextStyle(
                        color: context.theme.primaryColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          const Spacer(),
          if (step <= 5)
            GestureDetector(
              onTap: _GestureTap,
              child: Center(
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  height: changeButton ? 100 : 70,
                  width: changeButton ? 100 : 70,
                  decoration: BoxDecoration(
                    border: Border.all(color: context.theme.canvasColor),
                    shape: BoxShape.circle,
                  ),
                  child: Get.isDarkMode
                      ? Padding(
                          padding: const EdgeInsets.all(12),
                          child: Image.asset(
                            'assets/images/finger1.png',
                            fit: BoxFit.fill,
                          ),
                        )
                      : Image.asset(
                          'assets/images/finger.png',
                          fit: BoxFit.fill,
                        ),
                ),
              ),
            ),
          SizedBox(
            height: mq.height * 0.01,
          ),
          step >= 6
              ? Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: context.theme.primaryColor,
                                )),
                            child: Padding(
                              padding: const EdgeInsets.all(3.5),
                              child: Text(
                                '?',
                                style: TextStyle(
                                  color: context.theme.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'What is a ',
                              style: TextStyle(
                                color: context.theme.primaryColor,
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
                                  text: ' and why is it important?',
                                  style: TextStyle(
                                    color: context.theme.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: mq.height * 0.02,
                      ),
                      buildContinueButton(mq),
                      SizedBox(
                        height: mq.height * 0.02,
                      ),
                    ],
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Tap to Generate Your ',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: context.theme.canvasColor,
                      ),
                    ),
                    if (step == 0)
                      Text(
                        'Public Key',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: context.theme.canvasColor,
                        ),
                      ),
                    if (step == 2)
                      Text(
                        'Private Key',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: context.theme.canvasColor,
                        ),
                      ),
                    if (step == 4 || step == 5)
                      Text(
                        'Seed phrase',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: context.theme.canvasColor,
                        ),
                      ),
                  ],
                ),
          if (step <= 5)
            SizedBox(
              height: mq.height * 0.07,
            ),
          SizedBox(
            height: mq.height * 0.03,
          ),
        ],
      ),
    );
  }

  List<Widget> getRandomMnemonicComponent() {
    List<Widget> widgetList = randomMnemonic
        .split(" ")
        .map((element) => Text(
              element,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Get.isDarkMode
                    ? const Color.fromRGBO(165, 165, 165, 1)
                    : context.theme.primaryColor,
              ),
            ))
        .toList();
    return widgetList;
  }

  Widget buildKeyTextField(Size mq, String keyName, String keyType) {
    print("keyName: $keyName, keyType: $keyType");
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 11),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: context.theme.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              (keyType == "public") ? keyName : "${keyName.substring(0, 33)}...",
              style: TextStyle(
                fontSize: 15,
                color: context.theme.primaryColor,
              ),
            ),
            if (keyType == "private")
              IconButton(
                icon: Icon(
                  Icons.copy,
                  color: context.theme.canvasColor,
                ),
                onPressed: () async {
                  await FlutterClipboard.copy(privateKey);
                  toast('Copied to clipboard');
                },
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
        onPressed: isCopied == false
            ? () {}
            : () {
                Navigator.pushNamed(context, "seed_phrase");
              },
        style: ElevatedButton.styleFrom(
          elevation: 1,
          primary: isCopied == false
              ? context.theme.canvasColor.withOpacity(0.25)
              : context.theme.canvasColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: const Text(
          'Continue',
          style: TextStyle(
            fontSize: 16,
            letterSpacing: 1,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
