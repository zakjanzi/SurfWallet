import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/services.dart';

//Provide five optional theme color
const _themes = <MaterialColor>[
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red,
];

//Global shared variable
//After modifying the global variable, Android Studio needs to restart the application, and the hot load does not automatically update the global variable.
class Global {
  //Current version number
  static const version = 'pre-1.0.0';

  //Global call _PREFS implementation KV save and read
  static SharedPreferences _prefs;
  //static Profile profile = Profile();

  //Network caching object
  //static NetCache netCache = NetCache();
  static String network = "";

  //Optional topic list
  static List<MaterialColor> get themes => _themes;

  //Is it a release version?
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  //After scanning code, save a global address, and then the transfer page, display this address.
  static String _toAddress = '';
  static String get toAddress => _toAddress;

  //Agent contract, used to authorize Token
  static const proxy = "";

  //Execution order
  static const tempMatchAddress = "";

  //Account for collecting transaction fee
  static const taxAddress = "";

  //The matching order of the order that has a number of quotes in this contract
  static const hydroAddress = "";

  //Add a configuration contract to get the Token list information
  static const surfMatchConfig = "";

  //Refresh the interval time of the order
  static const orderUpdateTime = 10;

  //Popular TOKEN
  static const hotToken = [
    {'name': 'BTAT', 'address': '', 'color': Colors.black12, 'icon': 0xe648, 'network': 'ropsten'},
    {'name': 'BTBT', 'address': '', 'color': Colors.black12, 'icon': 0xe648, 'network': 'ropsten'},
    {'name': 'BTCT', 'address': '', 'color': Colors.black12, 'icon': 0xe648, 'network': 'ropsten'},
    {'name': 'BTDT', 'address': '', 'color': Colors.black12, 'icon': 0xe648, 'network': 'ropsten'},
    {'name': 'USDT', 'address': '', 'color': Colors.green, 'icon': 0xe7f8, 'network': 'mainnet'},
    {'name': 'BNB', 'address': '', 'color': Colors.yellow, 'icon': 0xe7ec, 'network': 'mainnet'},
    {'name': 'SHT', 'address': '', 'color': Colors.black26, 'icon': 0xe648, 'network': 'mainnet'},
    {'name': 'EOS', 'address': '', 'color': Colors.black, 'icon': 0xe7ef, 'network': 'mainnet'}
  ];

  //Order status index
  static const orderStatusMap = [
    {
      'type': 'ORDER_NONE',
      'status': 'No order',
      'Remark': 'The order is not yet initiated for the chain'
    },
    {
      'type': 'ORDER_OK',
      'status': 'Order Complete',
      'Remark': 'The order is complete and is completed'
    },
    {
      'type': 'ORDER_PENDING',
      'status': 'Order pending',
      ' Remark ': 'The order is in pending state.'
    },
    {
      'type': 'ORDER_FINISHED',
      'status': 'Order Complete',
      'Remark': 'The order is completed, the last state was ORDER_PENDING.'
    },
    {
      'type': 'ORDER_EXPIRED',
      'status': 'Order Timeout',
      'Remark': 'Order Timeout, the order has timedout, the last state was ORDER_PENDING'
    },
    {
      'type': 'ORDER_CANCELED',
      'status': 'Order Cancel',
      'Remark': 'Order is cancelled, the last state was ORDER_PENDING.'
    },
    {
      'type': 'ORDER_REMOVED',
      'status': 'Order is removed',
      'REMARK': 'Order is Removed, account balance is insufficient, last state was ORDER_PENDING.'
    }
  ];

  //gas price 10Gwei
  static final gasPrice = BigInt.from(10000000000);
  //static const gasPrice = 10000000000;

  //GAS LIMIT 300,000
  static const gasLimit = 5000000;

  //The current user's wallet address is a simple address, 0x start string
  static String currentWallet = '';

  //Number of decimal numbers in the overall configuration
  static int numDecimal = 4;

  //Small configuration price
  static int priceDecimal = 6;

  //All Function Hash
  static const funcHashes = {
    'filled(bytes32)': '0x288cdc91',
    'getOrderQueueInfo(address,address,bool)': '0x22f42f6b',
    'transfer(address,uint256)': '0xa9059cbb',
    'getOrderInfo(bytes32,bytes32,bool)': '0xb7f92b4a',
    'takeOrder()': '0xefe29415',
    'approve()': '0x095ea7b3',
    'allowance': '0xdd62ed3e',
    'cancelOrder(bytes32,bytes32)': '0xa47d9d33',
    'cancelOrder2(bytes32,bytes32)': '0xa18d42d3',
    'orderFlag(bytes32)': '0xf8a8db0e',
    'sellQueue(bytes32)': '0xf875a998',
    'getOrderDepth(bytes32)': '0x3e8c0c4c',
    'getBQODHash()': '0xefe331cf',
    'getBQHash()': '0x30d598ed',
    'getDecimals()': '0x313ce567',
    'getTokenBalance()': '0x70a08231',
    'getConfigData()': '0xfeee047e',
    'getConfigSignature()': '0x0b973ca2',
    'orderFlags(bytes32 od_hash)': '0x76356e86',
    'configurations(string key)': '0x1214dd58',
  };

  static const myKey = "v3/37caa7b8b2c34ced8819de2b3853c8a2";

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();

    //Get the current Etikong network
    network = _prefs.getString("network");

    currentWallet = _prefs.getString("currentWallet");
    //Initialize network request related configuration
    //gitInit();
  }

  static Future<String> rpcUrl() async {
    String network = _prefs.getString("network");
    // return "https://" +Network + "InfuraIo/" +MyKey;
    return "";
  }

  static String getBaseUrl() {
    return /* "https://" + GetPrefs('network') + "InfuraIo/" + MyKey; */ "";
  }

  //https://ropsten.etherscan.io/tx/
  static String getDomain() {
    return /* "https://" + GetPrefs('network') + "EtherscanIo/tx/"; */ "";
  }

  //Get data in the cache
  static String getPrefs(String key) {
    return _prefs.getString(key);
  }

  //Set data in the cache
  static Future<bool> setPrefs(String key, String value) async {
    return _prefs.setString(key, value);
  }

  //Shorten the length of the wallet address
  static maskAddress(String address) {
    if (address.length > 0) {
      return "${address.substring(0, 6)}  ****  ****  ${address.substring(address.length - 4, address.length)}";
    } else {
      return address;
    }
  }

  //Barcode scanner
//   static Future scan(BuildContext context) async {
//     try {
//       //Here is the result of scan code, Barcode is the content of the QR code.
//       var result = await BarcodeScanner.scan();
//       print('here is scan result');
//       print(result.type); //The result type (barcode, cancelled, failed)
//       print(result.rawContent); //The barcode content
//       print(result.format); //The barcode format (as enum)
//       print(result.formatNote); //If a unknown format was scanned this field contains a note
//       //Report the scan code
//       return result.rawContent;
//     } on PlatformException catch (e) {
//       print(e.toString());
// //if (e.code == BarcodeScanner.CameraAccessDenied) {
// //// Not awarded App Camera Permissions
// //Showsnackbar (context, 'is not granted APP camera permission');
// //} else {
// //// scan code error
// //Print ('scan code error: $ E');
// //showSnackBar(context, e.toString());
// //}
//     } on FormatException {
//       //Returns after entering the scan code page
//       print('Returns after entering the scan code page');
//       showSnackBar(context, 'Cancel the scan code');
//     } catch (e) {
//       //Scanning code error
//       showSnackBar(context, e.toString());
//     }
//   }

  //Display SnackBar
  static showSnackBar(BuildContext context, String val) {
    final snackBar = new SnackBar(content: new Text(val));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static setToAddress(val) {
    print(val);
    _toAddress = val;
  }
}
