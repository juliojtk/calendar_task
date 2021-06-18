import 'package:calendar_task/app/domain/entities/task.dart';
import 'package:calendar_task/app/domain/interfaces/task_dao.dart';
import 'package:get_it/get_it.dart';

class TaskService{
  Task task;
  var _taskDao = GetIt.I.get<TaskDao>();

  Future<List<Task>> listAllTask(){
    return _taskDao.listAllTask();
  }

  saveTask(Task task){
    _taskDao.saveTask(task);
  }

  deleteTask(int id){
    _taskDao.deleteTask(id);
  }
  
}