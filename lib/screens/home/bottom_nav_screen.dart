import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:surf_wallet/screens/send_receive/receive_send_bottomSheet.dart';

import './buy_and_sell.dart';
import './portfolio_screen.dart';
import './right_left_screen.dart';

class BottomNavScreen extends StatefulWidget {
  int initialIndex;

  BottomNavScreen({Key key, this.initialIndex = 0}) : super(key: key);

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List<Widget> screens = [
    const PortfolioScreen(),
    BuyAndSellScreen(),
    const ReceiveSendBottomSheet(),
  ];

  int pageIndex = 0;

  void selectPage(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    pageIndex = widget.initialIndex ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: selectPage,
        backgroundColor: context.theme.cardColor,
        currentIndex: pageIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.pinkAccent,
        selectedIconTheme: const IconThemeData(
          color: Colors.pinkAccent,
        ),
        unselectedIconTheme: const IconThemeData(
          color: Colors.pinkAccent,
        ),
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          color: Colors.pinkAccent,
          fontWeight: FontWeight.w600,
        ),
        items: [
          BottomNavigationBarItem(
            icon: pageIndex == 0
                ? Container(
                    height: 43.5,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? const Color.fromRGBO(33, 31, 42, 1)
                          : const Color.fromRGBO(245, 245, 245, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Get.isDarkMode
                            ? SvgPicture.asset(
                                'assets/icons/portfolio_dd.svg',
                                fit: BoxFit.contain,
                              )
                            : SvgPicture.asset(
                                'assets/icons/portfolio.svg',
                                fit: BoxFit.contain,
                              ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Portfolio',
                          style: TextStyle(
                              color: context.theme.hoverColor, fontSize: 15.2),
                        ),
                      ],
                    ),
                  )
                : SizedBox(
                    height: 43.5,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Get.isDarkMode
                            ? SvgPicture.asset(
                                'assets/icons/tab.svg',
                                fit: BoxFit.contain,
                              )
                            : SvgPicture.asset(
                                'assets/icons/wallet.svg',
                                fit: BoxFit.contain,
                              ),
                      ],
                    ),
                  ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: pageIndex == 1
                ? Container(
                    height: 43.5,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? const Color.fromRGBO(33, 31, 42, 1)
                          : const Color.fromRGBO(245, 245, 245, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Get.isDarkMode
                            ? SvgPicture.asset(
                                'assets/icons/tabd.svg',
                                fit: BoxFit.contain,
                              )
                            : SvgPicture.asset(
                                'assets/icons/swap2.svg',
                                fit: BoxFit.contain,
                              ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Buy & Sell',
                          style: TextStyle(
                              color: context.theme.hoverColor, fontSize: 15.2),
                        ),
                      ],
                    ),
                  )
                : SizedBox(
                    height: 43.5,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Get.isDarkMode
                            ? SvgPicture.asset(
                                'assets/icons/tab1.svg',
                                fit: BoxFit.contain,
                              )
                            : SvgPicture.asset(
                                'assets/icons/swap.svg',
                                fit: BoxFit.contain,
                              ),
                      ],
                    ),
                  ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: pageIndex == 2
                ? Container(
                    height: 43.5,
                    padding: const EdgeInsets.symmetric(vertical : 10),
                    decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? const Color.fromRGBO(33, 31, 42, 1)
                          : const Color.fromRGBO(245, 245, 245, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Get.isDarkMode
                            ? SvgPicture.asset(
                                'assets/icons/swap_ld.svg',
                                fit: BoxFit.contain,
                              )
                            : SvgPicture.asset(
                                'assets/icons/swap_l.svg',
                                fit: BoxFit.contain,
                              ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Send & receive',
                          style: TextStyle(
                              color: context.theme.hoverColor, fontSize: 13),
                        ),
                      ],
                    ),
                  )
                : SizedBox(
                    height: 43.5,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Get.isDarkMode
                            ? SvgPicture.asset(
                                'assets/icons/tab2.svg',
                                fit: BoxFit.contain,
                              )
                            : SvgPicture.asset(
                                'assets/icons/swap_r.svg',
                                fit: BoxFit.contain,
                              ),
                      ],
                    ),
                  ),
            label: '',
          ),
        ],
      ),
    );
  }
}
