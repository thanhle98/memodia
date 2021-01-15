import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupCreate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackButton(color: Colors.black), backgroundColor: Color(0xffFFE5C4)),
      body: Container(
        width: Get.width,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        color: Color(0xffFFE5C4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image(
              image: AssetImage("assets/images/album.png"),
              height: 100,
              width: 70,
            ),
            Text("New album", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
            SizedBox(height: 30.0),
            Align(
              child: Text("Name", style: TextStyle(fontWeight: FontWeight.bold)),
              alignment: Alignment.bottomLeft,
            ),
            TextField(
              controller: TextEditingController(),
              decoration: InputDecoration(hintText: "Le Xuan Thanh"),
            ),
            SizedBox(height: 30.0),
            Align(
              child: Text("Image", style: TextStyle(fontWeight: FontWeight.bold)),
              alignment: Alignment.bottomLeft,
            ),
            TextField(
              controller: TextEditingController(),
              decoration: InputDecoration(hintText: "Add some image"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.check), onPressed: () => Get.toNamed("/")),
    );
  }
}
