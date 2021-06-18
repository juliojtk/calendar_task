import 'package:calendar_task/app/domain/entities/task.dart';
import 'package:calendar_task/app/domain/service/task_service.dart';
import 'package:calendar_task/app/routes/app_routes.dart';
import 'package:calendar_task/app/view/add_task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:table_calendar/table_calendar.dart';

part 'back_main_calendar.g.dart';

class BackMainCalendar = BackMainCalendarBase with _$BackMainCalendar;

abstract class BackMainCalendarBase with Store {

  BackMainCalendarBase(){
    listAllTask();
  }

  var _taskService = GetIt.I.get<TaskService>();
  var result;

  Task task;

  bool isUpdate = false;
  
  @observable 
  DateTime focusedDay = DateTime.now();

  @observable
  DateTime selectDate = DateTime.now();

  @observable
  CalendarFormat format = CalendarFormat.month;

  @observable
  List<Task> list;

  @observable
  List<Task> listEventTask;

  @observable
  Future<List<Task>> listTask;

  @observable
  Map<DateTime, List<Task>> selectedTasks = {};

  @observable
  Color dotColor;  

  listAllTask(){
    listTask = _taskService.listAllTask();
  }

  //Percorre os dias do calendario verificando em qual dia tem tarefas
  List<Task> walkDayCalendar(DateTime date){
  
  selectedTasks = {};

    for(Task t in list ){
      if(t.selectDate == date.toIso8601String()){
        if(selectedTasks[date] == null) selectedTasks[date] = [];
        selectedTasks[date].add(t);
      }
    }
    return selectedTasks[date] ?? [];
  }

  Color changeDotTaskColor(List<Task> listTask){
    for(Task t in listTask ){
      if(t.public.contains('false')){
        dotColor = Colors.black;
      }else{
        dotColor = Colors.amber;
      }
    }
    return dotColor;
  }



  // Seleciona a data, verificando se tem tarefas no dia selecionado
  List<Task> getSelectedTask(DateTime selectDate, [DateTime focusDate]){
    listEventTask = [];

    for(Task t in list){
      if(selectDate.isAtSameMomentAs(focusDate)){
        if(t.selectDate == selectDate.toIso8601String()){
          listEventTask.add(t); 
        }
      } 
    }
    return listEventTask ?? [];
  }

  deleteTask(int id){
    _taskService.deleteTask(id);
  }

  goToMainCalendar(BuildContext context){
    Navigator.of(context).pushNamed(AppRoutes.HOME);
  }

  goToDetailTask(BuildContext context, Task task){
    Navigator.of(context).pushNamed(AppRoutes.DETAILS, arguments: task);
  }

  //Usando parametros opcionais
  goToAddEvent(BuildContext context, DateTime selectDate, [bool isUpdate, Task task]) async{
    if(isUpdate){
      Navigator.of(context).pushNamed(AppRoutes.ADDEVENT, arguments: task);
    }else{
      result = await Navigator.push(
        context, 
        MaterialPageRoute(//Enviando valor para outra widget
          builder: (context) => AddEvent(selectDate: selectDate)),
      );
      Navigator.of(context).pushNamed(AppRoutes.ADDEVENT);
    }
  }
  
}