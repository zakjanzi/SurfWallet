import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ChangeUsernameScreen extends StatefulWidget {
  const ChangeUsernameScreen({Key key}) : super(key: key);

  @override
  State<ChangeUsernameScreen> createState() => _ChangeUsernameScreenState();
}

class _ChangeUsernameScreenState extends State<ChangeUsernameScreen> {
  final TextEditingController _controller1 = TextEditingController();

  @override
  void dispose() {
    _controller1.dispose();
    super.dispose();
  }

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
          'Username',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: context.theme.primaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mq.width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: mq.height * 0.02,
            ),
            Text(
              'Username',
              style: TextStyle(
                fontSize: 16,
                color: context.theme.shadowColor,
              ),
            ),
            SizedBox(
              height: mq.height * 0.012,
            ),
            buildPasswordField(mq),
            SizedBox(
              height: mq.height * 0.035,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 2.5,
                  ),
                  child: SizedBox(
                    height: 22,
                    width: 22,
                    child: Get.isDarkMode
                        ? Image.asset('assets/icons/info_dd.png')
                        : Image.asset('assets/images/info.png'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    'Tip: Don’t use your real name.',
                    style: TextStyle(
                      color: Get.isDarkMode
                          ? context.theme.shadowColor
                          : Colors.black,
                      height: 1.5,
                      fontSize: 15.5,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Center(
              child: buildContinueButton(mq),
            ),
            SizedBox(
              height: mq.height * 0.1,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPasswordField(Size mq) {
    return TextField(
      style: TextStyle(color: context.theme.primaryColor),
      cursorColor: Colors.black54,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: context.theme.canvasColor,
          ),
        ),
      ),
      controller: _controller1,
      onChanged: (_) {
        setState(() {});
      },
    );
  }

  Widget buildContinueButton(Size mq) {
    return SizedBox(
      height: 48,
      width: mq.width * 0.8,
      child: ElevatedButton(
        onPressed: _controller1.text.isNotEmpty
            ? () {
                // nabvi
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
          'Save New Username',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
