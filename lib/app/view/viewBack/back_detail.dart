
import 'package:calendar_task/app/domain/entities/task.dart';
import 'package:calendar_task/app/domain/service/task_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class BackDetail{

  BuildContext context;
  Task task;

  var taskService = GetIt.I.get<TaskService>();

  BackDetail(this.context){
    task = ModalRoute.of(context).settings.arguments;
  }

  showData(String date){
    String dateFormated;
    DateFormat dateFormat = DateFormat('dd-MM-yyyy');

    dateFormated = dateFormat.format(DateTime.parse(date));
    return dateFormated;
  }
}