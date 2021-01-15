import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memodia/memodia/memodia.controller.dart';
import 'package:memodia/memodia/widgets/image-title.widget.dart';
import 'package:reorderableitemsview/reorderableitemsview.dart';

class PostDetail extends StatelessWidget {
  final MemodiaController memodiaController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Color(0xffFFE5C4),
        actions: [
          IconButton(
            icon: Icon(Icons.add_a_photo),
            color: Colors.black,
            onPressed: memodiaController.addImage,
          ),
          IconButton(
            icon: Icon(Icons.save),
            color: Colors.black,
            onPressed: () {
              Get.back();
              memodiaController.saveMemodia();
            },
          )
        ],
      ),
      body: Container(
        width: Get.width,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        color: Color(0xffFFE5C4),
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => memodiaController.memoImages.length != 0
                    ? ReorderableItemsView(
                        onReorder: memodiaController.reOrderTitles,
                        children:
                            memodiaController.memoImages.map((mI) => ImageTile(Key(mI.hashcode), mI.filePath)).toList(),
                        crossAxisCount: 4,
                        isGrid: true,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        staggeredTiles:
                            memodiaController.memoImages.map((e) => StaggeredTileExtended.count(2, 2)).toList(),
                        longPressToDrag: false,
                      )
                    : Center(child: Text("No image yet, add a new image")),
              ),
            ),
            SizedBox(height: 10.0),
            Align(
              child: Text("What is your thought?", style: TextStyle(fontWeight: FontWeight.bold)),
              alignment: Alignment.bottomLeft,
            ),
            TextField(
              maxLines: 5,
              controller: memodiaController.descriptionController,
              decoration: InputDecoration(hintText: "Describe your words here"),
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
