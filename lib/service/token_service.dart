import 'dart:math';

import "package:bip39/bip39.dart" as bip39;
import 'package:bip32/bip32.dart' as bip32;
import 'package:hex/hex.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:surf_wallet/global.dart';
import 'package:surf_wallet/utils/http_server.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';
import 'package:surf_wallet/models/wallet.dart' as walletModel;

class TokenService {
  String customAgent = "";

  static String generateMnemonic() {
    String randomMnemonic = bip39.generateMnemonic();
    return randomMnemonic;
  }

  static maskAddress(String address) {
    if (address.length > 0) {
      return "${address.substring(0, 8)}...${address.substring(address.length - 12, address.length)}";
    } else {
      return address;
    }
  }

  String entropyToMnemonic(String entropyMnemonic) {
    return bip39.entropyToMnemonic(entropyMnemonic);
  }

  static String getPrivateKey(String mnemonic) {
    final seed = bip39.mnemonicToSeed(mnemonic);
    final root = bip32.BIP32.fromSeed(seed);
    final child1 = root.derivePath("m/44'/60'/0'/0/0");
    return bytesToHex(child1.privateKey);
  }

  static Future<EthereumAddress> getPublicAddress(String privateKey) async {
    final private = EthPrivateKey.fromHex(privateKey);
    final address = await private.extractAddress();
    return address;
  }

  static Future<String> getBalance(String address) async {
    String rpcUrl = Global.getBaseUrl();
    final client = Web3Client(rpcUrl, Client());
    EtherAmount balance = await client.getBalance(EthereumAddress.fromHex(address));
    double b = balance.getValueInUnit(EtherUnit.ether);
    return b.toStringAsFixed(4);
  }

  static Future<String> getTokenName(String address) async {
    Map params = {"data": "0x95d89b41"};
    var response = await Http().post(params: params, to: address);
    String res = response['result'];
    String name = res.replaceFirst('0x', '');
    String nameString = '';
    List hexList = HEX.decode(name);
    for (var i = 0; i < hexList.length; i++) {
      if (hexList[i] != 32 &&
          hexList[i] != 4 &&
          hexList[i] != 3 &&
          hexList[i] != 2 &&
          hexList[i] != 0) {
        String str = String.fromCharCode(hexList[i]);
        nameString = nameString + str;
      }
    }
    return nameString;
  }

  static Future<String> getTokenBalance(Map token) async {
    String myAddress = Global.getPrefs("currentWallet");
    Map params = {
      "data":
          Global.funcHashes['getTokenBalance()'] + myAddress.replaceFirst('0x', '').padLeft(64, '0')
    };
    var response = await Http().post(params: params, to: token['address']);
    double balance = BigInt.parse(response['result']) / BigInt.from(pow(10, token['decimals']));

    if (balance == 0.0) {
      return '0';
    } else {
      return balance.toStringAsFixed(3);
    }
  }

  static Future<int> getDecimals(String address) async {
    Map params = {"data": Global.funcHashes['getDecimals()']};
    var response = await Http().post(params: params, to: address);
    return int.parse(response['result'].replaceFirst("0x", ''), radix: 16);
  }

  static Future<String> allowance(context, String token) async {
    String myAddress = Provider.of<walletModel.Wallet>(context).currentWalletObject['address'];
    String postData = Global.funcHashes['allowance'] +
        myAddress.replaceFirst('0x', '').padLeft(64, '0') +
        Global.proxy.replaceFirst('0x', '').padLeft(64, '0');
    var reponse = await Http().post(params: {"data": postData}, to: token);
    return BigInt.parse(reponse['result']).toString();
  }
}
