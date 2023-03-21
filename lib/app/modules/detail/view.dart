import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:getx_todo/app/core/utils/extensions.dart';
import 'package:getx_todo/app/modules/detail/widgets/doing_list.dart';
import 'package:getx_todo/app/modules/detail/widgets/done_list.dart';
import 'package:getx_todo/app/modules/home/controller.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class DetailPage extends StatelessWidget {
  final homeCtr = Get.find<HomeController>();
  DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    var task = homeCtr.task.value!;
    var color = HexColor.fromHex(task.color);
    return Scaffold(
        body: Form(
      key: homeCtr.formKey,
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(3.0.wp),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                      homeCtr.updateTodos();
                      homeCtr.editCtr.clear();
                    },
                    icon: const Icon(Icons.arrow_back))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.wp),
            child: Row(
              children: [
                Icon(
                  IconData(task.icon, fontFamily: "MaterialIcons"),
                  color: color,
                ),
                SizedBox(
                  width: 3.0.wp,
                ),
                Text(
                  task.title,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0.sp),
                )
              ],
            ),
          ),
          Obx(() {
            var totalTodos =
                homeCtr.doingTodos.length + homeCtr.doneTodos.length;
            return Padding(
              padding:
                  EdgeInsets.only(top: 3.0.wp, left: 16.0.wp, right: 16.0.wp),
              child: Row(
                children: [
                  Text(
                    "$totalTodos Tasks",
                    style: TextStyle(fontSize: 12.0.sp, color: Colors.grey),
                  ),
                  SizedBox(
                    width: 3.0.wp,
                  ),
                  Expanded(
                    child: StepProgressIndicator(
                      totalSteps: totalTodos == 0 ? 1 : totalTodos,
                      currentStep: homeCtr.doneTodos.length,
                      size: 5,
                      padding: 0,
                      selectedGradientColor: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [color.withOpacity(0.5), color]),
                      unselectedGradientColor: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.grey[300]!, Colors.grey[300]!]),
                    ),
                  ),
                ],
              ),
            );
          }),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0.wp, vertical: 2.0.wp),
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
                    borderSide: BorderSide(color: Colors.grey[400]!),
                  ),
                  prefixIcon: Icon(
                    Icons.check_box_outline_blank,
                    color: Colors.grey[400],
                  ),
                  suffixIcon: IconButton(
                    icon:const Icon(Icons.done),
                    onPressed: () {
                      if(homeCtr.formKey.currentState!.validate()){
                        var succes =homeCtr.addTodo(homeCtr.editCtr.text);
                        if(succes==true){
                          EasyLoading.showSuccess("Todo Item add success");
                        }else{
                          EasyLoading.showError("Todo item already exist");
                        }
                        homeCtr.editCtr.clear();
                      }
                    },
                  )),
            ),
          ),
          DoingList(),
          DoneList()
        ],
      ),
    ));
  }
}
