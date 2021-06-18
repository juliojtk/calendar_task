import 'package:calendar_task/app/domain/entities/task.dart';
import 'package:calendar_task/app/domain/service/task_service.dart';
import 'package:calendar_task/app/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'back_add_task.g.dart';

class BackAddTask = BackAddTaskBase with _$BackAddTask;

abstract class BackAddTaskBase with Store{

  BackAddTaskBase(BuildContext context){
    var parameter = ModalRoute.of(context).settings.arguments;

    if(parameter == null){
      task = Task();
      isUpdate = false;
      selectDate = parameter;
    }else{
      isUpdate = true;
      task = parameter;
    }
  }

  Task task;

  var _taskService = GetIt.I.get<TaskService>();
  String dateLabel;
  DateTime selectDate;
  bool isUpdate = false;
  bool typePlantion = false;

  saveTask(){
    task.dateNow = DateTime.now().toIso8601String();
    _taskService.saveTask(task);
  }

  bool changeSwitch(bool value){
    if(isUpdate){
      if(task.public == 'true'){
        typePlantion = true;
      }else{
        typePlantion = false;
      }
    } else{
      typePlantion = false;
    }
    return typePlantion;
  }

  String formatDateShow(DateTime value){
    DateFormat dateFormatLabel = DateFormat('dd-MM-yyyy');
    return dateLabel = dateFormatLabel.format(value);
  }

  goToMaiCalendar(BuildContext context){
    Navigator.of(context).pushNamed(AppRoutes.HOME);
  }

}