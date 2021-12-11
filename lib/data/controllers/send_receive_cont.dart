import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

enum SendReceive { Send, Receive, NON }

class SendReceiveController extends GetxController {
  // States
  var sendReciveBottoSheet = SendReceive.NON.obs;
}
