import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo/app/core/utils/extensions.dart';
import 'package:getx_todo/app/modules/home/controller.dart';

class DoingList extends StatelessWidget {
  final homeCtr = Get.find<HomeController>();
  DoingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => homeCtr.doingTodos.isEmpty && homeCtr.doneTodos.isEmpty
        ? Center(
            child: Column(
              children: [
                SizedBox(
                  height: 4.0.wp,
                ),
                Image.asset(
                  "assets/images/Checklist.jpg",
                  fit: BoxFit.cover,
                  width: 65.0.wp,
                ),
                SizedBox(
                  height: 4.0.wp,
                ),
                Text(
                  "Add Task",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 8.0.wp),
                )
              ],
            ),
          )
        : ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: [
              ...homeCtr.doingTodos
                  .map((element) => Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 9.0.wp, vertical: 3.0.wp),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: Checkbox(
                                fillColor: MaterialStateProperty.resolveWith(
                                    (states) => Colors.grey),
                                value: element['Done'],
                                onChanged: (value) {
                                  homeCtr.doneTodo(
                                    element['title'],
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
                              child: Text(
                                element['title'],
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                      ))
                  .toList(),
              if (homeCtr.doingTodos.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                  child: const Divider(
                    thickness: 2,
                  ),
                )
            ],
          ));
  }
}
