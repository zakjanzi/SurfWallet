import 'package:get/get.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

import './search_screen.dart';
import '../drawer/drawer.dart';
import './market/market_screen.dart';
import './portfolio/transaction_screen.dart';
import '../../data/models/portfolio_crypto_list_tile_model.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({Key key}) : super(key: key);

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  int index = 0;
  int tabIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: context.theme.backgroundColor,
      appBar: buildAppBar(mq),
      drawer: const MyDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mq.width * 0.04),
        child: SingleChildScrollView(
          child: tabIndex == 0 ? buildPortfolio(mq) : const MarketScreen(),
        ),
      ),
    );
  }

  Widget buildPortfolio(Size mq) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
              children: const [
                Text(
                  'Balance',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 17,
                  ),
                ),
                SizedBox(
                  height: 1,
                ),
                Text(
                  '\$0',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            const Text(
              '0.00% lifetime',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
          ],
        ),
        SizedBox(
          height: mq.height * 0.02,
        ),
        SizedBox(
          height: mq.height * 0.3,
          child: Get.isDarkMode
              ? Image.asset(
                  'assets/images/chart_dd.png',
                  fit: BoxFit.contain,
                )
              : Image.asset(
                  'assets/images/chart.png',
                  fit: BoxFit.contain,
                ),
        ),
        SizedBox(
          height: mq.height * 0.015,
        ),
        buildTabsRow(),
        SizedBox(
          height: mq.height * 0.04,
        ),
        buildCryptoListTile(
          portfolioLCryptoListTileModel: PortfolioLCryptoListTileModel(
            chart: 'assets/graph/btc.png',
            name: 'Bitcoin ',
            percentage: '+1.86%',
            quantity: '0.0325474 BTC',
            price: '\$2714.29',
            isPositive: true,
            image: 'assets/images/crypto1.png',
          ),
          mq: mq,
        ),
        buildCryptoListTile(
          portfolioLCryptoListTileModel: PortfolioLCryptoListTileModel(
            name: 'Ethereum',
            chart: 'assets/graph/eth.png',
            percentage: '+3.92%',
            quantity: '2.07 ETZ',
            price: '\$5,941.67',
            isPositive: true,
            image: 'assets/images/crypto2.png',
          ),
          mq: mq,
        ),
        buildCryptoListTile(
          portfolioLCryptoListTileModel: PortfolioLCryptoListTileModel(
            name: 'Tether  ',
            percentage: '+0.03%',
            quantity: '514.97 USDT',
            price: '\$514.08',
            isPositive: true,
            image: 'assets/images/crypto4.png',
            chart: 'assets/graph/usdt.png',
          ),
          mq: mq,
        ),
        buildCryptoListTile(
          portfolioLCryptoListTileModel: PortfolioLCryptoListTileModel(
            name: 'XRP     ',
            percentage: '+3.78%',
            quantity: '21.7 XRP',
            price: '\$31.17',
            isPositive: true,
            image: 'assets/images/crypto3.png',
            chart: 'assets/graph/xrp.png',
          ),
          mq: mq,
        ),
      ],
    );
  }

  Widget buildAppBar(Size mq) {
    return AppBar(
      backgroundColor: context.theme.backgroundColor,
      elevation: 0,
      leading: IconButton(
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 4,
              width: mq.width * 0.06,
              decoration: BoxDecoration(
                color: context.theme.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              height: 4,
              width: mq.width * 0.06,
              decoration: BoxDecoration(
                color: context.theme.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              height: 4,
              width: mq.width * 0.06,
              decoration: BoxDecoration(
                color: context.theme.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
        onPressed: () {
          _scaffoldKey.currentState.openDrawer();
        },
      ),
      centerTitle: true,
      title: Container(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'Portfolio',
                    style: TextStyle(
                      fontSize: 15.5,
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
                  'Portfolio',
                  style: TextStyle(
                    fontSize: 15.5,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'Market',
                  style: TextStyle(
                    fontSize: 15.5,
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
                  'Market',
                  style: TextStyle(
                    fontSize: 15.5,
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
      actions: [
        if (tabIndex == 1)
          IconButton(
            icon: Icon(
              Icons.search,
              size: 28,
              color: context.theme.primaryColor,
            ),
            onPressed: () {
              Get.to(
                () => const SearchScreen(),
              );
            },
          ),
      ],
    );
  }

  Widget buildCryptoListTile(
      {PortfolioLCryptoListTileModel portfolioLCryptoListTileModel, Size mq}) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => CryptoScreen(
            portfolioLCryptoListTileModel: portfolioLCryptoListTileModel,
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: mq.height * 0.025),
        child: Row(
          children: [
            CircleAvatar(
              radius: 22,
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
                      fontSize: 17.5,
                    ),
                  ),
                  Text(
                    portfolioLCryptoListTileModel.percentage,
                    style: TextStyle(
                      height: 1.5,
                      fontSize: 15.5,
                      fontWeight: FontWeight.w600,
                      color: Get.isDarkMode
                          ? const Color.fromRGBO(131, 225, 205, 1)
                          : const Color.fromRGBO(13, 114, 58, 1),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: mq.width * 0.2,
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
                  portfolioLCryptoListTileModel.quantity,
                  style: TextStyle(
                    fontSize: 16,
                    color: context.theme.shadowColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTabsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildTabButton('All Time', 0),
        buildTabButton('YTD', 1),
        buildTabButton('MTD', 2),
        buildTabButton('Weekly', 3),
        buildTabButton('Daily', 4),
      ],
    );
  }

  Widget buildTabButton(String text, int value) {
    return GestureDetector(
      onTap: () {
        setState(() {
          index = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8.5),
        decoration: BoxDecoration(
          color: index == value
              ? Get.isDarkMode
                  ? const Color.fromRGBO(38, 36, 46, 1)
                  : const Color.fromRGBO(235, 235, 235, 1)
              : context.theme.backgroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: index == value
                ? context.theme.hoverColor
                : context.theme.shadowColor,
          ),
        ),
      ),
    );
  }
}
