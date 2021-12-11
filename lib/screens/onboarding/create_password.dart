import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:surf_wallet/screens/onboarding/seed_phrase.dart';
import 'package:surf_wallet/models/wallet.dart' as myWallet;
import './account_info.dart';

class CreatePasswordScreen extends StatefulWidget {
  final String seedPhrase;
  const CreatePasswordScreen({Key key, this.seedPhrase}) : super(key: key);
  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  final TextEditingController _controller1 = TextEditingController();

  final TextEditingController _controller2 = TextEditingController();

  final _focusEnterPassword = FocusNode();
  final _focusRenterPassword = FocusNode();

  bool isShown1 = false;
  bool isShown2 = false;

  @override
  void dispose() {
    _focusEnterPassword.dispose();
    _focusRenterPassword.dispose();
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
          'Password',
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
              'Create a password',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: context.theme.primaryColor,
              ),
            ),
            SizedBox(
              height: mq.height * 0.04,
            ),
            const Text(
              'Enter a password',
              style: TextStyle(
                fontSize: 15,
                color: Color.fromRGBO(150, 150, 150, 1),
              ),
            ),
            SizedBox(
              height: mq.height * 0.02,
            ),
            buildPasswordField(mq),
            SizedBox(
              height: mq.height * 0.01,
            ),
            if (_controller1.text.isNotEmpty && _focusEnterPassword.hasFocus)
              Text(
                strength1,
                style: TextStyle(
                  color: strength1 == "Strong"
                      ? const Color.fromRGBO(22, 201, 163, 1)
                      : strength1 == "Weak"
                          ? Colors.redAccent
                          : Colors.yellow,
                ),
              ),
            SizedBox(
              height: mq.height * 0.04,
            ),
            const Text(
              'Re-enter a password',
              style: TextStyle(
                fontSize: 15,
                color: Color.fromRGBO(150, 150, 150, 1),
              ),
            ),
            SizedBox(
              height: mq.height * 0.02,
            ),
            buildReEnterPasswordField(mq),
            SizedBox(
              height: mq.height * 0.01,
            ),
            if (_controller2.text.isNotEmpty && _focusRenterPassword.hasFocus)
              Text(
                strength2,
                style: TextStyle(
                  color: strength2 == "Strong"
                      ? const Color.fromRGBO(22, 201, 163, 1)
                      : strength2 == "Weak"
                          ? Colors.redAccent
                          : Colors.yellow,
                ),
              ),
            SizedBox(
              height: mq.height * 0.035,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                  ),
                  child: SizedBox(
                    height: 27,
                    width: 27,
                    child: Get.isDarkMode
                        ? Image.asset('assets/images/infod.png')
                        : Image.asset('assets/images/info.png'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    'You will be asked to enter this password everytime you login to the app. A strong password is highly recommended.',
                    style: TextStyle(
                      color: context.theme.primaryColor,
                      height: 1.5,
                      fontSize: 14.5,
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
              height: mq.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }

  String strength1 = "Weak";

  Widget buildPasswordField(Size mq) {
    return TextField(
      style: TextStyle(color: context.theme.primaryColor),
      obscureText: isShown1,
      cursorColor: Colors.black54,
      decoration: InputDecoration(
        suffixIcon: _controller1.text.isNotEmpty
            ? IconButton(
                icon: Icon(
                  isShown1 == true ? Icons.visibility_off : Icons.visibility,
                  color: context.theme.highlightColor,
                ),
                onPressed: () {
                  setState(() {
                    isShown1 = !(isShown1);
                  });
                },
              )
            : Container(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: strength1 == "Strong"
                ? const Color.fromRGBO(22, 201, 163, 1)
                : strength1 == "Weak"
                    ? Colors.redAccent
                    : Colors.yellow,
          ),
        ),
      ),
      focusNode: _focusEnterPassword,
      controller: _controller1,
      onChanged: (_) {
        if (_controller1.text.length > 6 &&
            _controller1.text.length <= 23 &&
            containsNumber(_controller1.text)) {
          setState(() {
            strength1 = "Medium";
          });
        } else if (_controller1.text.length >= 24 && containsNumber(_controller1.text)) {
          setState(() {
            strength1 = "Strong";
          });
        } else {
          setState(() {
            strength1 = "Weak";
          });
        }
      },
    );
  }

  bool containsNumber(String text) {
    if (text.contains('0') ||
        text.contains('1') ||
        text.contains('2') ||
        text.contains('3') ||
        text.contains('4') ||
        text.contains('5') ||
        text.contains('6') ||
        text.contains('7') ||
        text.contains('8') ||
        text.contains('9')) {
      return true;
    }

    return false;
  }

  String strength2 = "Weak";

  Widget buildReEnterPasswordField(Size mq) {
    return TextField(
      style: TextStyle(color: context.theme.primaryColor),
      obscureText: isShown2,
      cursorColor: Colors.black54,
      decoration: InputDecoration(
        suffixIcon: _controller2.text.isNotEmpty
            ? IconButton(
                icon: Icon(
                  isShown2 == true ? Icons.visibility_off : Icons.visibility,
                  color: context.theme.highlightColor,
                ),
                onPressed: () {
                  setState(() {
                    isShown2 = !(isShown2);
                  });
                },
              )
            : Container(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: strength2 == "Strong"
                ? const Color.fromRGBO(22, 201, 163, 1)
                : strength2 == "Weak"
                    ? Colors.redAccent
                    : Colors.yellow,
          ),
        ),
      ),
      focusNode: _focusRenterPassword,
      controller: _controller2,
      onChanged: (_) {
        if (_controller2.text.length > 6 &&
            _controller2.text.length <= 23 &&
            containsNumber(_controller2.text)) {
          setState(() {
            strength2 = "Medium";
          });
        } else if (_controller2.text.length >= 24 && containsNumber(_controller2.text)) {
          setState(() {
            strength2 = "Strong";
          });
        } else {
          setState(() {
            strength2 = "Weak";
          });
        }
      },
    );
  }

  Widget buildContinueButton(Size mq) {
    return SizedBox(
      height: 48,
      width: mq.width * 0.8,
      child: ElevatedButton(
        onPressed: _controller1.text.isNotEmpty &&
                _controller2.text.isNotEmpty &&
                (_controller1.text == _controller2.text)
            ? () async {
                print('seed phrase yo : ${widget.seedPhrase}');
                // Map obj = {'randomMnemonic': widget.seedPhrase};
                // await Provider.of<myWallet.Wallet>(context, listen: false)
                //     .add(obj, _controller1.text);
                Navigator.pushNamed(context, "account_info",
                    arguments: myWallet.TempWallet(
                        seedPhrase: widget.seedPhrase, password: _controller1.text));
              }
            : () {},
        style: ElevatedButton.styleFrom(
          elevation: 1,
          primary: _controller1.text.isNotEmpty &&
                  _controller2.text.isNotEmpty &&
                  (_controller1.text == _controller2.text)
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
