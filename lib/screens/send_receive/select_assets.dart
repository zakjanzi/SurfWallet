import 'package:flutter/material.dart';
import 'package:surf_wallet/screens/home/bottom_nav_screen.dart';
import 'package:surf_wallet/screens/send_receive/receive_send_bottomSheet.dart';
import 'package:surf_wallet/screens/send_receive/select_contact.dart';
import 'package:surf_wallet/screens/send_receive/send_to.dart';
import 'package:surf_wallet/utils/widgets/appbar.dart';
import 'package:surf_wallet/utils/widgets/genericCard.dart';
import 'package:surf_wallet/utils/widgets/genericText.dart';
import 'package:surf_wallet/utils/widgets/screenBody.dart';
import 'package:get/get.dart';
import 'package:surf_wallet/utils/widgets/search_widget.dart';

import '../../utils/constants.dart';

class SelectAsset extends StatefulWidget {
  final bool isSendTo;
  SelectAsset({Key key, this.isSendTo}) : super(key: key);

  @override
  _SelectAssetState createState() => _SelectAssetState();
}

class _SelectAssetState extends State<SelectAsset> {
  final _formKey = GlobalKey<FormState>();

  //testing show bottom sheet
  showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        elevation: 50,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return ReceiveSendBottomSheet();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: buildGenricAppBar(
            context: context,
            onLeading: () {
              Get.offAll(BottomNavScreen(
                initialIndex: 2,
              ));
            },
            title: "Select Asset"),
        body: AppBody(
          child: Column(
            children: [
              buildHeightBox(context, 0.04),
              SeearchWidget(
                formKey: _formKey,
                placeholder: "Search an asset",
                onSaved: (_) {},
                validator: (_) {},
              ),
              buildHeightBox(context, 0.03),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 2.0,
                  shrinkWrap: true,
                  children: List.generate(
                    20,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GenericCard(
                          height: getHeightWidth(context, true) * 0.20,
                          child: CardData(
                            image: "assets/images/crypto1.png",
                            onTap: () {
                              if (widget.isSendTo ?? false) {
                                Get.to(SendTo());
                              } else {
                                Get.to(SelectContact());
                              }
                            },
                            subTitle2: "0.00BTC",
                            subTitle: "0.00USD",
                            title: "Bitcoin",
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class CardData extends StatelessWidget {
  final String title;
  final String subTitle;
  final String subTitle2;
  final String image;
  final Function onTap;
  CardData({
    Key key,
    this.title,
    this.subTitle,
    this.subTitle2,
    this.onTap,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                image,
                width: 40,
              ),
              buildWidthBox(context, 0.02),
              GenericText(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                textColor: context.theme.primaryColor,
                title: title,
              )
            ],
          ),
          buildHeightBox(context, 0.03),
          GenericText(
            fontSize: 15,
            fontWeight: FontWeight.normal,
            textColor: context.theme.primaryColor,
            title: subTitle,
          ),
          SizedBox(
            height: 4,
          ),
          GenericText(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            textColor: Colors.grey,
            title: subTitle2,
          ),
        ],
      ),
    );
  }
}
