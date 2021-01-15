import 'package:flutter/material.dart';
import 'dart:io';

import 'package:get/get.dart';
import 'package:memodia/memodia/models/image.model.dart';

import '../memodia.controller.dart';

class ImageTile extends StatelessWidget {
  ImageTile(Key key, this.memoImage) : super(key: key);
  final MemoImage memoImage;
  final MemodiaController memodiaController = Get.find();
  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new InkWell(
        onTap: () {
          Get.dialog(AlertDialog(
            title: Text("Image Detail"),
            content: Column(
              children: [
                Text(memoImage.url != null ? memoImage.url : memoImage.filePath),
                SizedBox(height: 10.0),
                Expanded(child: Image.file(File(memoImage.filePath), fit: BoxFit.cover, width: Get.width)),
              ],
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  Get.back();
                  memodiaController.deleteImage(memoImage);
                },
              )
            ],
          ));
        },
        child: new Center(
            child: Image.file(
          File(memoImage.filePath),
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        )),
      ),
    );
  }
}
