import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:getx_todo/app/core/utils/extensions.dart';
import 'package:getx_todo/app/modules/home/controller.dart';

class AddDialog extends StatelessWidget {
  final homeCtr = Get.find<HomeController>();
  // final Task task;
  AddDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: homeCtr.formKey,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(3.0.wp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                        homeCtr.editCtr.clear();
                        homeCtr.changeTask(null);
                      },
                      icon: const Icon(Icons.close)),
                  TextButton(
                    style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent)),
                    onPressed: () {
                      if (homeCtr.formKey.currentState!.validate()) {
                        // EasyLoading.showError("Please Select task type");
                        if (homeCtr.task.value == null) {
                          EasyLoading.showError("Please Select task type");
                        } else {
                          var success = homeCtr.updateTask(
                              homeCtr.task.value!, homeCtr.editCtr.text);
                          if (success) {
                            EasyLoading.showSuccess("Todo Item add success");
                            Get.back();
                            homeCtr.changeTask(null);
                          } else {
                            EasyLoading.showError("Todo item already exist");
                          }
                          homeCtr.editCtr.clear();
                        }
                      }
                    },
                    child: Text(
                      "Done",
                      style: TextStyle(fontSize: 14.0.sp),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
              child: Text(
                "New Task",
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0.sp),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
              child: TextFormField(
                controller: homeCtr.editCtr,
                autofocus: true,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Plase enter your Todo item";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[400]!))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 5.0.wp, right: 5.0.wp, left: 5.0.wp, bottom: 2.0.wp),
              child: Text(
                "Add to",
                style: TextStyle(color: Colors.grey, fontSize: 14.0.sp),
              ),
            ),
            ...homeCtr.tasks
                .map((element) => Obx(
                      () => InkWell(
                        onTap: () => homeCtr.changeTask(element),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.0.wp, vertical: 3.0.wp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    IconData(element.icon,
                                        fontFamily: "MaterialIcons"),
                                    color: HexColor.fromHex(element.color),
                                  ),
                                  SizedBox(
                                    width: 3.0.wp,
                                  ),
                                  Text(
                                    element.title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.0.sp),
                                  ),
                                ],
                              ),
                              if (homeCtr.task.value == element)
                                const Icon(
                                  Icons.check,
                                  color: Colors.blue,
                                )
                            ],
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ],
        ),
      ),
    );
  }
}
