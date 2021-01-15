import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:memodia/auth/auth.controller.dart';
import 'package:memodia/memodia/memodia.service.dart';
import 'package:memodia/memodia/models/image.model.dart';
import 'package:memodia/memodia/models/memodia.model.dart';

class MemodiaController extends GetxController {
  final picker = ImagePicker();
  MemodiaService _memodiaService;

  // all
  var memodias = <Memodia>[].obs;

  // Detail
  var id = "".obs;
  var memoImages = <MemoImage>[].obs;
  var descriptionController = TextEditingController();
  var isLoading = false.obs;

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

  void deleteMemodia(Memodia memodia) {
    _memodiaService.deleteOne(memodia);
    Get.snackbar(
      "Delete Success",
      memodia.id,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void reOrderTitles(int oldIndex, int newIndex) {
    memoImages.insert(newIndex, memoImages.removeAt(oldIndex));
  }

  void deleteImage(MemoImage memoImage) {
    memoImages.remove(memoImages.firstWhere((element) => element.hashcode == memoImage.hashcode));
  }

  void addImage() async {
    try {
      var _image = await picker.getImage(source: ImageSource.gallery, maxHeight: 200, imageQuality: 50);
      var _memoImage = MemoImage(hashcode: _image.hashCode.toString(), filePath: _image.path);
      memoImages.add(_memoImage);
    } catch (e) {
      Get.snackbar(
        "Log",
        "You didn't choose any image",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // memodia stuffs

  void resetContent() {
    memoImages.value = [];
    descriptionController.text = "";
    id.value = "";
  }

  void setContent(Memodia content) {
    id.value = content.id;
    memoImages.value = content.images;
    descriptionController.text = content.description;
  }

  void saveMemodia() async {
    // create new one
    try {
      AuthController authController = AuthController.to;
      isLoading.value = true;

      for (var i = 0; i < memoImages.length; i++) {
        if (memoImages[i].url == null) memoImages[i] = await _memodiaService.uploadFile(memoImages[i]);
      }

      if (id.value != "") {
        await _memodiaService.updateOne(Memodia(
          id: id.value,
          description: descriptionController.text,
          images: memoImages.value,
          userId: authController.user.value.uid,
        ));
        Get.snackbar("Update Success", id.value, snackPosition: SnackPosition.BOTTOM);
      } else {
        var memodia =
            await _memodiaService.addOne(authController.user.value.uid, descriptionController.text, memoImages.value);
        Get.snackbar("Create Success", memodia.id, snackPosition: SnackPosition.BOTTOM);
      }

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }
}
