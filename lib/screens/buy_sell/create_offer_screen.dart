import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateOffer extends StatefulWidget {
  @override
  State<CreateOffer> createState() => _CreateOfferState();
}

class _CreateOfferState extends State<CreateOffer> {
  bool isSelected1 = true;
  bool isSelected2 = true;
  int index = 0;
  int tabIndex = 0;

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
          'Create An Offer',
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
                height: mq.height * 0.015,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Get.isDarkMode
                      ? const Color.fromRGBO(45, 43, 53, 1)
                      : const Color.fromRGBO(235, 235, 235, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (tabIndex == 1)
                      const SizedBox(
                        width: 25,
                      ),
                    if (tabIndex == 0)
                      GestureDetector(
                        onTap: () {
                          tabIndex = 0;
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Get.isDarkMode
                                ? const Color.fromRGBO(33, 31, 42, 1)
                                : context.theme.hoverColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(
                            'Buy',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    if (tabIndex == 1)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            tabIndex = 0;
                          });
                        },
                        child: const Text(
                          'Buy',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(112, 112, 112, 1),
                          ),
                        ),
                      ),
                    const SizedBox(
                      width: 15,
                    ),
                    if (tabIndex == 1)
                      Container(
                        decoration: BoxDecoration(
                          color: Get.isDarkMode
                              ? const Color.fromRGBO(33, 31, 42, 1)
                              : context.theme.hoverColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Text(
                          'Sell',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    if (tabIndex == 0)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            tabIndex = 1;
                          });
                        },
                        child: const Text(
                          'Sell',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(112, 112, 112, 1),
                          ),
                        ),
                      ),
                    if (tabIndex == 0)
                      const SizedBox(
                        width: 25,
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: mq.height * 0.027,
              ),
              Text(
                'Your offer will be listed on the Buy Bitcoin page.',
                style: TextStyle(
                  fontSize: 15.5,
                  color: context.theme.shadowColor,
                ),
              ),
              SizedBox(
                height: mq.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Choose your cryptocurrency',
                    style: TextStyle(
                      fontSize: 19.5,
                      fontWeight: FontWeight.bold,
                      color: context.theme.primaryColor,
                    ),
                  ),
                  Icon(
                    Icons.search,
                    color: !Get.isDarkMode
                        ? Color.fromRGBO(224, 224, 224, 1)
                        : context.theme.shadowColor,
                  ),
                ],
              ),
              SizedBox(
                height: mq.height * 0.02,
              ),
              SizedBox(
                height: mq.height * 0.055,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildCrypto(0, 'crypto1', 'Bitcoin'),
                    buildCrypto(1, 'crypto2', 'Ethereum'),
                    buildCrypto(2, 'crypto4', 'USDT'),
                    buildCrypto(3, 'crypto3', 'DAI'),
                  ],
                ),
              ),
              if (tabIndex == 1)
                SizedBox(
                  height: 14,
                ),
              if (tabIndex == 1)
                Row(
                  children: [
                    Text(
                      '1 BTC ',
                      style: TextStyle(
                        color: context.theme.shadowColor,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '= \$63,587.33',
                      style: TextStyle(
                        color: context.theme.hoverColor,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              SizedBox(
                height: mq.height * 0.03,
              ),
              Text(
                'Payment method',
                style: TextStyle(
                  fontSize: 19.5,
                  fontWeight: FontWeight.bold,
                  color: context.theme.primaryColor,
                ),
              ),
              SizedBox(
                height: mq.height * 0.02,
              ),
              Container(
                width: mq.width,
                height: 50,
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Color.fromRGBO(214, 214, 214, 1),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Cash in person',
                      style: TextStyle(
                        fontSize: 15,
                        color: context.theme.primaryColor,
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down_outlined),
                  ],
                ),
              ),
              SizedBox(
                height: mq.height * 0.03,
              ),
              if (tabIndex == 1)
                Text(
                  'Preferred currency to get paid with',
                  style: TextStyle(
                    fontSize: 19.5,
                    fontWeight: FontWeight.bold,
                    color: context.theme.primaryColor,
                  ),
                ),
              if (tabIndex == 0)
                Text(
                  'Preferred currency to pay with',
                  style: TextStyle(
                    fontSize: 19.5,
                    fontWeight: FontWeight.bold,
                    color: context.theme.primaryColor,
                  ),
                ),
              SizedBox(
                height: mq.height * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  openDialogBox(mq);
                },
                child: Container(
                  width: mq.width,
                  height: 50,
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Color.fromRGBO(214, 214, 214, 1),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        preferredCurr,
                        style: TextStyle(
                          fontSize: 15,
                          color: context.theme.primaryColor,
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_down_outlined),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: mq.height * 0.03,
              ),
              Text(
                'Amount',
                style: TextStyle(
                  fontSize: 19.5,
                  fontWeight: FontWeight.bold,
                  color: context.theme.primaryColor,
                ),
              ),
              SizedBox(
                height: mq.height * 0.02,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: context.theme.hoverColor,
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    'Fixed Amount',
                    style: TextStyle(
                      color: context.theme.primaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 14,
              ),
              Container(
                width: mq.width,
                height: 50,
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Color.fromRGBO(214, 214, 214, 1),
                  ),
                ),
              ),
              SizedBox(
                height: mq.height * 0.02,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: context.theme.shadowColor,
                      child: CircleAvatar(
                        radius: 9,
                        backgroundColor:
                            Get.isDarkMode ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    'Ranged Amount',
                    style: TextStyle(
                      color: context.theme.primaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: mq.height * 0.025,
              ),
              Text(
                'Minimum',
                style: TextStyle(
                  color: context.theme.primaryColor,
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Container(
                width: mq.width,
                height: 50,
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Color.fromRGBO(214, 214, 214, 1),
                  ),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                'Maximum',
                style: TextStyle(
                  color: context.theme.primaryColor,
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Container(
                width: mq.width,
                height: 50,
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Color.fromRGBO(214, 214, 214, 1),
                  ),
                ),
              ),
              SizedBox(
                height: mq.height * 0.03,
              ),
              Text(
                'Trade Pricing',
                style: TextStyle(
                  fontSize: 19.5,
                  fontWeight: FontWeight.bold,
                  color: context.theme.primaryColor,
                ),
              ),
              SizedBox(
                height: mq.height * 0.02,
              ),
              Row(
                children: [
                  index == 0
                      ? CircleAvatar(
                          radius: 10,
                          backgroundColor: context.theme.hoverColor,
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.white,
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            setState(() {
                              index = 0;
                            });
                          },
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: context.theme.shadowColor,
                            child: CircleAvatar(
                              radius: 9,
                              backgroundColor:
                                  Get.isDarkMode ? Colors.black : Colors.white,
                            ),
                          ),
                        ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    'Market Price',
                    style: TextStyle(
                      color: context.theme.primaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: mq.width * 0.05,
                  ),
                  Expanded(
                    child: Text(
                      'Your offer’s selling price will change according to the market price of Bitcoin.',
                      style: TextStyle(
                        height: 1.4,
                        color: context.theme.shadowColor,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: mq.height * 0.02,
              ),
              Row(
                children: [
                  index == 1
                      ? CircleAvatar(
                          radius: 10,
                          backgroundColor: context.theme.hoverColor,
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.white,
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            setState(() {
                              index = 1;
                            });
                          },
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: context.theme.shadowColor,
                            child: CircleAvatar(
                              radius: 9,
                              backgroundColor:
                                  Get.isDarkMode ? Colors.black : Colors.white,
                            ),
                          ),
                        ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    'Fixed Price',
                    style: TextStyle(
                      color: context.theme.primaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: mq.width * 0.05,
                  ),
                  Expanded(
                    child: Text(
                      'Your offer’s selling price will change according to the market price of Bitcoin.',
                      style: TextStyle(
                        height: 1.4,
                        color: context.theme.shadowColor,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: mq.height * 0.03,
              ),
              Text(
                'Offer Margin',
                style: TextStyle(
                  fontSize: 19.5,
                  fontWeight: FontWeight.bold,
                  color: index == 1
                      ? Color.fromRGBO(214, 214, 214, 1)
                      : context.theme.primaryColor,
                ),
              ),
              SizedBox(
                height: mq.height * 0.02,
              ),
              Container(
                width: mq.width * 0.45,
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Color.fromRGBO(214, 214, 214, 1),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Get.isDarkMode
                          ? index == 1
                          ? Color.fromRGBO(78, 77, 84, 1)
                          : Color.fromRGBO(180, 180, 180, 1)
                          : index == 1
                          ? Color.fromRGBO(214, 214, 214, 1)
                          : Color.fromRGBO(180, 180, 180, 1),
                      radius: 10,
                      child: Icon(
                        Icons.remove,
                        color: Get.isDarkMode ? Colors.black : Colors.white,
                        size: 14,
                      ),
                    ),
                    Text(
                      '0%',
                      style: TextStyle(
                          fontSize: 15.5,
                          color: Get.isDarkMode
                              ? index == 0
                                  ? Colors.white
                                  : Color.fromRGBO(214, 214, 214, 1)
                              : index == 0
                                  ? Colors.black
                                  : Color.fromRGBO(214, 214, 214, 1),
                          fontWeight: FontWeight.bold),
                    ),
                    CircleAvatar(
                      backgroundColor: Get.isDarkMode
                          ? index == 1
                          ? Color.fromRGBO(78, 77, 84, 1)
                          : Color.fromRGBO(180, 180, 180, 1)
                          : index == 1
                          ? Color.fromRGBO(214, 214, 214, 1)
                          : Color.fromRGBO(180, 180, 180, 1),
                      radius: 10,
                      child: Icon(
                        Icons.add,
                        color: Get.isDarkMode ? Colors.black : Colors.white,
                        size: 14,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: mq.height * 0.02,
              ),
              if (index == 0)
                Text(
                  'Current Bitcoin market price: 89,440,831.89LL Offer price: 89,440,831.89 per Bitcoin (100% of the market price for every Bitcoin you buy.',
                  style: TextStyle(
                    height: 1.4,
                    color: context.theme.shadowColor,
                    fontSize: 17,
                  ),
                ),
              SizedBox(
                height: mq.height * 0.03,
              ),
              Text(
                'Fixed',
                style: TextStyle(
                  fontSize: 19.5,
                  fontWeight: FontWeight.bold,
                  color: !Get.isDarkMode
                      ? index == 0
                          ? Color.fromRGBO(214, 214, 214, 1)
                          : context.theme.primaryColor
                      : index == 0
                          ? Color.fromRGBO(100, 100, 100, 1)
                          : context.theme.primaryColor,
                ),
              ),
              SizedBox(
                height: mq.height * 0.02,
              ),
              Container(
                width: mq.width,
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: !Get.isDarkMode
                        ? index == 0
                            ? Color.fromRGBO(214, 214, 214, 1)
                            : context.theme.primaryColor
                        : index == 0
                            ? Color.fromRGBO(100, 100, 100, 1)
                            : context.theme.primaryColor,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Get.isDarkMode
                          ? index == 0
                              ? Color.fromRGBO(78, 77, 84, 1)
                              : Color.fromRGBO(180, 180, 180, 1)
                          : index == 0
                              ? Color.fromRGBO(214, 214, 214, 1)
                              : Color.fromRGBO(180, 180, 180, 1),
                      radius: 10,
                      child: Icon(
                        Icons.remove,
                        color: !Get.isDarkMode ? Colors.white : Colors.black,
                        size: 14,
                      ),
                    ),
                    index == 1
                        ? Text(
                            '89,440,831.89LL',
                            style: TextStyle(
                                fontSize: 15.5,
                                color: Get.isDarkMode
                                    ? Color.fromRGBO(214, 214, 214, 1)
                                    : Color.fromRGBO(162, 163, 161, 1),
                                fontWeight: FontWeight.bold),
                          )
                        : Text(
                            '\$57,589.36',
                            style: TextStyle(
                                fontSize: 15.5,
                                color: Get.isDarkMode
                                    ? Color.fromRGBO(78, 77, 84, 1)
                                    : Color.fromRGBO(214, 214, 214, 1),
                                fontWeight: FontWeight.bold),
                          ),
                    CircleAvatar(
                      backgroundColor: Get.isDarkMode
                          ? index == 0
                              ? Color.fromRGBO(78, 77, 84, 1)
                              : Color.fromRGBO(180, 180, 180, 1)
                          : index == 0
                              ? Color.fromRGBO(214, 214, 214, 1)
                              : Color.fromRGBO(180, 180, 180, 1),
                      radius: 10,
                      child: Icon(
                        Icons.add,
                        color: !Get.isDarkMode ? Colors.white : Colors.black,
                        size: 14,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: mq.height * 0.02,
              ),
              if (index == 1)
                Text(
                  'Current Bitcoin market price: 89,440,831.89LL Offer price: 89,440,831.89 per Bitcoin (100% of the market price for every Bitcoin you buy.',
                  style: TextStyle(
                    height: 1.4,
                    color: context.theme.shadowColor,
                    fontSize: 17,
                  ),
                ),
              SizedBox(
                height: mq.height * 0.03,
              ),
              Text(
                'Offer Terms',
                style: TextStyle(
                  fontSize: 19.5,
                  fontWeight: FontWeight.bold,
                  color: context.theme.primaryColor,
                ),
              ),
              SizedBox(
                height: mq.height * 0.02,
              ),
              Container(
                width: mq.width,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Color.fromRGBO(214, 214, 214, 1),
                  ),
                ),
                child: Text(
                  'List out your instructions for your trade partner.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromRGBO(214, 214, 214, 1),
                  ),
                ),
              ),
              SizedBox(
                height: mq.height * 0.02,
              ),
              Text(
                'Anybody who views your offer will see these terms. Keep them simple and clear to make your offer sound attractive.',
                style: TextStyle(
                  height: 1.4,
                  color: context.theme.shadowColor,
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: mq.height * 0.03,
              ),
              Text(
                'Trade Instructions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: context.theme.primaryColor,
                ),
              ),
              SizedBox(
                height: mq.height * 0.02,
              ),
              Container(
                width: mq.width,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Color.fromRGBO(214, 214, 214, 1),
                  ),
                ),
                child: Text(
                  'List out your instructions for your trade partner.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromRGBO(214, 214, 214, 1),
                  ),
                ),
              ),
              SizedBox(
                height: mq.height * 0.02,
              ),
              Text(
                'To ensure a successful trade be transparent about what you expect from your trade partner and list out what you need.',
                style: TextStyle(
                  height: 1.4,
                  color: context.theme.shadowColor,
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: mq.height * 0.02,
              ),
              Row(
                children: [
                  Checkbox(
                    value: isSelected1,
                    onChanged: (_) {
                      setState(() {
                        isSelected1 = !(isSelected1);
                      });
                    },
                    fillColor: MaterialStateColor.resolveWith(
                      (states) => context.theme.canvasColor,
                    ),
                  ),
                  Text(
                    'I agree to the ',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: context.theme.primaryColor,
                    ),
                  ),
                  Text(
                    'Terms of Service',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: context.theme.hoverColor,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: isSelected2,
                    onChanged: (_) {
                      setState(() {
                        isSelected2 = !(isSelected2);
                      });
                    },
                    fillColor: MaterialStateColor.resolveWith(
                      (states) => context.theme.canvasColor,
                    ),
                  ),
                  Text(
                    'I understand the risks',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: context.theme.primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: mq.height * 0.02,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: mq.width * 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: CircleAvatar(
                      backgroundColor: context.theme.hoverColor,
                      radius: 3.5,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Do not release the funds from escrow\nbefore receiving your payment in hand.',
                    style: TextStyle(
                        color: Get.isDarkMode
                            ? Colors.white
                            : context.theme.shadowColor,
                        fontSize: 15,
                        height: 1.2),
                  ),
                ],
              ),
              SizedBox(
                height: mq.height * 0.01,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: mq.width * 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: CircleAvatar(
                      backgroundColor: context.theme.hoverColor,
                      radius: 3.5,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Check the fiat notes before you release\nfunds from escrow.',
                    style: TextStyle(
                        color: Get.isDarkMode
                            ? Colors.white
                            : context.theme.shadowColor,
                        fontSize: 15,
                        height: 1.2),
                  ),
                ],
              ),
              SizedBox(
                height: mq.height * 0.01,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: mq.width * 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: CircleAvatar(
                      backgroundColor: context.theme.hoverColor,
                      radius: 3.5,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Always meet in a public place.',
                    style: TextStyle(
                        color: Get.isDarkMode
                            ? Colors.white
                            : context.theme.shadowColor,
                        fontSize: 15,
                        height: 1.2),
                  ),
                ],
              ),
              SizedBox(
                height: mq.height * 0.03,
              ),
              buildOpenTradeButton(mq, context),
              SizedBox(
                height: mq.height * 0.07,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildOpenTradeButton(Size mq, BuildContext context) {
    return SizedBox(
      height: mq.height * 0.068,
      width: mq.width * 0.9,
      child: ElevatedButton(
        onPressed: () {},
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
          'Post Offer',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  int cryptoIndex = 0;

  Widget buildCrypto(int index, String image, String name) {
    return GestureDetector(
      onTap: () {
        setState(() {
          cryptoIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          border: Border.all(
            color: cryptoIndex == index
                ? context.theme.hoverColor
                : Color.fromRGBO(202, 202, 202, 1),
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 14,
              backgroundImage: AssetImage('assets/images/$image.png'),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14.5,
                color: context.theme.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String preferredCurr = "Lebanese pound (LBP)";

  openDialogBox(Size mq) {
    Get.dialog(
      Dialog(
        elevation: 1,
        backgroundColor:
            Get.isDarkMode ? Color.fromRGBO(45, 43, 53, 1) : Colors.white,
        child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setter) => Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: mq.width,
                  height: mq.height * 0.07,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Color.fromRGBO(190, 190, 190, 1),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: context.theme.hoverColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: TextField(
                          cursorColor: Colors.grey,
                          style: TextStyle(
                            color: context.theme.primaryColor,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Search for currency',
                            hintStyle: TextStyle(
                              fontSize: 15,
                              color: Get.isDarkMode
                                  ? Color.fromRGBO(190, 190, 190, 1)
                                  : Color.fromRGBO(100, 100, 100, 1),
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: mq.height * 0.025,
                ),
                GestureDetector(
                  onTap: () {
                    setter(() {
                      preferredCurr = 'Lebanese pound (LBP)';
                    });
                    setState(() {});
                    Get.back();
                  },
                  child: Text(
                    'Lebanese pound (LBP)',
                    style: TextStyle(
                      fontSize: 15,
                      color: context.theme.primaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                GestureDetector(
                  onTap: () {
                    setter(() {
                      preferredCurr = 'United States Dollar (USD)';
                    });
                    setState(() {});
                    Get.back();
                  },
                  child: Text(
                    'United States Dollar (USD)',
                    style: TextStyle(
                      fontSize: 15,
                      color: context.theme.primaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                GestureDetector(
                  onTap: () {
                    setter(() {
                      preferredCurr = 'Euro (€)';
                    });
                    setState(() {});
                    Get.back();
                  },
                  child: Text(
                    'Euro (€)',
                    style: TextStyle(
                      fontSize: 15,
                      color: context.theme.primaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                GestureDetector(
                  onTap: () {
                    setter(() {
                      preferredCurr = 'Saudi Riyal (SAR)';
                    });
                    setState(() {});
                    Get.back();
                  },
                  child: Text(
                    'Saudi Riyal (SAR)',
                    style: TextStyle(
                      fontSize: 15,
                      color: context.theme.primaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                GestureDetector(
                  onTap: () {
                    setter(() {
                      preferredCurr = 'Turkish Lira (TL)';
                    });
                    setState(() {});
                    Get.back();
                  },
                  child: Text(
                    'Turkish Lira (TL)',
                    style: TextStyle(
                      fontSize: 15,
                      color: context.theme.primaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                GestureDetector(
                  onTap: () {
                    setter(() {
                      preferredCurr = 'Bahraini Dinar (BHD)';
                    });
                    setState(() {});
                    Get.back();
                  },
                  child: Text(
                    'Bahraini Dinar (BHD)',
                    style: TextStyle(
                      fontSize: 15,
                      color: context.theme.primaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                GestureDetector(
                  onTap: () {
                    setter(() {
                      preferredCurr = 'United Aram Emirates Dirham (AED)';
                    });
                    setState(() {});
                    Get.back();
                  },
                  child: Text(
                    'United Aram Emirates Dirham (AED)',
                    style: TextStyle(
                      fontSize: 15,
                      color: context.theme.primaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: mq.height * 0.07,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
