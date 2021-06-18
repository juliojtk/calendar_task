import 'package:calendar_task/app/domain/entities/task.dart';

abstract class TaskDao{

  Future<List<Task>> listAllTask();
  saveTask(Task task);
  deleteTask(int id);


}