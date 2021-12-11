import 'package:get/get.dart';

class ChooseLanguageController extends GetxController {
  bool isSelectedEnglish = false;
  bool isSelectedArabic = false;

  selectEnglish() {
    isSelectedEnglish = !(isSelectedArabic);

    update();
  }

  selectArabic() {
    isSelectedArabic = !(isSelectedEnglish);

    update();
  }
}
