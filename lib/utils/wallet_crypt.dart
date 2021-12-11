import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:surf_wallet/utils/flutter_aes_ecb_pkcs5.dart';

// Wallet encryption and decryption
class WalletCrypt {
  final String pwd;
  final String data;

  WalletCrypt(this.pwd, this.data);

  // Give wallet encryption
  Future<String> encrypt() async {
    var content = new Utf8Encoder().convert(this.pwd);
    var digest = md5.convert(content);
    final passwordMd5 = hex.encode(digest.bytes);
    try {
      String res = await FlutterAesEcbPkcs5.encryptString(this.data, passwordMd5);
      return res;
    } catch (e) {
      return e.toString();
    }
  }

  // Decrypt wallet
  Future<String> decrypt() async {
    var content = new Utf8Encoder().convert(this.pwd);
    var digest = md5.convert(content);
    final passwordMd5 = hex.encode(digest.bytes);
    try {
      String res = await FlutterAesEcbPkcs5.decryptString(this.data, passwordMd5);
      return res;
    } catch (e) {
      return e.toString();
    }
  }
}
