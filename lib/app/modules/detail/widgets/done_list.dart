import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo/app/core/utils/extensions.dart';
import 'package:getx_todo/app/modules/home/controller.dart';

class DoneList extends StatelessWidget {
  final homeCtr = Get.find<HomeController>();
  DoneList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => homeCtr.doneTodos.isNotEmpty
        ? ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 2.0.wp,vertical: 5.0.wp),
                child: Text("Completed (${homeCtr.doneTodos.length})",
                style: TextStyle(fontSize: 14.0.sp,color: Colors.grey),
                ),
              ),
              ...homeCtr.doneTodos.map((element) =>
              Dismissible(
                key: ObjectKey(element),
                direction: DismissDirection.endToStart,
                onDismissed: (_)=>homeCtr.deleteDoneTodo(element),
                background: Container(
                  color: Colors.red.withOpacity(0.8),
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding:  EdgeInsets.only(right: 5.0.wp),
                    child: const Icon(Icons.delete,color: Colors.white,),
                  ),
                ),
                child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 9.0.wp, vertical: 3.0.wp),
                      child: Row(
                        children: [
                         const SizedBox(
                            height: 20,
                            width: 20,
                            child: Icon(Icons.done,color: Colors.blue,)
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
                            child: Text(
                              element['title'],
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
              )).toList(),
                  if(homeCtr.doingTodos.isNotEmpty) Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 5.0.wp),
                    child:const Divider(thickness: 2,),
                  )
            ],
          )
        : Container());
  }
}
