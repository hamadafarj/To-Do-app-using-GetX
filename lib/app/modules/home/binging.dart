import 'package:get/get.dart';
import 'package:getx_todo/app/data/providers/tasks/providers.dart';
import 'package:getx_todo/app/data/services/storage/reposistory.dart';
import 'package:getx_todo/app/modules/home/controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(
        taskRepository: TaskRepository(taskProviders: TaskProviders())));
  }
}
