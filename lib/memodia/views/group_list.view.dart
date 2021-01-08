import 'package:flutter/material.dart';

class GroupList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffFFE5C4),
        child: Center(
          child: Column(
            children: [
              Image(image: AssetImage("assets/images/album.png")),
              SizedBox(height: 10.0),
              Text("Travel"),
              Image(image: AssetImage("assets/images/group_travel.png")),
              SizedBox(height: 10.0),
              Text("Family"),
              Image(image: AssetImage("assets/images/group_family.png")),
            ],
          ),
        ),
      ),
    );
  }
}
