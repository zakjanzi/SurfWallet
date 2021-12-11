import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './generate_wallet.dart';
import '../../utils/constants.dart';
import './widgets/onboard_content.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "type": "Money Transaction",
      "header": "Send And Receive Money",
      "text":
          "Send & receive digital assets from anyone, anywhere, instantly & for near-zero fees.",
      "image": "assets/images/onboard1.png"
    },
    {
      "type": "Security",
      "header": "Protect Your Assets",
      "text": "Protect your assets and investments in a secure wallet.",
      "image": "assets/images/onboard1.png"
    },
    {
      "type": "Portfolio",
      "header": "Portfolio Management",
      "text":
          "Invest & grow your portfolio. Get updates on the latest crypto news.",
      "image": "assets/images/onboard1.png"
    },
  ];

  changePage(int index) {
    setState(() {
      currentPage = index;
    });
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: PageView.builder(
              onPageChanged: changePage,
              controller: pageController,
              itemCount: splashData.length,
              itemBuilder: (context, index) => OnBoardContent(
                type: splashData[index]["type"],
                header: splashData[index]["header"],
                image: splashData[index]["image"],
                text: splashData[index]['text'],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: mq.width * 0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  splashData.length,
                  (index) => buildDot(index: index),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: currentPage == 2
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          buildGetStartedButton(mq),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'I already have a wallet',
                              style: TextStyle(
                                color: Color.fromRGBO(150, 150, 150, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: mq.width * 0.06),
                    child: Row(
                      children: [
                        buildSkipButton(),
                        const Spacer(),
                        buildNextButton(mq),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: currentPage == index ? 12 : 5,
      width: currentPage == index ? 12 : 5,
      decoration: BoxDecoration(
        color: currentPage == index
            ? context.theme.canvasColor
            : const Color.fromRGBO(224, 224, 224, 1),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget buildSkipButton() {
    return TextButton(
      onPressed: () {
        Get.to(
          () => const GenerateWalletScreen(),
        );
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      child: const Text(
        'Skip',
        style: TextStyle(
          color: Color.fromRGBO(150, 150, 150, 1),
          fontWeight: FontWeight.w600,
          letterSpacing: 1,
        ),
      ),
    );
  }

  Widget buildNextButton(Size mq) {
    return GestureDetector(
      onTap: () {
        pageController.jumpToPage(currentPage + 1);
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: context.theme.canvasColor.withOpacity(0.2),
            ),
            BoxShadow(
              blurRadius: 10,
              color: context.theme.canvasColor.withOpacity(0.2),
            ),
          ],
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.arrow_forward,
          size: 22,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget buildGetStartedButton(Size mq) {
    return SizedBox(
      height: 48,
      width: mq.width * 0.8,
      child: ElevatedButton(
        onPressed: () {
          Get.to(
            () => const GenerateWalletScreen(),
          );
        },
        style: ElevatedButton.styleFrom(
          elevation: 1,
          primary: context.theme.canvasColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: const Text(
          'Create a wallet',
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
}
