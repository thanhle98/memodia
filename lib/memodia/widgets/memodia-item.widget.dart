import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memodia/memodia/memodia.controller.dart';
import 'package:memodia/memodia/models/memodia.model.dart';
import 'package:memodia/memodia/widgets/memodia-item.controller.dart';

class MemodiaItem extends StatelessWidget {
  final Memodia memodia;
  final MemodiaController detailController = Get.find();
  final MemodiaItemController controller = Get.put(MemodiaItemController());

  MemodiaItem(this.memodia);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Icon(Icons.image),
            Text(memodia.id, style: TextStyle(fontWeight: FontWeight.bold)),
            Spacer(),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                Get.dialog(AlertDialog(
                  title: Text("Confirm delete?"),
                  actions: [
                    MaterialButton(
                      child: Text("Confirm", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.pink)),
                      onPressed: () {
                        Get.back();
                        detailController.deleteMemodia(memodia);
                      },
                    ),
                    MaterialButton(
                      child: Text("Cancel"),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ],
                ));
              },
            ),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                detailController.setContent(memodia);
                Get.toNamed("/post/detail");
              },
            )
          ]),
          SizedBox(height: 10),
          CarouselSlider.builder(
            options: CarouselOptions(
                height: 300.0,
                autoPlay: false,
                enlargeCenterPage: true,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  controller.updatePage(index);
                }),
            itemCount: memodia.images.length,
            itemBuilder: (context, itemIndex) => ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CachedNetworkImage(
                imageUrl: memodia.images[itemIndex].url,
                width: Get.width * 0.9,
                height: Get.width * 0.9,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: memodia.images.map((url) {
              int index = memodia.images.indexOf(url);
              return Obx(() => Container(
                    width: 8.0,
                    height: 8.0,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: controller.pageCounter.value == index
                          ? Color.fromRGBO(0, 0, 0, 0.9)
                          : Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                  ));
            }).toList(),
          ),
          Text(memodia.description),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
