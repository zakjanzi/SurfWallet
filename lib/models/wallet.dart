import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_wallet/db/sql_util.dart';
import 'package:surf_wallet/global.dart';
import 'package:surf_wallet/service/token_service.dart';
import 'package:surf_wallet/utils/wallet_crypt.dart';
import 'package:web3dart/web3dart.dart';

class TempWallet {
  String seedPhrase;
  String password;
  TempWallet({this.seedPhrase, this.password});
}

class Wallet extends ChangeNotifier {
  Wallet() {
    this._fetchWallet();
  }

  List<Map> _items = [];
  String currentWallet = "";
  String currentWalletName = "";
  Map currentWalletObject = {};
  Map _nowWallet = {};
  List<Map> get items => _items;
  Map get nowWallet => _nowWallet;

  Future<List> _fetchWallet() async {
    var sql = SqlUtil.setTable('wallet');
    List res = await sql.get();
    this._items = [];
    res.forEach((element) {
      this._items.add(element);
    });
  }

  void changeWallet(String address) async {
    if (address != null && address.length == 0) {
      address = Global.getPrefs("currentWallet");
    } else {
      await Global.setPrefs("currentWallet", address);
    }

    this.currentWallet = address;

    this._items.forEach((item) {
      if (item['address'] == address) {
        this.currentWalletObject = item;
      }
    });
    notifyListeners();
  }

  Future<int> add(Map item, String pwd) async {
    String randomMnemonic = item['randomMnemonic'];
    String privateKey = TokenService.getPrivateKey(randomMnemonic);
    EthereumAddress ethereumAddress = await TokenService.getPublicAddress(privateKey);
    String address = ethereumAddress.toString();
    String balance = await TokenService.getBalance(address);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String name = Global.getPrefs("new_wallet_name") ?? '';
    Global.setPrefs("new_wallet_name", "");
    item['privateKey'] = await WalletCrypt(pwd, item['privateKey']).encrypt();
    item['mnemonic'] = await WalletCrypt(pwd, item['mnemonic']).encrypt();
    var sql = SqlUtil.setTable("wallet");
    String sqlInsert =
        'INSERT INTO wallet(name, mnemonic, privateKey, address, balance) VALUES(?, ?, ?, ?, ?)';
    List list = [name, item['mnemonic'], item['privateKey'], address, balance];
    int id = await sql.rawInsert(sqlInsert, list);
    item['id'] = id;
    item['name'] = name;
    item['address'] = address;
    item['balance'] = balance;
    _items.add(item);
    this.currentWallet = item['address'];
    this.currentWalletObject = item;
    await Global.setPrefs("currentWallet", address);
    notifyListeners();
    return id;
  }
}
