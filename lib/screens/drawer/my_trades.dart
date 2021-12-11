import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../buy_sell/trade.dart';

class MyTrades extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
            'My Trades',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: context.theme.primaryColor,
            ),
          ),
          bottom: TabBar(
            indicatorColor: context.theme.hoverColor,
            labelColor: context.theme.hoverColor,
            unselectedLabelColor: context.theme.shadowColor,
            labelStyle: TextStyle(fontSize: 15),
            unselectedLabelStyle: TextStyle(fontSize: 15),
            tabs: [
              Tab(
                text: "Active Trades",
              ),
              Tab(
                text: "Completed Trades",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildActiveTabs(mq),
            buildCompletedTabs(mq),
          ],
        ),
      ),
    );
  }

  Widget buildActiveTabs(Size mq) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: mq.width * 0.04),
      child: Column(
        children: [
          SizedBox(
            height: mq.height * 0.04,
          ),
          buildActiveTradeTile(),
          SizedBox(
            height: mq.height * 0.02,
          ),
          Divider(),
          SizedBox(
            height: mq.height * 0.02,
          ),
          buildActiveTradeTile(),
        ],
      ),
    );
  }

  Widget buildActiveTradeTile() {
    return Builder(builder: (context) {
      return Container(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Amount    ',
                  style: TextStyle(
                    color: context.theme.shadowColor,
                    fontSize: 15.5,
                  ),
                ),
                Text(
                  '50,000 LBP',
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
                  'Crypto Amount    ',
                  style: TextStyle(
                    color: context.theme.shadowColor,
                    fontSize: 15.5,
                  ),
                ),
                Text(
                  '0.000062 BTC',
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
                  'Created Time   ',
                  style: TextStyle(
                      color: context.theme.shadowColor, fontSize: 15.5),
                ),
                Text(
                  '2021-01-30 14:30:23',
                  style: TextStyle(
                    color: context.theme.primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 17,
            ),
            Row(
              children: [
                Container(
                  height: 20,
                  child: Image.asset('assets/icons/group.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'The buyer is waiting for your response',
                  style: TextStyle(
                    color: Get.isDarkMode ? Color.fromRGBO(234, 57, 67, 1) : Color.fromRGBO(213, 47, 47, 1),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 17,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(
                      () => Trade(),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Get.isDarkMode
                          ? Color.fromRGBO(45, 43, 53, 1)
                          : Color.fromRGBO(24, 22, 33, 1),
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    child: Text(
                      'Accept',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: context.theme.hoverColor,
                    ),
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Text(
                    'Decline',
                    style: TextStyle(
                      color: context.theme.hoverColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

  Widget buildCompletedTabs(Size mq) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: mq.width * 0.04),
      child: Column(
        children: [
          SizedBox(
            height: mq.height * 0.04,
          ),
          buildCompletedTradeTile(),
          SizedBox(
            height: mq.height * 0.02,
          ),
          Divider(),
          SizedBox(
            height: mq.height * 0.02,
          ),
          buildCompletedTradeTile(),
        ],
      ),
    );
  }

  Widget buildCompletedTradeTile() {
    return Builder(builder: (context) {
      return Container(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Amount    ',
                  style: TextStyle(
                    color: context.theme.shadowColor,
                    fontSize: 15.5,
                  ),
                ),
                Text(
                  '50,000 LBP',
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
                  'Crypto Amount    ',
                  style: TextStyle(
                    color: context.theme.shadowColor,
                    fontSize: 15.5,
                  ),
                ),
                Text(
                  '0.000062 BTC',
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
                  'Created Time   ',
                  style: TextStyle(
                      color: context.theme.shadowColor, fontSize: 15.5),
                ),
                Text(
                  '2021-01-30 14:30:23',
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
      );
    });
  }
}
