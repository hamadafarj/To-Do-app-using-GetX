import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo/app/data/models/tasks.dart';
import 'package:getx_todo/app/data/services/storage/reposistory.dart';

class HomeController extends GetxController {
  TaskRepository taskRepository;
  HomeController({required this.taskRepository});
  final formKey = GlobalKey<FormState>();
  final editCtr = TextEditingController();
  final chipIndex=0.obs;
  final tasks = <Task>[].obs;
  @override
  void onInit() {
    super.onInit();
    tasks.assignAll(taskRepository.readTasks());
    ever(tasks, (_) => taskRepository.writeTasks(tasks));
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeChipIndex(int value){
    chipIndex.value=value;
  }
}
