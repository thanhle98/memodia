import 'package:get/get.dart';

class MemodiaItemController extends GetxController {
  var pageCounter = 0.obs;

  void updatePage(int number) {
    pageCounter.value = number;
  }
}
