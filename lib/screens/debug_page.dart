import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:image_picker_saver/image_picker_saver.dart';
import 'package:http/http.dart' as http;
//import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:local_auth/local_auth.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:surf_wallet/service/token_service.dart';
import 'package:surf_wallet/utils/flutter_aes_ecb_pkcs5.dart';

import 'dart:convert';
import 'package:web3dart/web3dart.dart';
import 'package:web3dart/crypto.dart';
import 'package:crypto/crypto.dart';
import 'package:bip32/bip32.dart' as bip32;

import 'package:convert/convert.dart';
import 'package:decimal/decimal.dart';
import 'dart:math';

class TokenModel {
  final String bankName;

  final String cardNumber;

  const TokenModel({
    this.bankName,
    this.cardNumber,
  });
}

class DebugPage extends StatefulWidget {
  DebugPage() : super();
  @override
  _DebugPageState createState() => _DebugPageState();
}

class _DebugPageState extends State<DebugPage> {
  final LocalAuthentication auth = LocalAuthentication();

  Future<Null> _checkBiometrics() async {
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
      print(canCheckBiometrics);
      _authenticate();
    } catch (e) {
      print(e);
    }
    if (!mounted) return;
  }

  Future<Null> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
          biometricOnly: true,
          localizedReason: 'Scan fingerprint for authentication',
          useErrorDialogs: true,
          stickyAuth: false);
    } catch (e) {
      print(e);
    }
    if (!mounted) return;

    final snackBar =
        new SnackBar(content: new Text(authenticated ? 'Verification' : 'verification failed'));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  Future<String> getData() async {
    await Future.delayed(Duration(seconds: 5));
    return "Returns a Future object";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("debugging"),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          child: ListView(
            children: <Widget>[
              TextButton(
                  child: Text("ascii to hex"),
                  style: TextButton.styleFrom(primary: Colors.blue),
                  onPressed: () {
                    var bytes = utf8.encode("quotetokens");

                    print(bytesToHex(bytes));
                  }),
              TextButton(
                  child: Text("class test"),
                  style: TextButton.styleFrom(primary: Colors.blue),
                  onPressed: () {
                    Map a = {'cardNumber': 'xx', 'bankName': 'zb'};
                    final data = new TokenModel();
                    print(data.bankName);
                  }),
              TextButton(
                  child: Text("STREAM debugging"),
                  style: TextButton.styleFrom(primary: Colors.blue),
                  onPressed: () async {
//                Duration interval = Duration(seconds: 1);
//                Stream<int> stream = Stream.periodic(interval, (data) => data);
//                await for(int i in stream ){
//                  print(i);
//                };

                    StreamController<String> streamController = StreamController();
                    Stream stream = streamController.stream.asBroadcastStream();
                    stream.listen((data) => print(data));
                    stream.listen((data) => print(data));
                    streamController.sink.add("aaa");
                    streamController.add("bbb");
                    streamController.add("ccc");
                    streamController.close();
                  }),
              TextButton(
                child: Text("FUTURE debugging"),
                style: TextButton.styleFrom(primary: Colors.blue),
                onPressed: () async {
                  Future.value(1).then((value) {
                    return Future.value(value + 2);
                  }).then((value) {
                    return Future.value(value + 3);
                  }).then(print);
//                var future=Future.value(1);
//                future.then((res) => {
//                  print(res)
//                });
////                print(double.parse('1234.12').toStringAsFixed(4));
//                 print(NumberFormat(1.5000).format());
//                 print(NumberFormat('100.00').format());
//                 print(NumberFormat(0.010000).format());
//                var f1 = Future(() {
//                  return 'f1';
//                });
//                var f2 = Future(() {
//                  return 'f2';
//                });
//                await Future.wait({f1,f2}).then(print).catchError(print);
//                print("111");
//                var future1 = new Future.delayed(new Duration(seconds: 1), () => 1);
//                var future2 = new Future.delayed(new Duration(seconds: 2), () => 2);
//                var future3 = new Future.delayed(new Duration(seconds: 3), () => 3);
//                Future.wait({future1,future2,future3}).then(print).catchError(print);
//                var future1 = new Future.delayed(new Duration(seconds: 1), () => 1);
//                var future2 =new Future.delayed(new Duration(seconds: 2), () => throw "throw error2");
//                var future3 = new Future.delayed(new Duration(seconds: 3), () => throw "throw error3");
//                Future.wait({future1,future2,future3}).then(print).catchError(print);
//                var random = new Random();
//                var totalDelay = 0;
//                Future.doWhile(() {
//                  if (totalDelay > 10) {
//                    print('total delay: $totalDelay seconds');
//                    return false;
//                  }
//                  var delay = random.nextInt(5) + 1;
//                  totalDelay += delay;
//                  return new Future.delayed(new Duration(seconds: delay), () {
//                    print('waited $delay seconds');
//                    return true;
//                  });
//                }).then(print)
//                .catchError(print);
                },
              ),
              TextButton(
                child: Text("set password"),
                style: TextButton.styleFrom(primary: Colors.blue),
                onPressed: () {},
              ),
              TextButton(
                child: Text("Delete Transaction Record Database"),
                style: TextButton.styleFrom(primary: Colors.blue),
                onPressed: () async {
//                final provider = new ProviderSql();
//                await provider.clearTrade();
                  print(Decimal.parse(pow(10, 18).toString()));
                },
              ),
//            TextButton(
//              child: Text("Enter payment password"),
//              style: TextButton.styleFrom(
//              primary: Colors.blue
//              ),
//              onPressed: () async {
//                print('Start entering payment');
//                Navigator.pushNamed(context, "keyboard_main").then((data){
//                  //Accept the parameters
//                  print(data.toString());
//                });
//              },
//            ),
              TextButton(
                child: Text("Click to generate help"),
                style: TextButton.styleFrom(primary: Colors.blue),
                onPressed: () async {
                  String randomMnemonic = bip39.generateMnemonic();
                  print(randomMnemonic);
                },
              ),
              TextButton(
                child: Text("Helpful words transfer SEED"),
                style: TextButton.styleFrom(primary: Colors.blue),
                onPressed: () async {
                  String randomMnemonic = bip39.generateMnemonic();
                  print(randomMnemonic);
                  String privateKey = TokenService.getPrivateKey(randomMnemonic);
                  print(privateKey);
                  EthereumAddress publicKey = await TokenService.getPublicAddress(privateKey);
                  print(publicKey.hexNo0x);
                  String seed = bip39.mnemonicToSeedHex(randomMnemonic);
                  print(seed);
                },
              ),
              // TextButton(
              //   child: Text("Help the word transfer private key"),
              //   style: TextButton.styleFrom(
              //     primary: Colors.blue
              //   ),
              //   onPressed: () async {
              //     String randomMnemonic = bip39.generateMnemonic();
              //     print(randomMnemonic);
              //     var seed1 = bip39.mnemonicToSeed(randomMnemonic);
              //     var hdWallet = new bf.HDWallet.fromSeed(seed1);
              //     print(hdWallet.address);
              //     // => 12eUJoaWBENQ3tNZE52ZQaHqr3v4tTX4os
              //     print(hdWallet.pubKey);
              //     // => 0360729fb3c4733e43bf91e5208b0d240f8d8de239cff3f2ebd616b94faa0007f4
              //     print(hdWallet.privKey);
              //     // => 01304181d699cd89db7de6337d597adf5f78dc1f0784c400e41a3bd829a5a226
              //     print(hdWallet.wif);
              //     var wallet = bf.Wallet.fromWIF(hdWallet.wif);
              //     print(wallet.address);
              //     // => 19AAjaTUbRjQCMuVczepkoPswiZRhjtg31
              //     print(wallet.pubKey);
              //     // => 03aea0dfd576151cb399347aa6732f8fdf027b9ea3ea2e65fb754803f776e0a509
              //     print(wallet.privKey);
              //     // => 3095cb26affefcaaa835ff968d60437c7c764da40cdd1a1b497406c7902a8ac9
              //     print(wallet.wif);
              //   },
              // ),
              TextButton(
                child: Text("seedchangeprivateKey"),
                style: TextButton.styleFrom(primary: Colors.blue),
                onPressed: () async {
                  String randomMnemonic = bip39.generateMnemonic();
                  print(randomMnemonic);
                  String seed = bip39.mnemonicToSeedHex(randomMnemonic);
                  print(seed);
                },
              ),
              TextButton(
                child: Text("Private key encryption"),
                style: TextButton.styleFrom(primary: Colors.blue),
                onPressed: () async {
                  var data =
                      "razor romance foot shell monkey fatal deer exile wood merge income roof";

                  var password = "123456";

                  var digest = md5.convert(new Utf8Encoder().convert(password));

                  print(hex.encode(digest.bytes));
                  var encryptText =
                      await FlutterAesEcbPkcs5.encryptString(data, hex.encode(digest.bytes));

                  print(encryptText);
                  var decryptText =
                      await FlutterAesEcbPkcs5.decryptString(encryptText, hex.encode(digest.bytes));

                  print(decryptText);
                },
              ),
              TextButton(
                child: Text("HMAC-SHA512"),
                style: TextButton.styleFrom(primary: Colors.blue),
                onPressed: () async {
                  String randomMnemonic = bip39.generateMnemonic();
                  print(randomMnemonic);
                  var key = utf8.encode('');
                  var bytes = utf8.encode(randomMnemonic);
                  var hmacSha256 = new Hmac(sha512, key); // HMAC-SHA256
                  var digest = hmacSha256.convert(bytes);
                  print("HMAC digest as bytes: ${digest.bytes}");
                  print("HMAC digest as hex string: $digest");
                },
              ),
              TextButton(
                child: Text("derivePath"),
                style: TextButton.styleFrom(primary: Colors.blue),
                onPressed: () async {
                  const mnemonic =
                      'praise you muffin lion enable neck grocery crumble super myself license ghost';
                  final seed = bip39.mnemonicToSeed(mnemonic);
                  final root = bip32.BIP32.fromSeed(seed);
                  final child1 = root.derivePath("m/44'/60'/0'/0/0");
                  print(bytesToHex(child1.publicKey));
                  print(bytesToHex(child1.privateKey));
                  final private = EthPrivateKey.fromHex(bytesToHex(child1.privateKey));
                  final address = await private.extractAddress();
                  print(address);
                },
              ),
              TextButton(
                child: Text("BigInt"),
                style: TextButton.styleFrom(primary: Colors.blue),
                onPressed: () async {
                  print(BigInt.from(200));
                  print(BigInt.parse('2000'));
                  print(BigInt.from(10).pow(18)); // 10的18次方
                  print(BigInt.from(10).pow(3));
//                print(1234 * BigInt.from(10).pow(18));
                  // String val = '8ac7230489e80000';
                  // print(int.parse(val.replaceFirst("0x",''), radix: 16));
                  print(BigInt.parse('0x000000000000000000008ac7230489e80000'));
                },
              ),
              TextButton(
                child: Text("Password input"),
                style: TextButton.styleFrom(primary: Colors.blue),
                onPressed: () {
                  //Navigator.pushNamed(context, "password");

                  Navigator.pushNamed(context, "getPassword");
                },
              ),
              TextButton(
                child: Text("set password"),
                style: TextButton.styleFrom(primary: Colors.blue),
                onPressed: () {
                  Navigator.pushNamed(context, "password");

                  //Navigator.pushNamed(context, "getPassword");
                },
              ),
              TextButton(
                child: Text("Int test"),
                style: TextButton.styleFrom(primary: Colors.blue),
                onPressed: () {
//                print(int.parse('2.0'));
                  print(double.parse('2'));
                },
              ),
            ],
          ),
        ));
  }
}
