import 'package:flutter/material.dart';
import 'package:surf_wallet/utils/constants.dart';
import 'package:surf_wallet/utils/widgets/genericText.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';

class AmtReceiveViaQR extends StatelessWidget {
  const AmtReceiveViaQR({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(15),
          height: getHeightWidth(context, true) * 0.40,
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: context.theme.backgroundColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.close,
                    size: 30,
                  ),
                ),
              ),
              buildHeightBox(context, 0.02),
              GenericText(
                fontSize: 15,
                title: "You received",
                fontWeight: FontWeight.bold,
              ),
              buildHeightBox(context, 0.01),
              GenericText(
                title: "\$35.00",
                fontSize: 48,
                textColor: context.textTheme.headline1.color,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 5,
              ),
              GenericText(
                title: "0.00000104 BTC",
                fontSize: 15,
                textColor: context.theme.shadowColor,
              ),
              buildHeightBox(context, 0.05),
              GenericText(
                title: "From Wallet Adress",
                fontSize: 12,
                textColor: context.theme.shadowColor,
              ),
              buildHeightBox(context, 0.01),
              GenericText(
                title: "3DeLu7CZYD..3dW6P37pnp",
                fontSize: 16,
              ),
            ],
          ),
        ));
  }
}
