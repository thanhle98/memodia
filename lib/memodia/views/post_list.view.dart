import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memodia/memodia/widgets/memodia-item.widget.dart';
import '../memodia.controller.dart';

class PostList extends StatelessWidget {
  final MemodiaController memoController = Get.put<MemodiaController>(MemodiaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text("Album Detail"),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        width: Get.width,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        color: Color(0xffFFE5C4),
        child: Obx(() {
          if (memoController.memodias.length == 0) {
            return Center(child: Text('Nothing here, please add your first post'));
          }

          return ListView.builder(
            itemCount: memoController.memodias.length,
            itemBuilder: (context, index) {
              return MemodiaItem(memoController.memodias.elementAt(index));
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            memoController.resetContent();
            Get.toNamed("/post/detail");
          }),
    );
  }
}
