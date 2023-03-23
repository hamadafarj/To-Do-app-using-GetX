import 'package:getx_todo/app/data/models/albums.dart';
import 'package:getx_todo/app/data/models/tasks.dart';
import 'package:getx_todo/app/data/providers/tasks/providers.dart';

class TaskRepository {
  TaskProviders taskProviders;

  TaskRepository({required this.taskProviders});

  List<Task> readTasks() => taskProviders.readTasks();

  void writeTasks(List<Task> tasks) => taskProviders.writeTasks(tasks);
}

class ApiRepo{
  final _apiProvider=ApiDataProvider(); 

  Future<List<AlbumModel>> loadPhoto()async{
    final List<AlbumModel> photos=[];
    final response=await _apiProvider.getImages();
    if(response !=null && response.statusCode==200){
      var jsonList=response.data as List<dynamic>;
      for(var json in jsonList){
        photos.add(AlbumModel.fromJson(json));
      }
    }
    return photos;
  }
}
