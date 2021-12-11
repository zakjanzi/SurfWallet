import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:surf_wallet/screens/onboarding/create_password.dart';

class SeedPhrase extends StatefulWidget {
  const SeedPhrase({Key key}) : super(key: key);

  @override
  State<SeedPhrase> createState() => _SeedPhraseState();
}

class _SeedPhraseState extends State<SeedPhrase> {
  final _controller1 = TextEditingController();

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
          'Seed Phrase',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: context.theme.primaryColor,
          ),
        ),
      ),
      body: Column(
        children: [
          buildSeedTextField(mq, context),
          const Spacer(),
          buildContinueButton(mq, context),
          SizedBox(
            height: mq.height * 0.03,
          ),
        ],
      ),
    );
  }

  Widget buildSeedTextField(Size mq, BuildContext context) {
    return Container(
      color: context.theme.cardColor,
      margin: EdgeInsets.all(
        mq.width * 0.04,
      ),
      padding: EdgeInsets.all(
        mq.width * 0.04,
      ),
      height: mq.height * 0.2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: TextField(
              style: TextStyle(color: context.theme.primaryColor),
              maxLines: 5,
              cursorColor: Colors.black45,
              decoration: const InputDecoration(
                hintText: 'Enter your seed phrase',
                border: InputBorder.none,
              ),
              controller: _controller1,
              onChanged: (_) {
                setState(() {});
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                FlutterClipboard.paste().then((value) {
                  setState(() {
                    _controller1.text = value;
                  });
                });
              },
              child: Text(
                'Paste',
                style: TextStyle(
                  fontSize: 16,
                  color: context.theme.canvasColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildContinueButton(Size mq, BuildContext context) {
    return SizedBox(
      height: 48,
      width: mq.width * 0.8,
      child: ElevatedButton(
        onPressed: _controller1.text.isNotEmpty
            ? () {
                Navigator.pushNamed(context, "create_password", arguments: _controller1.text);
              }
            : () {},
        style: ElevatedButton.styleFrom(
          elevation: 1,
          primary: _controller1.text.isNotEmpty
              ? context.theme.canvasColor
              : context.theme.canvasColor.withOpacity(0.25),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: const Text(
          'Continue',
          style: TextStyle(
            fontSize: 16,
            letterSpacing: 1,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
