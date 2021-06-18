import 'package:calendar_task/app/domain/entities/task.dart';
import 'package:calendar_task/app/view/viewBack/back_main_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:table_calendar/table_calendar.dart';

class MainCalendar extends StatelessWidget {
  
  final _backMainCalendar = BackMainCalendar();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: appBarLayout(context),
      //drawer: drawerLayout(context),
      body: bodyLayout(context),
    );
  }

  Widget appBarLayout(BuildContext context){
    return AppBar(
      title: Text('Agenda de Calendario'),
      backgroundColor: Colors.black38,
    );
  }

  Widget drawerLayout(BuildContext context){
    return Drawer(
      elevation: 30,
      child: Container(
        color: Colors.purple,
      ),
    );
  }

  Widget bodyLayout(BuildContext context){
    return FutureBuilder(
      future: _backMainCalendar.listTask,
      builder: (context, futuro){
        if(!futuro.hasData){
          return CircularProgressIndicator();
        }else{
          _backMainCalendar.list = futuro.data;
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Card(
                      color: Colors.white,
                        child: tableCalendarLayout(context),    
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: listViewLatout(context),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 5,),
              child: floatActionButton(context),
              )
            ],
          );
        }
      },
    );
  }

  Widget tableCalendarLayout(BuildContext context){
    return Observer(builder: (context){
      return TableCalendar(
        firstDay: DateTime(1900),
        focusedDay: _backMainCalendar.focusedDay, 
        lastDay: DateTime.now().add(Duration(days: 300)),
        onDaySelected: (selectDate, focusedDay){
          _backMainCalendar.selectDate = selectDate;
          _backMainCalendar.focusedDay = focusedDay;
          _backMainCalendar.getSelectedTask(_backMainCalendar.selectDate, _backMainCalendar.focusedDay);
        },
        daysOfWeekStyle: DaysOfWeekStyle(
          weekendStyle: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.w500,
          ),
          weekdayStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500
          ),
          decoration: BoxDecoration(
            color: Colors.green[50],
            borderRadius: BorderRadius.all(Radius.circular(10))
          )
        ),
        locale: Localizations.localeOf(context).languageCode,
        calendarFormat: _backMainCalendar.format,
        onFormatChanged: (CalendarFormat _format){
          _backMainCalendar.format = _format;
        },
        selectedDayPredicate: (day) => _backMainCalendar.selectDate == day,
        headerStyle: HeaderStyle(//Estilizando o Header
          decoration: BoxDecoration(
            color: Colors.black87,
          ),
          headerMargin: const EdgeInsets.only(bottom: 8),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
          formatButtonDecoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          formatButtonTextStyle: TextStyle(
            color: Colors.white,
          ),
          leftChevronIcon: Icon(
            Icons.chevron_left, 
            color: Colors.white,
          ),
          rightChevronIcon: Icon(
            Icons.chevron_right,
            color: Colors.white,
          )
        ),
        calendarStyle: CalendarStyle(//Estilizando o Calendario
          weekendTextStyle: TextStyle(
            color: Colors.red[600],
          ),
          selectedDecoration: BoxDecoration(
            color: Colors.black54,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.black,
              width: 0.5,
            )
          ),
          todayDecoration: BoxDecoration(
            color: Colors.green[100],
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.black,
              width: 0.4,
            )
          ),
          todayTextStyle: TextStyle(
            color: Colors.black,
          ),
          markerDecoration: BoxDecoration(
            //color: _backMainCalendar.changeDotTaskColor(_backMainCalendar.list),
            //color: (_backMainCalendar.list[1].public.contains('false') ? Colors.black : Colors.amber),
            color: Colors.black,
            shape: BoxShape.circle,
          ),
          markersAnchor: 0,
        ),
        eventLoader: (day) => _backMainCalendar.walkDayCalendar(day),
      );
    }); 
  }

  Widget listViewLatout(BuildContext context){
    return Observer(builder: (context){
      return ListView.builder(
        itemCount: _backMainCalendar.listEventTask == null ? 0 : _backMainCalendar.listEventTask.length,
        itemBuilder: (context, i){
          var task = _backMainCalendar.listEventTask[i];
          return cardLayout(context, task);
        }
      );   
    });
  }

  Widget cardLayout(BuildContext context, Task task){
    return Card(
      elevation: 10,
      color: task.public.contains('false') ? Colors.white : Colors.amber[100],
      shape: StadiumBorder(
        side: BorderSide(
          color: Colors.black,
          width: 0.3,
        ),
      ),
      child: ListTile(
        leading: showIcon(task.public),
        title: Text('${task.title.toUpperCase()}', style: TextStyle(fontWeight: FontWeight.bold),),
        subtitle: task.public.contains('false') ? Text('Plantão Normal', style: TextStyle(color: Colors.black, fontSize: 15),) : Text('Plantão Extra', style: TextStyle(color:  Colors.black, fontSize: 15),),
        trailing: Container(
          width: 100,
          child: Row(
            children: [
              iconEditButton((){
                _backMainCalendar.goToAddEvent(context, _backMainCalendar.selectDate, _backMainCalendar.isUpdate = true, task);
              }),
              iconDeletButton(task, context, (){}),
            ],
          )
        ),
        onTap: (){
          _backMainCalendar.goToDetailTask(context, task);
        },
      ),
    );
  }

  Widget showIcon(String value){
    return CircleAvatar(
      child: value.contains('false') ? Icon(Icons.local_hospital, color: Colors.red[600], ) : Icon(Icons.local_hospital_outlined, color: Colors.black,),
      backgroundColor: value.contains('false') ? Colors.white : Colors.amber[100],
    );
  }

  Widget iconEditButton(Function onPressd){
    return IconButton(
      icon: Icon(Icons.edit),
      color: Colors.purple[900],
      onPressed: onPressd,
    );
  }

  Widget iconDeletButton(Task task, BuildContext context, Function remove){
    return IconButton(
      icon: Icon(Icons.delete),
      color: Colors.red[900],
      onPressed: (){
        showDialog(
          context: context, 
          builder: (context) => AlertDialog(
            title: Text('Excluir'),
            content: Text('Confirmar a Exclusão?'),
            actions: [
              TextButton(
                child: Text('Sim'),
                onPressed: (){
                  _backMainCalendar.deleteTask(task.id);
                  _backMainCalendar.goToMainCalendar(context);
                },
              ),
              TextButton(
                child: Text('Não'),
                onPressed: (){
                  _backMainCalendar.goToMainCalendar(context);
                },
              )
            ],
          )
        );
      },
    );
  }

  Widget floatActionButton(BuildContext context){
    return FloatingActionButton(
      backgroundColor: Colors.blue[700],
      child: Icon(Icons.add,),
      onPressed: (){
        _backMainCalendar.goToAddEvent(context, _backMainCalendar.selectDate, _backMainCalendar.isUpdate = false);
      }  
    );
  }
}