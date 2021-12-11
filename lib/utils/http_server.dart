import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:surf_wallet/global.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as httpLib;
import 'package:web3dart/crypto.dart';

class Http {
  static Http instance;
  static String token;
  static Dio _dio;
  BaseOptions _options;

  // Get an instance, if you don't have to create now
  static Http getInstance() {
    if (instance == null) {
      instance = new Http();
    }
    return instance;
  }

  // HTTP class constructor
  // Initialization Options
  Http() {
    _options = new BaseOptions(
      baseUrl: Global.getBaseUrl(),
      // connectTimeout: _config.connectTimeout,
      // receiveTimeout: _config.receiveTimeout,
      headers: {'Content-Type': 'application/json', 'User-Agent': 'youwallet'},
    );

    _dio = new Dio(_options);

    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
      // Do something before request is sent
      return options; //continue
      // If you want to resolve the request with some custom data，
      // you can return a `Response` object or return `dio.resolve(data)`.
      // If you want to reject the request with a error message,
      // you can return a `DioError` object or return `dio.reject(errMsg)`
    }, onResponse: (response, handler) async {
      // Do something with response data
      return handler.next(response); // continue
    }, onError: (DioError e, handler) async {
      // Do something with response error
      return e; //continue
    }));
  }

  // GET request package
  get(url, {options, cancelToken}) async {
    print('get:::url：$url ');
    Response response;
    try {
      response = await _dio.get(url, cancelToken: cancelToken);
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('GET request cancels! ' + e.message);
      } else {
        print('GET request error：$e');
      }
    }
    return response.data;
  }

  // POST request package
  // URL must also have a default value
  // This interact with the Email, all requested URLs are fixed
  // But you can't guarantee that there will be no other URL came in later.
  /*
  * Parameter Description
  * URL _Options have been configured with BaseURL, it is a complete URL, and all the interactions of the Emperor is the same URL
  * PARAMS interface is stitching data
  * TO contract address, the default is the Tempmatchaddress contract, most of the cases can not pass
  * Method's call function in Taiquian, default is Eth_Call, read operation, no GAS
   */
  post(
      {url = "",
      options,
      cancelToken,
      params = null,
      to = Global.tempMatchAddress,
      method = 'eth_call'}) async {
    Response response;
    Map data = {
      'jsonrpc': '2.0',
      'method': method,
      'id': DateTime.now().millisecondsSinceEpoch,
      'params': []
    };
    // Call eth_call, params need to be added to the contract address, the parameter TO
    if (method == 'eth_call') {
      params['to'] = to;
      data['params'] = [params, 'latest'];
    } else {
      data['params'] = params;
    }
    try {
      response = await _dio.post(url, data: data, cancelToken: cancelToken);
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('GET request cancels! ' + e.message);
      } else {
        print('POST request error：$e');
      }
    }
    return response.data;
  }

  /*
  * Promoting transactions (transfer, cancel transactions, exchange) All operations that need to be written can call this interface
  * Parameter Description
  * Address token address
  * OBJ
  * PostData
  */
  transaction(String address, Map obj, String postData) async {
    print('start http server transaction');
    String rpcUrl = Global.getBaseUrl();
    final client = Web3Client(rpcUrl, httpLib.Client());
    final credentials = await client.credentialsFromPrivateKey(obj['privateKey']);

    var rsp = await client.sendTransaction(
        credentials,
        Transaction(
            to: EthereumAddress.fromHex(address),
            gasPrice: obj['gasPrice'],
            maxGas: obj['gasLimit'],
            value: EtherAmount.fromUnitAndValue(EtherUnit.ether, 0),
            data: hexToBytes(postData)),
        chainId:
            3 // No this parameter will be reportedRPCError: got code -32000 with msg "invalid sender".
        );
    print("transaction => $rsp");
    return rsp;
  }
}
