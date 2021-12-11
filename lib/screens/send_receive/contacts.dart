import 'package:flutter/material.dart';
import 'package:surf_wallet/screens/send_receive/new_contact.dart';
import 'package:surf_wallet/utils/constants.dart';
import 'package:surf_wallet/utils/plugins/dashedContainer.dart';
import 'package:surf_wallet/utils/widgets/appbar.dart';
import 'package:surf_wallet/utils/widgets/genericButton.dart';
import 'package:surf_wallet/utils/widgets/genericText.dart';
import 'package:surf_wallet/utils/widgets/screenBody.dart';
import 'package:surf_wallet/utils/widgets/search_widget.dart';
import 'package:get/get.dart';

class Contacts extends StatefulWidget {
  Contacts({Key key}) : super(key: key);

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  bool showAllContact = false;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: buildGenricAppBar(context: context, title: "Contacts"),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeightBox(context, 0.02),
            AppBody(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SeearchWidget(
                          formKey: _formKey,
                          onSaved: (_) {},
                          placeholder: "Search Contacts",
                          validator: (_) {},
                        ),
                      ),
                      buildWidthBox(context, 0.02),
                       Image.asset( context.isDarkMode ? "assets/images/add-user-dark.png" :
                        "assets/images/addContact.png",
                        width: 25,
                      )
                    ],
                  ),
                  buildHeightBox(context, 0.03),
                ],
              ),
            ),
            showAllContact
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: GenericText(
                          title: "Recent",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      buildHeightBox(context, 0.03),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: List.generate(
                                10,
                                (index) => Container(
                                      margin: EdgeInsets.only(
                                          right: 35, left: index == 0 ? 10 : 0),
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "assets/images/crypto1.png"),
                                            maxRadius: 30,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          GenericText(
                                            title: "Ahmad",
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ],
                                      ),
                                    ))),
                      ),
                      buildHeightBox(context, 0.04),
                      AppBody(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GenericText(
                              title: "Contacts",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            buildHeightBox(context, 0.02),
                            GestureDetector(
                              onTap: () {
                                Get.to(NewContact());
                              },
                              child: Row(
                                children: [
                                  buildWidthBox(context, 0.02),
                                  FDottedLine(
                                    color: context.textTheme.headline1.color,
                                    height: 40,
                                    width: 40,
                                    strokeWidth: 2.0,
                                    dottedLength: 10.0,
                                    space: 3.0,
                                    corner: FDottedLineCorner.all(50),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Icon(
                                        Icons.add,
                                        color:
                                            context.textTheme.headline1.color,
                                      ),
                                    ),
                                  ),
                                  buildWidthBox(context, 0.01),
                                  GenericText(
                                    title: "Invite a friend",
                                    fontSize: 18,
                                    textColor:
                                        context.textTheme.headline1.color,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      buildHeightBox(context, 0.01),
                    ],
                  )
                : AppBody(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Image.asset(
                            "assets/images/noContacts.png",
                          ),
                        ),
                        buildHeightBox(context, 0.02),
                        GenericText(
                          title: "No one here at the moment",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        buildHeightBox(context, 0.02),
                        GenericText(
                          title: "Tap below to create a contact",
                          fontSize: 16,
                          textColor: context.theme.shadowColor,
                        ),
                        buildHeightBox(context, 0.10),
                        GenericButton(
                          onPressed: () {
                            if (!showAllContact) {
                              setState(() {
                                showAllContact = !showAllContact;
                              });
                            } else {
                              Get.to(NewContact());
                            }
                          },
                          textWidget: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Image.asset(
                              //   "assets/images/addContact.png",
                              //   width: 20,
                              // ),
                              Image.asset("assets/images/add-contact.png",width: 20,),
                              buildWidthBox(context, 0.01),
                              GenericText(
                                title: "Add contact ",
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                textColor: Colors.white,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
            showAllContact
                ? Expanded(
                    child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (con, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/crypto1.png"),
                            maxRadius: 25,
                          ),
                          title: GenericText(
                            title: "Joey B.",
                            fontSize: 18,
                          ),
                          subtitle: GenericText(
                            title: "3DeL..7pnp",
                            fontSize: 16,
                            textColor: context.theme.shadowColor,
                          ),
                          trailing: GenericButton(
                            height: getHeightWidth(context, true) * 0.04,
                            width: getHeightWidth(context, true) * 0.04,
                            title: "Send",
                            onPressed: () {},
                          ),
                        ),
                      );
                    },
                  ))
                : Container()
          ],
        ),
      ),
    );
  }
}
