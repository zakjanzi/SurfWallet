import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'receipt_screen.dart';
import '../../../data/models/history_tile_modal.dart';
import '../../../data/models/portfolio_crypto_list_tile_model.dart';

class CryptoScreen extends StatefulWidget {
  final PortfolioLCryptoListTileModel portfolioLCryptoListTileModel;

  const CryptoScreen({Key key, this.portfolioLCryptoListTileModel})
      : super(key: key);

  @override
  State<CryptoScreen> createState() => _CryptoScreenState();
}

class _CryptoScreenState extends State<CryptoScreen> {
  List<String> sortTagList = [];

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
      ),
      body: Column(
        children: [
          SizedBox(
            height: mq.height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: mq.width * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.portfolioLCryptoListTileModel.name} Balance',
                      style: TextStyle(
                        color: context.theme.shadowColor,
                        fontSize: 14.5,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text(
                      '\$0',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text(
                      '0.00BTC',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.orange,
                  backgroundImage: AssetImage(
                    widget.portfolioLCryptoListTileModel.image,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: mq.height * 0.05,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: mq.width * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Transactions History',
                  style: TextStyle(
                    color: context.theme.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    buildBottomSheet(mq, context);
                  },
                  icon: Get.isDarkMode
                      ? SvgPicture.asset('assets/icons/filter_dd.svg')
                      : SvgPicture.asset('assets/icons/filter.svg'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: mq.height * 0.035,
          ),
          buildHistoryListTile(
            context: context,
            historyTileModel: HistoryTileModel(
              isPositive: true,
              type: 'Received',
              dateTime: '30 August, 01:45 PM',
              quantity: '+0.0060BTC',
              price: '+\$343.82',
            ),
          ),
          SizedBox(
            height: mq.height * 0.01,
          ),
          buildHistoryListTile(
            context: context,
            historyTileModel: HistoryTileModel(
              isPositive: false,
              type: 'Sent',
              dateTime: '30 August, 01:45 PM',
              quantity: '+0.0060BTC',
              price: '+\$343.82',
            ),
          ),
          SizedBox(
            height: mq.height * 0.01,
          ),
          buildHistoryListTile(
            context: context,
            historyTileModel: HistoryTileModel(
              isPositive: true,
              type: 'Bought',
              dateTime: '30 August, 01:45 PM',
              quantity: '+0.0060BTC',
              price: '+\$343.82',
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHistoryListTile(
      {BuildContext context, HistoryTileModel historyTileModel}) {
    return ListTile(
      onTap: () {
        Get.to(
          () => ReceiptScreen(
            historyTileModel: historyTileModel,
          ),
        );
      },
      leading: Container(
        height: 52,
        width: 52,
        decoration: BoxDecoration(
          color: Get.isDarkMode
              ? historyTileModel.isPositive
                  ? const Color.fromRGBO(207, 247, 224, 1)
                  : const Color.fromRGBO(255, 194, 205, 1)
              : historyTileModel.isPositive
                  ? const Color.fromRGBO(209, 250, 228, 1)
                  : const Color.fromRGBO(255, 194, 205, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: !historyTileModel.isPositive
            ? const Icon(
                Icons.arrow_downward_sharp,
                color: Colors.black,
                size: 22,
              )
            : const Icon(
                Icons.arrow_upward_sharp,
                color: Colors.black,
                size: 22,
              ),
      ),
      title: Text(
        historyTileModel.type,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      subtitle: Text(
        historyTileModel.dateTime,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          height: 1.5,
          fontSize: 14,
          color: context.theme.shadowColor,
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            historyTileModel.price,
            style: TextStyle(
              fontSize: 17,
              color: Get.isDarkMode
                  ? historyTileModel.isPositive
                      ? const Color.fromRGBO(168, 230, 207, 1)
                      : const Color.fromRGBO(234, 57, 67, 1)
                  : historyTileModel.isPositive
                      ? const Color.fromRGBO(13, 114, 58, 1)
                      : const Color.fromRGBO(204, 0, 0, 1),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            historyTileModel.quantity,
            style: TextStyle(
              fontSize: 16,
              color: Get.isDarkMode
                  ? historyTileModel.isPositive
                      ? const Color.fromRGBO(168, 230, 207, 1)
                      : const Color.fromRGBO(234, 57, 67, 1)
                  : historyTileModel.isPositive
                      ? const Color.fromRGBO(13, 114, 58, 1)
                      : const Color.fromRGBO(204, 0, 0, 1),
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
              buildSortByListTile('Sent', 'ios_swap', context, setter),
              buildSortByListTile('Received', 'ios_swap', context, setter),
              buildSortByListTile('Bought', 'cart', context, setter),
              buildSortByListTile('Sold', 'bag', context, setter),
              SizedBox(
                height: mq.height * 0.04,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSortByListTile(
      String title, String image, BuildContext context, StateSetter setter) {
    return ListTile(
      onTap: () {
        if (sortTagList.contains(title)) {
          sortTagList.remove(title);
        } else {
          sortTagList.add(title);
        }
        setter(() {});
      },
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: sortTagList.contains(title)
              ? context.theme.hoverColor
              : context.theme.shadowColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(6.5),
        child: SvgPicture.asset('assets/icons/$image.svg'),
      ),
      title: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            color: sortTagList.contains(title)
                ? context.theme.hoverColor
                : context.theme.shadowColor),
      ),
      trailing: sortTagList.contains(title)
          ? Icon(
              Icons.done,
              color: context.theme.hoverColor,
            )
          : Icon(
              Icons.done,
              color: context.theme.backgroundColor,
            ),
    );
  }
}
