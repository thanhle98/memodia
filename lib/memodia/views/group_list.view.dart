import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        color: Color(0xffFFE5C4),
        child: ListView(
          children: [
            Image(
              image: AssetImage("assets/images/album.png"),
              height: Get.height / 4,
            ),
            SizedBox(height: 10.0),
            Text("Travel", style: TextStyle(fontWeight: FontWeight.bold)),
            InkWell(
              child: Image(image: AssetImage("assets/images/group_travel.png")),
              onTap: () {
                Get.toNamed("/post/list");
              },
            ),
            SizedBox(height: 10.0),
            Text("Family", style: TextStyle(fontWeight: FontWeight.bold)),
            InkWell(
              child: Image(image: AssetImage("assets/images/group_family.png")),
              onTap: () {
                Get.toNamed("/post/list");
              },
            ),
            SizedBox(height: 90),
            Align(
              child: Image(image: AssetImage("assets/images/stamp.png"), height: 50),
              alignment: Alignment.bottomLeft,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: () => Get.toNamed("/group/create")),
    );
  }
}
