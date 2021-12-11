import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

void buildBottomSheet(Size mq, BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (ctx) => Container(
      height: mq.height * 0.58,
      padding: EdgeInsets.all(mq.width * 0.04),
      color: context.theme.backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Seed Phrase',
            style: TextStyle(
              color: context.theme.primaryColor,
              fontWeight: FontWeight.bold,
              height: 1.5,
              fontSize: 17,
            ),
          ),
          SizedBox(
            height: mq.height * 0.02,
          ),
          Text(
            'A seed phrase consists of a few words that grant you access to your wallet. If you lose your device (or access to the device), you can simply gain access to your wallet again by reinstalling the app and entering your wallet’s seed phrase.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: context.theme.primaryColor,
              height: 1.5,
              fontSize: 14.5,
            ),
          ),
          SizedBox(
            height: mq.height * 0.02,
          ),
          SizedBox(
            height: 27,
            width: 27,
            child: Get.isDarkMode
                ? Image.asset('assets/images/infod.png')
                : Image.asset('assets/images/info.png'),
          ),
          const SizedBox(
            height: 2,
          ),
          Container(
            width: mq.width * 0.85,
            padding: EdgeInsets.all(mq.width * 0.04),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(252, 243, 203, 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              'If you lose your seed phrase, you lose access to your wallet. It can never be recovered.',
              style: TextStyle(
                fontSize: 14.5,
                height: 1.5,
                color: Color.fromRGBO(51, 51, 51, 1),
              ),
            ),
          ),
          SizedBox(
            height: mq.height * 0.04,
          ),
          SizedBox(
            height: 48,
            width: mq.width * 0.8,
            child: ElevatedButton(
              onPressed: () {
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                elevation: 1,
                primary: context.theme.canvasColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: const Text(
                'Got it',
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: mq.height * 0.04,
          ),
        ],
      ),
    ),
  );
}
