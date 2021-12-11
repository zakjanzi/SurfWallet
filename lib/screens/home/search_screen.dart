import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key key}) : super(key: key);

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
          'Search',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildSearchTextField(mq, context),
                TextButton(
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 16.5,
                      fontWeight: FontWeight.w600,
                      color: context.theme.hoverColor,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: mq.height * 0.04,
            ),
            Container(
              margin: EdgeInsets.only(bottom: mq.height * 0.025),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 23,
                    backgroundColor: Colors.orange,
                    backgroundImage: AssetImage('assets/images/crypto1.png'),
                  ),
                  SizedBox(
                    width: mq.width * 0.05,
                  ),
                  SizedBox(
                    width: mq.width * 0.22,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Bitcoin',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'BTC',
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
                      'assets/graph/btc.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '\$43,254.74',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        '+1.86%',
                        style: TextStyle(
                            height: 1.5,
                            fontSize: 15.5,
                            fontWeight: FontWeight.w600,
                            color: Get.isDarkMode
                                ? const Color.fromRGBO(168, 230, 207, 1)
                                : const Color.fromRGBO(13, 114, 58, 1)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSearchTextField(Size mq, BuildContext context) {
    return Container(
      color: context.theme.cardColor,
      width: mq.width * 0.7,
      child: TextField(
        style: TextStyle(color: context.theme.primaryColor),
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: context.theme.hoverColor,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: context.theme.shadowColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: context.theme.hoverColor,
            ),
          ),
        ),
      ),
    );
  }
}
