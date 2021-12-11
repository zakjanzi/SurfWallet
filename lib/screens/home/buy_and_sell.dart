import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:surf_wallet/screens/buy_sell/create_offer_screen.dart';
import 'package:surf_wallet/screens/buy_sell/offerview.dart';

class BuyAndSellScreen extends StatefulWidget {
  BuyAndSellScreen({Key key}) : super(key: key);

  @override
  State<BuyAndSellScreen> createState() => _BuyAndSellScreenState();
}

class _BuyAndSellScreenState extends State<BuyAndSellScreen> {
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: context.theme.backgroundColor,
        elevation: 0,
        leading: Container(),
        title: Text(
          'Buy And Sell',
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
          children: [
            SizedBox(
              height: mq.height * 0.02,
            ),
            Row(
              children: [
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
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Text(
                              'Buy',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: context.theme.highlightColor,
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
                                : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(
                            'Sell',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: context.theme.highlightColor,
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
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.to(
                      () => CreateOffer(),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: context.theme.hoverColor,
                      ),
                      Text(
                        'Create An Offer',
                        style: TextStyle(
                          color: context.theme.hoverColor,
                          fontWeight: FontWeight.w600,
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
              children: [
                Text(
                  'All Offers',
                  style: TextStyle(
                    color: context.theme.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    buildLocationBottomSheet(mq, context);
                  },
                  child: Container(
                    height: 23,
                    child: Image.asset('assets/images/loca_buy.png'),
                  ),
                ),
                SizedBox(
                  width: 18,
                ),
                GestureDetector(
                  onTap: () {
                    buildBottomSheet(mq, context);
                  },
                  child: Container(
                    height: 15,
                    child: Image.asset('assets/images/option_buy.png'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: mq.height * 0.03,
            ),
            if (tabIndex == 0)
              buildMyOfferTile(
                tabIndex: tabIndex,
                personName: 'Ahmed A.',
                country: 'Ras Beirut',
                mq: mq,
                crypto: 'crypto1',
                name: 'BTC',
                limit: 'Selling 100,000 - 1,000,000 LBP',
                price: "247,478,000 LBP",
              ),
            if (tabIndex == 1)
              buildMyOfferTile(
                tabIndex: tabIndex,
                personName: 'Said D.',
                country: 'Byblos',
                mq: mq,
                crypto: 'crypto2',
                name: 'ETH',
                limit: 'Buying \$10 - \$10,000',
                price: "\$3730.25",
              ),
            SizedBox(
              height: mq.height * 0.02,
            ),
            Divider(color: Get.isDarkMode ? Color.fromRGBO(41, 41, 41, 1) : Color.fromRGBO(235, 235, 235, 1),),
            SizedBox(
              height: mq.height * 0.02,
            ),
            if (tabIndex == 0)
              buildMyOfferTile(
                tabIndex: tabIndex,
                personName: 'Ali B.',
                country: 'Broumana',
                mq: mq,
                crypto: 'crypto4',
                name: 'USDT',
                limit: 'Selling 1,415,000 LBP',
                price: "\$1",
              ),
            if (tabIndex == 1)
              buildMyOfferTile(
                tabIndex: tabIndex,
                personName: 'Oussama A.',
                country: 'Byblos',
                mq: mq,
                crypto: 'crypto3',
                name: 'USD',
                limit: 'Selling 1,415,000 LBP',
                price: "\$22,750 LBP",
              ),
          ],
        ),
      ),
    );
  }

  Widget buildMyOfferTile(
      {int tabIndex,
      String personName,
      String country,
      Size mq,
      String crypto,
      String name,
      String price,
      String limit,
      String rate}) {
    return Builder(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Color.fromRGBO(27, 90, 194, 1),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: 4,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '   $personName',
                    style: TextStyle(
                      color: context.theme.shadowColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
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
                    country,
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
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 18,
                    color: context.theme.hoverColor,
                  ),
                  Icon(
                    Icons.star,
                    size: 18,
                    color: context.theme.hoverColor,
                  ),
                  Icon(
                    Icons.star,
                    color: context.theme.hoverColor,
                    size: 18,
                  ),
                  Icon(
                    Icons.star,
                    color: context.theme.hoverColor,
                    size: 18,
                  ),
                  Icon(
                    Icons.star,
                    color: Color.fromRGBO(235, 235, 235, 1),
                    size: 18,
                  ),
                ],
              ),
              Text(
                'Cash in Person',
                style: TextStyle(
                  color: context.theme.shadowColor,
                  fontSize: 14.5,
                ),
              ),
            ],
          ),
          SizedBox(
            height: mq.height * 0.04,
          ),
          Text(
            limit,
            style: TextStyle(
              color: context.theme.primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: mq.height * 0.02,
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 21,
                backgroundImage: AssetImage('assets/images/$crypto.png'),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 15,
                          color: context.theme.primaryColor,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      if(name == "ETH")
                        Container(
                          color: !Get.isDarkMode
                              ? Color.fromRGBO(235, 235, 235, 1)
                              : Color.fromRGBO(45, 43, 41, 1),
                          padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              Image.asset('assets/images/aa.png',height: 16,),
                              SizedBox(width: 4,),
                              Text(
                                '6.47%',
                                style: TextStyle(
                                  color: !Get.isDarkMode
                                      ? Color.fromRGBO(112, 112, 112, 1)
                                      : Color.fromRGBO(141, 141, 143, 1),
                                ),
                              ),
                            ],
                          ),
                        ),

                      if(name != "ETH")
                      Container(
                        color: !Get.isDarkMode
                            ? Color.fromRGBO(235, 235, 235, 1)
                            : Color.fromRGBO(45, 43, 41, 1),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        alignment: Alignment.center,
                        child: Text(
                          name == "USDT" ? 'Fixed price' : 'Market rate',
                          style: TextStyle(
                            color: !Get.isDarkMode
                                ? Color.fromRGBO(112, 112, 112, 1)
                                : Color.fromRGBO(141, 141, 143, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: context.theme.primaryColor,
                    ),
                  ),
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Get.to(
                    () => OfferView(),
                  );
                },
                child: Container(
                  width: mq.width * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Get.isDarkMode
                        ? Color.fromRGBO(45, 43, 53, 1)
                        : Color.fromRGBO(24, 22, 33, 1),
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Text(
                    tabIndex == 0 ? 'Buy' : 'Sell',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    });
  }

  int langIndex = 1;
  int currIndex = 1;
  int fiatIndex = 0;

  void buildBottomSheet(Size mq, BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setter) => Container(
          height: mq.height * 0.65,
          padding: EdgeInsets.all(mq.width * 0.04),
          color: context.theme.backgroundColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                backgroundColor: context.theme.backgroundColor,
                elevation: 0,
                leading: Container(),
                actions: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.clear,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      size: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: mq.height * 0.02,
              ),
              Text(
                'Crypto',
                style: TextStyle(
                  color: context.theme.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),
              SizedBox(
                height: mq.height * 0.02,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setter(() {
                        currIndex = 1;
                      });
                    },
                    child: Container(
                      width: mq.width * 0.22,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: currIndex == 1
                              ? Get.isDarkMode
                                  ? context.theme.hoverColor
                                  : context.theme.hoverColor
                              : context.theme.shadowColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'BTC',
                        style: TextStyle(
                            color: currIndex == 1
                                ? Get.isDarkMode
                                    ? Colors.white
                                    : context.theme.hoverColor
                                : context.theme.shadowColor,
                            fontSize: 15),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  GestureDetector(
                    onTap: () {
                      setter(() {
                        currIndex = 2;
                      });
                    },
                    child: Container(
                      width: mq.width * 0.22,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: currIndex == 2
                              ? Get.isDarkMode
                                  ? context.theme.hoverColor
                                  : context.theme.hoverColor
                              : context.theme.shadowColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'ETH',
                        style: TextStyle(
                            color: currIndex == 2
                                ? Get.isDarkMode
                                    ? Colors.white
                                    : context.theme.hoverColor
                                : context.theme.shadowColor,
                            fontSize: 15),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  GestureDetector(
                    onTap: () {
                      setter(() {
                        currIndex = 3;
                      });
                    },
                    child: Container(
                      width: mq.width * 0.22,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: currIndex == 3
                              ? Get.isDarkMode
                                  ? context.theme.hoverColor
                                  : context.theme.hoverColor
                              : context.theme.shadowColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'USDT',
                        style: TextStyle(
                            color: currIndex == 3
                                ? Get.isDarkMode
                                    ? Colors.white
                                    : context.theme.hoverColor
                                : context.theme.shadowColor,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  setter(() {
                    currIndex = 4;
                  });
                },
                child: Container(
                  width: mq.width * 0.22,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: currIndex == 4
                          ? Get.isDarkMode
                              ? context.theme.hoverColor
                              : context.theme.hoverColor
                          : context.theme.shadowColor,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'DAI',
                    style: TextStyle(
                        color: currIndex == 4
                            ? Get.isDarkMode
                                ? Colors.white
                                : context.theme.hoverColor
                            : context.theme.shadowColor,
                        fontSize: 15),
                  ),
                ),
              ),
              SizedBox(
                height: mq.height * 0.02,
              ),
              Text(
                'Fiat',
                style: TextStyle(
                  color: context.theme.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),
              SizedBox(
                height: mq.height * 0.02,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setter(() {
                        fiatIndex = 1;
                      });
                    },
                    child: Container(
                      width: mq.width * 0.22,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: fiatIndex == 1
                              ? Get.isDarkMode
                                  ? context.theme.hoverColor
                                  : context.theme.hoverColor
                              : context.theme.shadowColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'SAR',
                        style: TextStyle(
                            color: fiatIndex == 1
                                ? Get.isDarkMode
                                    ? Colors.white
                                    : context.theme.hoverColor
                                : context.theme.shadowColor,
                            fontSize: 15),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  GestureDetector(
                    onTap: () {
                      setter(() {
                        fiatIndex = 2;
                      });
                    },
                    child: Container(
                      width: mq.width * 0.22,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: fiatIndex == 2
                              ? Get.isDarkMode
                                  ? context.theme.hoverColor
                                  : context.theme.hoverColor
                              : context.theme.shadowColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'EUR',
                        style: TextStyle(
                            color: fiatIndex == 2
                                ? Get.isDarkMode
                                    ? Colors.white
                                    : context.theme.hoverColor
                                : context.theme.shadowColor,
                            fontSize: 15),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  GestureDetector(
                    onTap: () {
                      setter(() {
                        fiatIndex = 3;
                      });
                    },
                    child: Container(
                      width: mq.width * 0.22,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: fiatIndex == 3
                              ? Get.isDarkMode
                                  ? context.theme.hoverColor
                                  : context.theme.hoverColor
                              : context.theme.shadowColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'USD',
                        style: TextStyle(
                            color: fiatIndex == 3
                                ? Get.isDarkMode
                                    ? Colors.white
                                    : context.theme.hoverColor
                                : context.theme.shadowColor,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              GestureDetector(
                onTap: () {
                  setter(() {
                    fiatIndex = 4;
                  });
                },
                child: Container(
                  width: mq.width * 0.22,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: fiatIndex == 4
                          ? Get.isDarkMode
                              ? context.theme.hoverColor
                              : context.theme.hoverColor
                          : context.theme.shadowColor,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'LBP',
                    style: TextStyle(
                        color: fiatIndex == 4
                            ? Get.isDarkMode
                                ? Colors.white
                                : context.theme.hoverColor
                            : context.theme.shadowColor,
                        fontSize: 15),
                  ),
                ),
              ),
              SizedBox(
                height: mq.height * 0.02,
              ),
              Text(
                'Language',
                style: TextStyle(
                  color: context.theme.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),
              SizedBox(
                height: mq.height * 0.02,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setter(() {
                        langIndex = 1;
                      });
                    },
                    child: Container(
                      width: mq.width * 0.22,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: langIndex == 1
                              ? Get.isDarkMode
                                  ? context.theme.hoverColor
                                  : context.theme.hoverColor
                              : context.theme.shadowColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SizedBox(
                        height: 20,
                        width: 25,
                        child: Image.asset(
                          'assets/icons/flag.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  GestureDetector(
                    onTap: () {
                      setter(() {
                        langIndex = 2;
                      });
                    },
                    child: Container(
                      width: mq.width * 0.22,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: langIndex == 2
                              ? Get.isDarkMode
                                  ? context.theme.hoverColor
                                  : context.theme.hoverColor
                              : context.theme.shadowColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SizedBox(
                        height: 20,
                        width: 25,
                        child: Image.asset(
                          'assets/images/flag1.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: mq.height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }

  int lIndex = 0;

  void buildLocationBottomSheet(Size mq, BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setter) => Container(
          height: mq.height * 0.65,
          padding: EdgeInsets.all(mq.width * 0.04),
          color: context.theme.backgroundColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                backgroundColor: context.theme.backgroundColor,
                elevation: 0,
                leading: Container(),
                actions: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.clear,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      size: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: mq.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select Location',
                    style: TextStyle(
                      color: context.theme.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                  ),
                  Text(
                    'Location Tracker',
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
              Container(
                width: mq.width,
                height: mq.height * 0.07,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Get.isDarkMode
                      ? Color.fromRGBO(44, 42, 45, 1)
                      : context.theme.backgroundColor,
                  border: Border.all(
                    color: Get.isDarkMode
                        ? Color.fromRGBO(74, 74, 75, 1)
                        : Color.fromRGBO(190, 190, 190, 1),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      size: 30,
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
                          hintText: 'Search for your location',
                          hintStyle: TextStyle(
                            fontSize: 15.5,
                            color: Get.isDarkMode
                                ? Color.fromRGBO(112, 112, 112, 1)
                                : context.theme.primaryColor,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: mq.height * 0.04,
              ),
              if (lIndex == 0)
                Text(
                  'Country',
                  style: TextStyle(
                    color: context.theme.primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
              if (lIndex == 1)
                Text(
                  'City',
                  style: TextStyle(
                    color: context.theme.primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
              if (lIndex == 2)
                Text(
                  'Location Selected',
                  style: TextStyle(
                    color: context.theme.primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
              SizedBox(
                height: mq.height * 0.03,
              ),
              if (lIndex == 2)
                GestureDetector(
                  onTap: () {
                    setter(() {
                      lIndex++;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 18,
                        width: 26,
                        child: Image.asset('assets/images/ras.png'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Lebanon, ' + 'Ras Beirut',
                        style: TextStyle(
                          color: context.theme.primaryColor,
                          fontSize: 16,
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          setter(() {
                            lIndex = 0;
                          });
                        },
                        child: Text(
                          'Try another location',
                          style: TextStyle(
                            color: context.theme.shadowColor,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              if (lIndex < 2)
                GestureDetector(
                  onTap: () {
                    setter(() {
                      lIndex++;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 18,
                        width: 26,
                        child: Image.asset('assets/images/ras.png'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        lIndex == 0 ? 'Lebanon' : 'Ras Beirut',
                        style: TextStyle(
                          color: context.theme.primaryColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              if (lIndex < 2)
                SizedBox(
                  height: mq.height * 0.01,
                ),
              if (lIndex < 2)
                Divider(
                  color: Get.isDarkMode
                      ? Color.fromRGBO(41, 41, 41, 1)
                      : Color.fromRGBO(249, 249, 249, 1),
                ),
              if (lIndex < 2)
                SizedBox(
                  height: mq.height * 0.01,
                ),
              if (lIndex < 2)
                GestureDetector(
                  onTap: () {
                    setter(() {
                      lIndex++;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 18,
                        width: 26,
                        child: Image.asset('assets/images/ras.png'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        lIndex == 0 ? 'Morocco' : 'Tripoli',
                        style: TextStyle(
                          color: context.theme.primaryColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              if (lIndex < 2)
                SizedBox(
                  height: mq.height * 0.01,
                ),
              if (lIndex < 2)
                Divider(
                  color: Get.isDarkMode
                      ? Color.fromRGBO(41, 41, 41, 1)
                      : Color.fromRGBO(249, 249, 249, 1),
                ),
              if (lIndex < 2)
                SizedBox(
                  height: mq.height * 0.01,
                ),
              if (lIndex < 2)
                GestureDetector(
                  onTap: () {
                    setter(() {
                      lIndex++;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 18,
                        width: 26,
                        child: Image.asset('assets/images/ras.png'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        lIndex == 0 ? 'Turkey' : 'Sidon',
                        style: TextStyle(
                          color: context.theme.primaryColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              SizedBox(
                height: mq.height * 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
