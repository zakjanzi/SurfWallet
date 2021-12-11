import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:surf_wallet/screens/buy_sell/feedback_screen.dart';
import 'package:surf_wallet/screens/buy_sell/open_trade.dart';

class OfferView extends StatelessWidget {
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
          'Offer View',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: context.theme.primaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mq.width * 0.04),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: mq.height * 0.02,
              ),
              Text(
                'You are the buyer',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: context.theme.primaryColor,
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                'Send your offer to the seller.',
                style: TextStyle(
                  color: context.theme.shadowColor,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: mq.height * 0.025,
              ),
              Row(
                children: [
                  Text(
                    'Method',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Get.isDarkMode
                          ? Color.fromRGBO(162, 161, 163, 1)
                          : Color.fromRGBO(43, 41, 42, 1),
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Container(
                    padding: EdgeInsets.all(11),
                    decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? Color.fromRGBO(33, 31, 42, 1)
                          : Color.fromRGBO(225, 225, 225, 1),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Text(
                      'Face-to-Face',
                      style: TextStyle(
                        color: context.theme.shadowColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: mq.height * 0.025,
              ),
              Text(
                'How much you want to buy?',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: context.theme.primaryColor,
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: mq.height * 0.015,
              ),
              Text(
                'I will Pay',
                style: TextStyle(color: context.theme.shadowColor),
              ),
              SizedBox(
                height: mq.height * 0.015,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: context.theme.shadowColor)),
                child: Row(
                  children: [
                    SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: TextField(
                        style: TextStyle(color: context.theme.primaryColor),
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter the amount you want ',
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                      color: Get.isDarkMode
                          ? Color.fromRGBO(33, 31, 42, 1)
                          : Color.fromRGBO(214, 214, 214, 1),
                      child: Text(
                        'LL',
                        style: TextStyle(
                          color: context.theme.primaryColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: mq.height * 0.04,
              ),
              Text(
                'For',
                style: TextStyle(color: context.theme.shadowColor),
              ),
              SizedBox(
                height: mq.height * 0.015,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: context.theme.shadowColor)),
                child: Row(
                  children: [
                    SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: TextField(
                        cursorColor: Colors.grey,
                        style: TextStyle(color: context.theme.primaryColor),
                        decoration: InputDecoration(
                          hintText: '0.0',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      color: Get.isDarkMode
                          ? Color.fromRGBO(33, 31, 42, 1)
                          : Color.fromRGBO(214, 214, 214, 1),
                      child: Text(
                        'BTC',
                        style: TextStyle(
                          color: context.theme.primaryColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: mq.height * 0.04,
              ),
              Row(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Color.fromRGBO(27, 90, 194, 1),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: CircleAvatar(
                          backgroundColor: Color.fromRGBO(212, 176, 92, 1),
                          radius: 5,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 11,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Ahmad Ahyani',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: context.theme.primaryColor,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: mq.width * 0.22,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 15,
                                width: 25,
                                child: Image.asset('assets/images/ras.png'),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Ras Beirut',
                                style: TextStyle(
                                  color: context.theme.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Seen 4m Ago',
                            style: TextStyle(
                              color: Color.fromRGBO(212, 176, 92, 1),
                            ),
                          ),
                          SizedBox(
                            width: mq.width * 0.31,
                          ),
                          Text(
                            'Cash in Person',
                            style: TextStyle(
                              color: Get.isDarkMode
                                  ? Color.fromRGBO(180, 180, 180, 1)
                                  : context.theme.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Total Volume Traded    ',
                        style: TextStyle(
                          color: context.theme.shadowColor,
                          fontSize: 15.5,
                        ),
                      ),
                      Text(
                        '~\$8,500',
                        style: TextStyle(
                          color: context.theme.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      Text(
                        'Total Number Of Trades    ',
                        style: TextStyle(
                          color: context.theme.shadowColor,
                          fontSize: 15.5,
                        ),
                      ),
                      Text(
                        '140',
                        style: TextStyle(
                            color: context.theme.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      Text(
                        'Avg Trading time    ',
                        style: TextStyle(
                            color: context.theme.shadowColor, fontSize: 15.5),
                      ),
                      Text(
                        '3 hours',
                        style: TextStyle(
                          color: context.theme.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: mq.height * 0.04,
              ),
              Text(
                'About the offer',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: context.theme.primaryColor,
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: mq.height * 0.03,
              ),
              Container(
                width: mq.width,
                height: mq.height * 0.075,
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Get.isDarkMode
                      ? Color.fromRGBO(45, 43, 53, 1)
                      : Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Buy Limit',
                      style: TextStyle(
                          color: context.theme.shadowColor, fontSize: 13),
                    ),
                    Text(
                      '900,000 - 100,000,000 LBP',
                      style: TextStyle(
                        color: context.theme.primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.5,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: mq.height * 0.02,
              ),
              Container(
                height: mq.height * 0.075,
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Get.isDarkMode
                      ? Color.fromRGBO(45, 43, 53, 1)
                      : Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Seller Rate',
                      style: TextStyle(
                          color: context.theme.shadowColor, fontSize: 13),
                    ),
                    Row(
                      children: [
                        Text(
                          '51,584,000.31 LBP',
                          style: TextStyle(
                            color: context.theme.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.5,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: mq.width * 0.14,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: !Get.isDarkMode ? Color.fromRGBO(235, 235, 235, 1) : Color.fromRGBO(33, 31, 42, 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             Image.asset('assets/images/aa_d.png',height: 16,),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                '5%',
                                style: TextStyle(
                                  color: Get.isDarkMode ? Color.fromRGBO(230, 230,230, 1) : Color.fromRGBO(60, 60, 60, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: mq.height * 0.04,
              ),
              Text(
                'Contact',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: context.theme.primaryColor,
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: mq.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: mq.width * 0.43,
                    height: mq.height * 0.075,
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Get.isDarkMode
                          ? Color.fromRGBO(45, 43, 53, 1)
                          : Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Whatsapp',
                          style: TextStyle(
                              color: context.theme.shadowColor, fontSize: 13),
                        ),
                        Text(
                          '+961 76 525 157',
                          style: TextStyle(
                            color: context.theme.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: mq.height * 0.075,
                    width: mq.width * 0.43,
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Get.isDarkMode
                          ? Color.fromRGBO(45, 43, 53, 1)
                          : Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Telegram',
                          style: TextStyle(
                              color: context.theme.shadowColor, fontSize: 13),
                        ),
                        Text(
                          '+961 76 525 157',
                          style: TextStyle(
                            color: context.theme.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: mq.height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Feedback (10)',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: context.theme.primaryColor,
                      fontSize: 17,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.to(
                        () => FeedBackScreen(),
                      );
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: context.theme.shadowColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: mq.height * 0.03,
              ),
              Container(
                height: mq.height * 0.1,
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Get.isDarkMode
                      ? Color.fromRGBO(45, 43, 53, 1)
                      : Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hicham domari',
                          style: TextStyle(
                              color: context.theme.shadowColor, fontSize: 14.5),
                        ),
                        Text(
                          'Sep 04 2021',
                          style: TextStyle(
                              color: context.theme.shadowColor, fontSize: 14.5),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Good Trader A+++',
                          style: TextStyle(
                            color: context.theme.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.5,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.star,
                              size: 14,
                              color: context.theme.hoverColor,
                            ),
                            Icon(
                              Icons.star,
                              size: 14,
                              color: context.theme.hoverColor,
                            ),
                            Icon(
                              Icons.star,
                              size: 14,
                              color: context.theme.hoverColor,
                            ),
                            Icon(
                              Icons.star,
                              size: 14,
                              color: context.theme.hoverColor,
                            ),
                            Icon(
                              Icons.star,
                              size: 14,
                              color: context.theme.hoverColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: mq.height * 0.015,
              ),
              Container(
                height: mq.height * 0.1,
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Get.isDarkMode
                      ? Color.fromRGBO(45, 43, 53, 1)
                      : Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hicham domari',
                          style: TextStyle(
                              color: context.theme.shadowColor, fontSize: 14.5),
                        ),
                        Text(
                          'Sep 04 2021',
                          style: TextStyle(
                              color: context.theme.shadowColor, fontSize: 14.5),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Very slow',
                          style: TextStyle(
                            color: context.theme.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.5,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.star,
                              size: 14,
                              color: Color.fromRGBO(200, 200, 200, 1),
                            ),
                            Icon(
                              Icons.star,
                              size: 14,
                              color: Color.fromRGBO(200, 200, 200, 1),
                            ),
                            Icon(
                              Icons.star,
                              size: 14,
                              color: Color.fromRGBO(200, 200, 200, 1),
                            ),
                            Icon(
                              Icons.star,
                              size: 14,
                              color: Color.fromRGBO(200, 200, 200, 1),
                            ),
                            Icon(
                              Icons.star,
                              size: 14,
                              color: Color.fromRGBO(200, 200, 200, 1),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: mq.height * 0.03,
              ),
              buildContinueButton(mq, context),
              SizedBox(
                height: mq.height * 0.08,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContinueButton(Size mq, BuildContext context) {
    return SizedBox(
      height: mq.height * 0.068,
      width: mq.width * 0.9,
      child: ElevatedButton(
        onPressed: () {
          Get.to(() => OpenTrade(),);
        },
        style: ElevatedButton.styleFrom(
          elevation: 1,
          primary: Get.isDarkMode
              ? Color.fromRGBO(57, 13, 160, 1)
              : context.theme.canvasColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        child: const Text(
          'Open Trade',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
