import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyOffers extends StatelessWidget {
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
          'My Offers',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: context.theme.primaryColor,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: mq.height * 0.04,
          ),
          buildMyOfferTile(
              mq: mq,
              crypto: 'crypto1',
              name: 'BTC',
              limit: 'Limits 50,000- 1,000,000 LBP',
              price: "247,478,000 LBP "),
          SizedBox(
            height: mq.height * 0.015,
          ),
          Divider(
            color: !Get.isDarkMode ? Color.fromRGBO(235, 235, 235, 1) : Color.fromRGBO(41, 41, 41, 1),
          ),
          SizedBox(
            height: mq.height * 0.015,
          ),
          buildMyOfferTile(
              mq: mq,
              crypto: 'crypto2',
              name: 'ETH',
              price: '\$3,730.25',
              limit: "9000 LL ",
              rate: '6.47 %'),
        ],
      ),
    );
  }

  Widget buildMyOfferTile(
      {Size mq,
      String crypto,
      String name,
      String price,
      String limit,
      String rate}) {
    return Builder(builder: (context) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: mq.width * 0.04),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Selling',
                  style: TextStyle(
                    color: context.theme.shadowColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
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
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  limit,
                  style: TextStyle(
                    color: context.theme.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: CircleAvatar(
                    radius: 21,
                    backgroundImage: AssetImage('assets/images/$crypto.png'),
                  ),
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
                        Container(
                          color: !Get.isDarkMode
                              ? Color.fromRGBO(235, 235, 235, 1)
                              : Color.fromRGBO(45, 43, 53, 1),
                          padding:
                              EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                          alignment: Alignment.center,
                          child: name == "ETH"
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/aa.png',
                                      height: 15,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '6.47%',
                                      style: TextStyle(
                                        color: !Get.isDarkMode
                                            ? Color.fromRGBO(112, 112, 112, 1)
                                            : Color.fromRGBO(112, 112, 112, 1),
                                      ),
                                    ),
                                  ],
                                )
                              : Text(
                                  'Market rate',
                                  style: TextStyle(
                                    color: !Get.isDarkMode
                                        ? Color.fromRGBO(112, 112, 112, 1)
                                        : Color.fromRGBO(112, 112, 112, 1),
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
                Container(
                  height: 18,
                  width: 25,
                  child: Image.asset(
                    'assets/images/del.png',
                    fit: BoxFit.contain,
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
