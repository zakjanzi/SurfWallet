import 'package:get/get.dart';

class GenerateWalletController extends GetxController {
  int step = 0;

  incrementStep() {
    step = step + 1;
    update();
  }
}
