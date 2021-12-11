import 'dart:async';

import 'package:get/get.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
                  buildPublicTextField(mq, 'MIGfMA0GCSqGSlbKUH3VH'),
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
                      padding:
                          EdgeInsets.symmetric(horizontal: mq.width * 0.02),
                      child: Container(
                        // height: mq.height * 0.125,
                        padding:
                            EdgeInsets.symmetric(vertical: mq.width * 0.03),
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
                            const SizedBox(height: 5,),
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
                  buildPublicTextField(mq, 'MIGfMA0GCSqGSlbKUH2VH'),
                ],
              ),
            ),
          if (step == 4)
            SizedBox(
              height: mq.height * 0.17 ,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    right: startAnimation2 ? mq.width * 0.02 : -100,
                    left: startAnimation2 ? mq.width * 0.02 : 0,
                    duration: const Duration(seconds: 1),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: mq.width * 0.02),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: mq.width * 0.03),
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
                            const SizedBox(height: 5,),
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
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: mq.width * 0.04),
          //   child: Text(
          //     'Your private key is your like your password. Memorizing a bunch of random characters is hard, so let’s turn  your private key into human language.',
          //     textAlign: TextAlign.center,
          //     style: TextStyle(color: context.theme.focusColor, fontSize: 15),
          //   ),
          // ),
          // if (step == 5)
          //   Center(
          //     child: Column(
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         SizedBox(
          //           height: mq.height * 0.035,
          //         ),
          //         SizedBox(
          //           height: 26,
          //           width: 26,
          //           child: Get.isDarkMode
          //               ? Image.asset('assets/images/infod.png')
          //               : Image.asset('assets/images/info.png'),
          //         ),
          //         const SizedBox(
          //           height: 1,
          //         ),
          //         Container(
          //           width: mq.width * 0.85,
          //           padding: EdgeInsets.all(mq.width * 0.04),
          //           decoration: BoxDecoration(
          //             color: const Color.fromRGBO(252, 243, 203, 1),
          //             borderRadius: BorderRadius.circular(10),
          //           ),
          //           child: const Text(
          //             'Think of the private key as the password to your wallet. It\'s a bit difficult to memorize 35 characters, so let\'s simplify the private key by extracting a Seed Phrase from it.',
          //             style: TextStyle(
          //               fontSize: 14.5,
          //               height: 1.5,
          //               color: Color.fromRGBO(51, 51, 51, 1),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
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
                  children: [
                    Text(
                      'Book',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Get.isDarkMode
                            ? const Color.fromRGBO(165, 165, 165, 1)
                            : context.theme.primaryColor,
                      ),
                    ),
                    Text(
                      'man',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Get.isDarkMode
                            ? const Color.fromRGBO(165, 165, 165, 1)
                            : context.theme.primaryColor,
                      ),
                    ),
                    Text(
                      'man',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Get.isDarkMode
                            ? const Color.fromRGBO(165, 165, 165, 1)
                            : context.theme.primaryColor,
                      ),
                    ),
                    Text(
                      'test',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Get.isDarkMode
                            ? const Color.fromRGBO(165, 165, 165, 1)
                            : context.theme.primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: mq.height * 0.036,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'word',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Get.isDarkMode
                            ? const Color.fromRGBO(165, 165, 165, 1)
                            : context.theme.primaryColor,
                      ),
                    ),
                    Text(
                      'wallet',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Get.isDarkMode
                            ? const Color.fromRGBO(165, 165, 165, 1)
                            : context.theme.primaryColor,
                      ),
                    ),
                    Text(
                      'short',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Get.isDarkMode
                            ? const Color.fromRGBO(165, 165, 165, 1)
                            : context.theme.primaryColor,
                      ),
                    ),
                    Text(
                      'eyes',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Get.isDarkMode
                            ? const Color.fromRGBO(165, 165, 165, 1)
                            : context.theme.primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: mq.height * 0.036,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'apply',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Get.isDarkMode
                            ? const Color.fromRGBO(165, 165, 165, 1)
                            : context.theme.primaryColor,
                      ),
                    ),
                    Text(
                      'pencil',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Get.isDarkMode
                            ? const Color.fromRGBO(165, 165, 165, 1)
                            : context.theme.primaryColor,
                      ),
                    ),
                    Text(
                      'door',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Get.isDarkMode
                            ? const Color.fromRGBO(165, 165, 165, 1)
                            : context.theme.primaryColor,
                      ),
                    ),
                    Text(
                      'floor',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Get.isDarkMode
                            ? const Color.fromRGBO(165, 165, 165, 1)
                            : context.theme.primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: mq.height * 0.1,
                ),
                SizedBox(
                  width: mq.width * 0.26,
                  height: 47,
                  child: OutlinedButton(
                    onPressed: () async {
                      await FlutterClipboard.copy(
                          'Book man test spoon wallet normal easy show hand slow rest');
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
              onTap: () async {
                setState(() {
                  changeButton = true;
                  step++;
                  percent = 100;
                });

                await Future.delayed(const Duration(milliseconds: 1800), () {});

                setState(() {
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
              },
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
            height: mq.height * 0.028,
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

  Widget buildPublicTextField(Size mq, String keyName) {
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
              keyName,
              style: TextStyle(
                fontSize: 17,
                color: context.theme.primaryColor,
              ),
            ),
            if (keyName == "MIGfMA0GCSqGSlbKUH2VH")
              IconButton(
                icon: Icon(
                  Icons.copy,
                  color: context.theme.canvasColor,
                ),
                onPressed: () async {
                  await FlutterClipboard.copy('MIGfMA0GCSqGSlbKUH2VH');
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
                Get.to(
                  () => const SeedPhrase(),
                );
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
