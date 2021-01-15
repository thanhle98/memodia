import 'package:flutter/material.dart';
import 'dart:io';

import 'package:get/get.dart';

import '../memodia.controller.dart';

class ImageTile extends StatelessWidget {
  ImageTile(Key key, this.filePath) : super(key: key);
  final String filePath;
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
                Text(filePath),
                SizedBox(height: 10.0),
                Expanded(child: Image.file(File(filePath), fit: BoxFit.cover, width: Get.width)),
              ],
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  memodiaController.deleteImage(filePath);
                  Get.close(1);
                },
              )
            ],
          ));
        },
        child: new Center(
            child: Image.file(
          File(filePath),
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        )),
      ),
    );
  }
}
