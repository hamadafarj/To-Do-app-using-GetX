import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo/app/modules/home/controller.dart';
import 'package:getx_todo/app/modules/home/widgets/icons.dart';
import 'package:getx_todo/app/core/utils/extensions.dart';

class AddCard extends StatelessWidget {
  final homeCtr=Get.find<HomeController>();
  AddCard({super.key});

  @override
  Widget build(BuildContext context) {
    final icons=getIcons();
    var squarWight=Get.width-12.0.wp;
    return Container(
      height: squarWight/2,
      width: squarWight/2,
      margin: EdgeInsets.all(3.0.wp),
      child: InkWell(
        onTap: ()async{
          await Get.defaultDialog(
            titlePadding:   EdgeInsets.symmetric(vertical: 5.0.wp),
            title: "Task Type",
            content: Form(key: homeCtr.formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
                  child: TextFormField(
                    controller: homeCtr.editCtr,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Title"
                    ),
                    validator: (value) {
                      if(value==null || value.trim().isEmpty){
                        return "Please enter your tasks title";
                      }
                      return null;
                    },
                  ),
                ),
                Wrap(
                  spacing: 2.0.wp,
                  children: icons.map((e) => Obx(
                    (){
                      final index=icons.indexOf(e);
                      return ChoiceChip(label: e, selected: homeCtr.chipIndex.value==index,
                      onSelected: (bool selected){
                        homeCtr.chipIndex.value=selected?index:0;
                      },
                      
                      );
                    }
                  )).toList(),
                )
              ],
            ),
            
            )
          );
        },
        child: DottedBorder(
          color: Colors.grey[400]!,
          dashPattern: const [8,4],
          child: Center(
            child: Icon(Icons.add,size: 10.0.wp,color: Colors.grey,),
          ),
        ),
      ),
    );
  }
}