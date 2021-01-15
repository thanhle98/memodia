import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:memodia/auth/auth.controller.dart';
import 'package:memodia/memodia/memodia.service.dart';
import 'package:memodia/memodia/models/image.model.dart';
import 'package:memodia/memodia/models/memodia.model.dart';

class MemodiaController extends GetxController {
  final picker = ImagePicker();
  var descriptionController = TextEditingController();

  var memoImages = <MemoImage>[].obs;
  var memodias = <Memodia>[].obs;
  var isLoading = false.obs;

  MemodiaService _memodiaService;
  MemodiaController() {
    _memodiaService = MemodiaService();
  }

  onInit() {
    memodias.bindStream(loadMemodias());
  }

  Stream<Iterable<Memodia>> loadMemodias() {
    AuthController authController = AuthController.to;
    return _memodiaService.findAll(authController.user.value.uid);
  }

  void reOrderTitles(int oldIndex, int newIndex) {
    memoImages.insert(newIndex, memoImages.removeAt(oldIndex));
  }

  void deleteImage(String deleteFilePath) {
    memoImages.remove(memoImages.firstWhere((element) => element.filePath == deleteFilePath));
    Get.back();
  }

  void addImage() async {
    try {
      var _image = await picker.getImage(source: ImageSource.gallery);
      memoImages.add(MemoImage(hashcode: _image.hashCode.toString(), filePath: _image.path));
    } catch (e) {
      Get.snackbar("Log", "You didn't choose any image");
    }
  }

  // memodia stuffs

  void resetContent() {
    memoImages.value = [];
    descriptionController.text = "";
  }

  void setContent(Memodia content) {
    memoImages.value = content.images;
    descriptionController.text = content.description;
  }

  void saveMemodia() async {
    try {
      AuthController authController = AuthController.to;
      isLoading.value = true;
      var memodia =
          await _memodiaService.addOne(authController.user.value.uid, descriptionController.text, memoImages.value);
      Get.back();
      Get.snackbar("Success", memodia.id, snackPosition: SnackPosition.BOTTOM);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }
}
