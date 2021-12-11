import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../data/models/portfolio_crypto_list_tile_model.dart';

class CoinDetail extends StatefulWidget {
  final PortfolioLCryptoListTileModel portfolioLCryptoListTileModel;

  const CoinDetail({Key key, this.portfolioLCryptoListTileModel})
      : super(key: key);

  @override
  State<CoinDetail> createState() => _CoinDetailState();
}

class _CoinDetailState extends State<CoinDetail> {
  int index = 0;
  bool candleChart = true;

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
          widget.portfolioLCryptoListTileModel.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: context.theme.primaryColor,
          ),
        ),
        actions: [
          Icon(
            Icons.star_border,
            color: context.theme.primaryColor,
          ),
          const SizedBox(width: 5,),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mq.width * 0.025),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: mq.height * 0.02,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundColor: Colors.orange,
                    backgroundImage: AssetImage(
                      widget.portfolioLCryptoListTileModel.image,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.portfolioLCryptoListTileModel.name} ',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        widget.portfolioLCryptoListTileModel.shortForm,
                        style: TextStyle(
                          color: context.theme.shadowColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        '\$44,945.00',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        '1.00 ${widget.portfolioLCryptoListTileModel.shortForm}',
                        style: TextStyle(
                          fontSize: 16,
                          color: context.theme.shadowColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: mq.height * 0.032,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Low',
                        style: TextStyle(
                          fontSize: 14.8,
                          color: context.theme.shadowColor,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        '\$45000.12',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'High',
                        style: TextStyle(
                          fontSize: 14.8,
                          color: context.theme.shadowColor,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        '\$46000.45',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: mq.height * 0.032,
              ),
              SizedBox(
                height: mq.height * 0.3,
                child: candleChart == true
                    ? Get.isDarkMode
                        ? Image.asset('assets/images/chart3_dd.png')
                        : Image.asset('assets/images/chart3.png')
                    : Get.isDarkMode
                        ? Image.asset('assets/images/chart4_dd.png')
                        : Image.asset('assets/images/chart4.png'),
              ),
              SizedBox(
                height: mq.height * 0.03,
              ),
              Center(
                child: buildTimeFrame(mq),
              ),
              SizedBox(
                height: mq.height * 0.032,
              ),
              Container(
                margin: EdgeInsets.only(bottom: mq.height * 0.025),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.orange,
                      backgroundImage: AssetImage(
                          widget.portfolioLCryptoListTileModel.image),
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
                            widget.portfolioLCryptoListTileModel.name,
                            style: const TextStyle(
                              fontSize: 17.5,
                            ),
                          ),
                          Text(
                            widget.portfolioLCryptoListTileModel.percentage,
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
                        widget.portfolioLCryptoListTileModel.chart,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.portfolioLCryptoListTileModel.price,
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          widget.portfolioLCryptoListTileModel.quantity,
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
              SizedBox(
                height: mq.height * 0.022,
              ),
              Text(
                'What is ${widget.portfolioLCryptoListTileModel.name} ?',
                style: TextStyle(
                  color: context.theme.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),
              SizedBox(
                height: mq.height * 0.025,
              ),
              Text(
                'Bitcoin is the world’s first digitally native money and payment network. The asset has a limited supply and can be sent anywhere in the world with no government, corporation, or individual having control over the network. Anyone with an internet connection can download the appropriate software on their device and start using Bitcoin.',
                style: TextStyle(
                  height: 1.5,
                  fontSize: 16,
                  color: context.theme.shadowColor,
                ),
              ),
              SizedBox(
                height: mq.height * 0.032,
              ),
              Text(
                'Resources',
                style: TextStyle(
                  color: context.theme.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),
              SizedBox(
                height: mq.height * 0.025,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/globe.svg',
                    height: 25,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Official Website',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: context.theme.hoverColor,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: mq.width * 0.2,
                  ),
                  SvgPicture.asset(
                    'assets/icons/doc.svg',
                    height: 25,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Whitepaper',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: context.theme.hoverColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: mq.height * 0.035,
              ),
              Container(
                color: Get.isDarkMode
                    ? const Color.fromRGBO(45, 43, 53, 1)
                    : const Color.fromRGBO(249, 242, 235, 1),
                padding: EdgeInsets.symmetric(
                  horizontal: mq.width * 0.05,
                  vertical: mq.height * 0.04,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildFundamental(
                        context, 'Market cap', '€792,946.3T', 'cap'),
                    buildFundamental(
                        context, 'Volume', ' €792,946.3T', 'black_cand'),
                    buildFundamental(context, 'Circulation', '611.6M', 'arrow'),
                  ],
                ),
              ),
              SizedBox(
                height: mq.height * 0.04,
              ),
              Text(
                'News',
                style: TextStyle(
                  color: context.theme.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),
              SizedBox(
                height: mq.height * 0.02,
              ),
              buildNewsTile(
                mq: mq,
                heading:
                    'Micro Has a High Stock Price, a fat Premium,  & Bitcoin',
                image: 'assets/images/news1.png',
                context: context,
              ),
              SizedBox(
                height: mq.height * 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTimeFrame(Size mq) {
    return Container(
      decoration: BoxDecoration(
        color: Get.isDarkMode
            ? const Color.fromRGBO(33, 31, 42, 1)
            : const Color.fromRGBO(234, 234, 234, 1),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      width: mq.width,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                index = 0;
              });
            },
            child: Container(
              child: const Text(
                '24h',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: index == 0
                    ? !Get.isDarkMode
                        ? Colors.white
                        : const Color.fromRGBO(45, 43, 42, 1)
                    : Get.isDarkMode
                        ? const Color.fromRGBO(33, 31, 42, 1)
                        : const Color.fromRGBO(234, 234, 234, 1),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                index = 1;
              });
            },
            child: Container(
              child: const Text(
                '7d',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: index == 0
                    ? !Get.isDarkMode
                        ? Colors.white
                        : const Color.fromRGBO(45, 43, 42, 1)
                    : Get.isDarkMode
                        ? const Color.fromRGBO(33, 31, 42, 1)
                        : const Color.fromRGBO(234, 234, 234, 1),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                index = 2;
              });
            },
            child: Container(
              child: const Text(
                '30d',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: index == 0
                    ? !Get.isDarkMode
                        ? Colors.white
                        : const Color.fromRGBO(45, 43, 42, 1)
                    : Get.isDarkMode
                        ? const Color.fromRGBO(33, 31, 42, 1)
                        : const Color.fromRGBO(234, 234, 234, 1),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                index = 3;
              });
            },
            child: Container(
              child: const Text(
                '90d',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: index == 0
                    ? !Get.isDarkMode
                        ? Colors.white
                        : const Color.fromRGBO(45, 43, 42, 1)
                    : Get.isDarkMode
                        ? const Color.fromRGBO(33, 31, 42, 1)
                        : const Color.fromRGBO(234, 234, 234, 1),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                index = 4;
              });
            },
            child: Container(
              child: const Text(
                'All',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: index == 0
                    ? !Get.isDarkMode
                        ? Colors.white
                        : const Color.fromRGBO(45, 43, 42, 1)
                    : Get.isDarkMode
                        ? const Color.fromRGBO(33, 31, 42, 1)
                        : const Color.fromRGBO(234, 234, 234, 1),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const Spacer(),
          if (candleChart == true)
            GestureDetector(
              onTap: () {
                setState(() {
                  candleChart = false;
                });
              },
              child: SizedBox(
                height: 30,
                width: 30,
                child: SvgPicture.asset('assets/icons/candle.svg'),
              ),
            )
          else
            GestureDetector(
              onTap: () {
                setState(() {
                  candleChart = true;
                });
              },
              child: SizedBox(
                height: 30,
                width: 30,
                child: SvgPicture.asset('assets/icons/line.svg'),
              ),
            ),
        ],
      ),
    );
  }

  Widget buildFundamental(
      BuildContext context, String type, String value, String image) {
    return Column(
      children: [
        Container(
          height: 55,
          width: 52,
          padding: const EdgeInsets.all(11),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(223, 223, 223, 1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: SvgPicture.asset('assets/icons/$image.svg'),
        ),
        const SizedBox(
          height: 7,
        ),
        Text(
          type,
          style: TextStyle(
            color: !Get.isDarkMode ? Colors.black : context.theme.shadowColor,
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        Text(
          value,
          style: TextStyle(
            color: Get.isDarkMode ? Colors.white : context.theme.shadowColor,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget buildNewsTile(
      {Size mq, String heading, String image, BuildContext context}) {
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
}
