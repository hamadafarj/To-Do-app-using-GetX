import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo/app/core/utils/extensions.dart';
import 'package:getx_todo/app/modules/home/controller.dart';

class TestPage extends StatelessWidget {
  final homeCtr = Get.find<HomeController>();
  TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("www"),),
      body: Obx(() => ListView.builder(
          itemCount: homeCtr.photos.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(homeCtr.photos[index].title ?? "", style: TextStyle(
                        fontSize: 24.0.sp, fontWeight: FontWeight.bold),),
              subtitle: Text('Album ID: ${homeCtr.photos[index].albumId}'),
              leading: Image.network(homeCtr.photos[index].url ?? ""),
            );
          })),
    );
  }
}
