import 'package:get/get.dart';
import 'package:flutter/material.dart';

import './coin_detail.dart';
import '../../../data/models/portfolio_crypto_list_tile_model.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({Key key}) : super(key: key);

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  int index = 1;
  int langIndex = 1;
  int currIndex = 1;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: mq.height * 0.013,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Balance',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
                Text(
                  index == 1 ? '\$748.65' : '\$0.00',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            Text(
              index == 1 ? '12.57% lifetime' : '0.00% lifetime',
              style: TextStyle(
                color: Get.isDarkMode
                    ? const Color.fromRGBO(168, 230, 207, 1)
                    : const Color.fromRGBO(13, 114, 58, 1),
                fontSize: 15,
              ),
            ),
          ],
        ),
        SizedBox(
          height: mq.height * 0.025,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Assets',
              style: TextStyle(
                color: context.theme.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            GestureDetector(
              onTap: () {
                buildBottomSheet(mq, context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Get.isDarkMode
                      ? const Color.fromRGBO(38, 36, 46, 1)
                      : const Color.fromRGBO(235, 235, 235, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text(
                      index == 1 || index == 3 ? 'USD' : 'Euro',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      height: 20,
                      width: 25,
                      child: Image.asset(
                        index == 1 || index == 3
                            ? 'assets/icons/flag.png'
                            : 'assets/images/flag1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: mq.height * 0.025,
        ),
        SizedBox(
          height: mq.height * 0.04,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              buildMarketTabButton('Watch list', 0),
              buildMarketTabButton('Cryptocurrency', 1),
              buildMarketTabButton('Category', 2),
              buildMarketTabButton('DeFi', 3),
              buildMarketTabButton('NFT', 4),
            ],
          ),
        ),
        SizedBox(
          height: mq.height * 0.035,
        ),
        if (index == 0)
          buildCryptoListTileMarket(
            portfolioLCryptoListTileModel: PortfolioLCryptoListTileModel(
              name: 'Bitcoin',
              percentage: '+1.86%',
              quantity: '0.0060 BTC',
              price: '\$43,254.74',
              shortForm: 'BTC',
              isPositive: true,
              image: 'assets/images/crypto1.png',
              chart: 'assets/graph/btc.png',
            ),
            mq: mq,
          ),
        if (index == 1)
          Column(
            children: [
              buildCryptoListTileMarket(
                portfolioLCryptoListTileModel: PortfolioLCryptoListTileModel(
                  name: 'Bitcoin',
                  percentage: '+1.86%',
                  quantity: '0.0060 BTC',
                  price: '\$43,254.74',
                  shortForm: 'BTC',
                  isPositive: true,
                  image: 'assets/images/crypto1.png',
                  chart: 'assets/graph/btc.png',
                ),
                mq: mq,
              ),
              buildCryptoListTileMarket(
                portfolioLCryptoListTileModel: PortfolioLCryptoListTileModel(
                  name: 'Ethereum',
                  percentage: '+3.92%',
                  quantity: '0.0060 ETZ',
                  price: '\$2,973.27',
                  isPositive: true,
                  shortForm: 'ETH',
                  image: 'assets/images/crypto2.png',
                  chart: 'assets/graph/eth.png',
                ),
                mq: mq,
              ),
              buildCryptoListTileMarket(
                portfolioLCryptoListTileModel: PortfolioLCryptoListTileModel(
                  name: 'Tether',
                  percentage: '+0.03%',
                  quantity: '0.0060 USDT',
                  price: '\$1.00',
                  isPositive: false,
                  shortForm: 'USDT',
                  image: 'assets/images/crypto4.png',
                  chart: 'assets/graph/usdt.png',
                ),
                mq: mq,
              ),
              buildCryptoListTileMarket(
                portfolioLCryptoListTileModel: PortfolioLCryptoListTileModel(
                  name: 'XRP',
                  percentage: '+3.78%',
                  quantity: '0.0060 XRP',
                  shortForm: 'XRP',
                  price: '\$0.98',
                  isPositive: true,
                  image: 'assets/images/crypto3.png',
                  chart: 'assets/graph/xrp.png',
                ),
                mq: mq,
              ),
              SizedBox(
                height: mq.height * 0.024,
              ),
            ],
          ),
        if (index == 3)
          Column(
            children: [
              buildCryptoListTileMarket(
                portfolioLCryptoListTileModel: PortfolioLCryptoListTileModel(
                  name: 'Uniswap',
                  percentage: '+1.86%',
                  quantity: '0.0060 BTC',
                  price: '€43,254.74',
                  shortForm: 'UNI',
                  isPositive: true,
                  image: 'assets/images/crypto9.png',
                  chart: 'assets/graph/btc.png',
                ),
                mq: mq,
              ),
              buildCryptoListTileMarket(
                portfolioLCryptoListTileModel: PortfolioLCryptoListTileModel(
                  name: 'Chainlink',
                  percentage: '+3.92%',
                  quantity: '0.0060 ETZ',
                  price: '€2,973.27',
                  isPositive: false,
                  shortForm: 'LINK',
                  image: 'assets/images/crypto10.png',
                  chart: 'assets/graph/eth.png',
                ),
                mq: mq,
              ),
              buildCryptoListTileMarket(
                portfolioLCryptoListTileModel: PortfolioLCryptoListTileModel(
                  name: 'Terra',
                  percentage: '+0.03%',
                  quantity: '0.0060 USDT',
                  price: '€1.00',
                  isPositive: true,
                  shortForm: 'LUNA',
                  image: 'assets/images/crypto11.png',
                  chart: 'assets/graph/usdt.png',
                ),
                mq: mq,
              ),
              buildCryptoListTileMarket(
                portfolioLCryptoListTileModel: PortfolioLCryptoListTileModel(
                  name: 'Wrapped BTC',
                  percentage: '+3.78%',
                  quantity: '0.0060 XRP',
                  shortForm: 'WBTC',
                  price: '€0.98',
                  isPositive: true,
                  image: 'assets/images/crypto12.png',
                  chart: 'assets/graph/xrp.png',
                ),
                mq: mq,
              ),
              SizedBox(
                height: mq.height * 0.024,
              ),
            ],
          ),
        if (index == 4)
          Column(
            children: [
              buildCryptoListTileMarket(
                portfolioLCryptoListTileModel: PortfolioLCryptoListTileModel(
                  name: 'THETA',
                  percentage: '+1.86%',
                  quantity: '0.0060 BTC',
                  price: '€43,254.74',
                  shortForm: 'THETA',
                  isPositive: true,
                  image: 'assets/images/crypto5.png',
                  chart: 'assets/graph/btc.png',
                ),
                mq: mq,
              ),
              buildCryptoListTileMarket(
                portfolioLCryptoListTileModel: PortfolioLCryptoListTileModel(
                  name: 'Tezos',
                  percentage: '+3.92%',
                  quantity: '0.0060 ETZ',
                  price: '€2,973.27',
                  isPositive: false,
                  shortForm: 'XTZ',
                  image: 'assets/images/crypto6.png',
                  chart: 'assets/graph/eth.png',
                ),
                mq: mq,
              ),
              buildCryptoListTileMarket(
                portfolioLCryptoListTileModel: PortfolioLCryptoListTileModel(
                  name: 'Axie Inf',
                  percentage: '+0.03%',
                  quantity: '0.0060 USDT',
                  price: '€1.00',
                  isPositive: true,
                  shortForm: 'AXS',
                  image: 'assets/images/crypto7.png',
                  chart: 'assets/graph/usdt.png',
                ),
                mq: mq,
              ),
              buildCryptoListTileMarket(
                portfolioLCryptoListTileModel: PortfolioLCryptoListTileModel(
                  name: 'Chiliz',
                  percentage: '+3.78%',
                  quantity: '0.0060 XRP',
                  shortForm: 'CHZ',
                  price: '€0.98',
                  isPositive: true,
                  image: 'assets/images/crypto8.png',
                  chart: 'assets/graph/xrp.png',
                ),
                mq: mq,
              ),
              SizedBox(
                height: mq.height * 0.024,
              ),
            ],
          ),
        if (index == 1)
          Padding(
            padding: EdgeInsets.only(left: mq.width * 0.01),
            child: Text(
              'Latest Crypto News',
              style: TextStyle(
                color: context.theme.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
          ),
        if (index == 1)
          SizedBox(
            height: mq.height * 0.015,
          ),
        if (index == 1)
          Padding(
            padding: EdgeInsets.only(left: mq.width * 0.01),
            child: Column(
              children: [
                buildNewsTile(
                    mq: mq,
                    heading:
                        'Micro Has a High Stock Price, a fat Premium,  & Bitcoin',
                    image: 'assets/images/news1.png'),
                buildNewsTile(
                    mq: mq,
                    heading:
                        'Micro Has a High Stock Price, a fat Premium,  & Bitcoin',
                    image: 'assets/images/news2.png'),
              ],
            ),
          ),
        SizedBox(
          height: mq.height * 0.1,
        ),
      ],
    );
  }

  Widget buildMarketTabButton(String text, int value) {
    return GestureDetector(
      onTap: () {
        setState(() {
          index = value;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8.5),
        padding: const EdgeInsets.symmetric(horizontal: 14),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: index == value
              ? Get.isDarkMode
                  ? const Color.fromRGBO(38, 36, 46, 1)
                  : const Color.fromRGBO(235, 235, 235, 1)
              : Get.isDarkMode
                  ? const Color.fromRGBO(38, 36, 46, 1)
                  : const Color.fromRGBO(235, 235, 235, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: index == value
                ? context.theme.hoverColor
                : context.theme.shadowColor,
          ),
        ),
      ),
    );
  }

  Widget buildCryptoListTileMarket(
      {PortfolioLCryptoListTileModel portfolioLCryptoListTileModel, Size mq}) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => CoinDetail(
            portfolioLCryptoListTileModel: portfolioLCryptoListTileModel,
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: mq.height * 0.025),
        child: Row(
          children: [
            CircleAvatar(
              radius: 23,
              backgroundColor: Colors.orange,
              backgroundImage: AssetImage(portfolioLCryptoListTileModel.image),
            ),
            SizedBox(
              width: mq.width * 0.05,
            ),
            SizedBox(
              width: mq.width * 0.22,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    portfolioLCryptoListTileModel.name,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    portfolioLCryptoListTileModel.shortForm,
                    style: TextStyle(
                      height: 1.5,
                      fontSize: 15.5,
                      color: context.theme.shadowColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: mq.width * 0.17,
              child: Image.asset(
                portfolioLCryptoListTileModel.chart,
                fit: BoxFit.cover,
              ),
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  portfolioLCryptoListTileModel.price,
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  portfolioLCryptoListTileModel.percentage,
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 15.5,
                    fontWeight: FontWeight.w600,
                    color: Get.isDarkMode
                        ? portfolioLCryptoListTileModel.isPositive
                            ? const Color.fromRGBO(168, 230, 207, 1)
                            : const Color.fromRGBO(234, 57, 67, 1)
                        : portfolioLCryptoListTileModel.isPositive
                            ? const Color.fromRGBO(13, 114, 58, 1)
                            : const Color.fromRGBO(204, 0, 0, 1),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNewsTile({Size mq, String heading, String image}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: mq.width * 0.65,
                child: Text(
                  heading,
                  style: TextStyle(
                    color: context.theme.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Text(
                    '13 hours',
                    style: TextStyle(
                        color: context.theme.hoverColor, fontSize: 15),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'CNBC',
                    style: TextStyle(
                        color: context.theme.hoverColor, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            width: mq.width * 0.2,
            height: mq.height * 0.1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void buildBottomSheet(Size mq, BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setter) => Container(
          height: mq.height * 0.5,
          padding: EdgeInsets.all(mq.width * 0.04),
          color: context.theme.backgroundColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                backgroundColor: context.theme.backgroundColor,
                title: Text(
                  'Sort by',
                  style: TextStyle(
                    color: context.theme.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
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
                'Currency',
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
                      width: mq.width * 0.16,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: currIndex == 1
                              ? Get.isDarkMode
                                  ? const Color.fromRGBO(168, 230, 208, 1)
                                  : context.theme.hoverColor
                              : context.theme.shadowColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'USD',
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
                      width: mq.width * 0.16,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: currIndex == 2
                              ? Get.isDarkMode
                                  ? const Color.fromRGBO(168, 230, 208, 1)
                                  : context.theme.hoverColor
                              : context.theme.shadowColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Euro',
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
                      width: mq.width * 0.16,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: currIndex == 3
                              ? Get.isDarkMode
                                  ? const Color.fromRGBO(168, 230, 208, 1)
                                  : context.theme.hoverColor
                              : context.theme.shadowColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'LBP',
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
                      width: mq.width * 0.16,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: langIndex == 1
                              ? Get.isDarkMode
                                  ? const Color.fromRGBO(168, 230, 208, 1)
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
                      width: mq.width * 0.16,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: langIndex == 2
                              ? Get.isDarkMode
                                  ? const Color.fromRGBO(168, 230, 208, 1)
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
}
