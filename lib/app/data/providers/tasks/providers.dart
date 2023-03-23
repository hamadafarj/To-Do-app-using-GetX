import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:getx_todo/app/core/utils/keys.dart';
import 'package:getx_todo/app/data/models/tasks.dart';
import 'package:getx_todo/app/data/services/storage/service.dart';

class TaskProviders {
  final _storage = Get.find<StorageService>();

  List<Task> readTasks() {
    var tasks = <Task>[];
    jsonDecode(_storage.read(taskKey).toString())
        .forEach((e) => tasks.add(Task.fromJson(e)));

    return tasks;
  }

  void writeTasks(List<Task> tasks) {
    _storage.write(taskKey, jsonEncode(tasks));
  }
}

class ApiDataProvider {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com/photos';
  final _api = Dio(BaseOptions(
    baseUrl: _baseUrl,
  ));
  Response? response;
  Future<Response?> getImages() async {
    try {
      response = await _api.get(_baseUrl);
      print("object $response");
          return response;

    } catch (_) {

    }
  }
}
