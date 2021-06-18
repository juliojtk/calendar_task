import 'package:calendar_task/app/dataBase/dao_implement.dart/task_dao_impl.dart';
import 'package:calendar_task/app/domain/interfaces/task_dao.dart';
import 'package:calendar_task/app/domain/service/task_service.dart';
import 'package:get_it/get_it.dart';

setupInjection(){
  GetIt getIt = GetIt.I;
  
  getIt.registerSingleton<TaskDao>(TaskDaoImplement());
  getIt.registerSingleton<TaskService>(TaskService());
}