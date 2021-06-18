import 'package:calendar_task/app/view/viewBack/back_add_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class AddEvent extends StatelessWidget {

  final DateTime selectDate;

  //Recebendo variavel passada da widget main_calendar
  AddEvent({this.selectDate});

  final _formKeyTask = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final _backTask = BackAddTask(context);
    
    return Scaffold(
      appBar: appBar(context, _backTask),
      body: body(context, _backTask),
    );
  }

  Widget appBar(BuildContext context, BackAddTask backTask){
    return AppBar(
      backgroundColor: Colors.black38,
      title: !backTask.isUpdate ? Text('Adicionar Tarefa') : Text('Alterar Tarefa'),
      leading: IconButton(
        icon: Icon(
          Icons.clear,
          color: Colors.red,
          ),
        onPressed: (){
          backTask.goToMaiCalendar(context);
        },
      ),
      actions: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: !backTask.isUpdate ? MaterialStateProperty.all(Colors.green[600]) : MaterialStateProperty.all(Colors.blue[600]),
                textStyle: MaterialStateProperty.all(
                  TextStyle(
                    fontSize: 18,
                  ),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(width: 0.4)
                  )
                ),
              ),
              onPressed: (){
                _formKeyTask.currentState.validate();
                _formKeyTask.currentState.save();
                backTask.saveTask();
                backTask.goToMaiCalendar(context);
              },
              child: !backTask.isUpdate ? Text('Salvar') : Text('Editar'),
            ),
          ),
        )
      ],
    );
  }

  Widget body(BuildContext context, BackAddTask backTask){
    return ListView(
      padding: const EdgeInsets.all(10),
      children: <Widget>[
        FormBuilder(
          key: _formKeyTask,
          child: Column(
            children: [
              Divider(),
              Divider(),
              fieldTitle(context, backTask),
              Divider(),
              Divider(),
              fieldDescription(context, backTask),
              Divider(),
              Divider(),
              fieldDateTimePiker(context, backTask),
              Divider(),
              Divider(),
              fieldSwitch(context, backTask),
              Divider(),
              Divider(),
            ],
          )
        )
      ],
    );
  }

  Widget fieldTitle(BuildContext context, BackAddTask backTask){
    return FormBuilderTextField(
      name: 'Title',
      style: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      ),
      validator: null,
      onSaved: (newValue) => backTask.task.title = newValue,
      initialValue: backTask.task.title == null ? '' : backTask.task.title,
      decoration: InputDecoration(
        hintText: 'Adicionar Título',
        border: InputBorder.none,
        prefixIcon: Icon(Icons.short_text, color: Colors.purple),
      ),
    );
  }

  Widget fieldDescription(BuildContext context, BackAddTask backTask){
    return FormBuilderTextField(
      name: 'Descrição',
      style: TextStyle(
        fontSize: 20,
        fontStyle: FontStyle.italic,
      ),
      maxLines: 5,
      minLines: 1,
      validator: null,
      onSaved: (newValue) => backTask.task.description = newValue,
      initialValue: backTask.task.description == null ? '' : backTask.task.description,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Adicionar Detalhes',
        prefixIcon: Icon(Icons.wrap_text, color: Colors.purple)
      ),
    );
  }

  Widget fieldDateTimePiker(BuildContext context, BackAddTask backTask){
    return FormBuilderDateTimePicker(
      name: 'Data',
      style: TextStyle(
        fontSize: 20,
        fontStyle: FontStyle.italic,
      ),
      initialValue: backTask.task.selectDate == null ? selectDate : DateTime.parse(backTask.task.selectDate),
      onSaved: (newValue) => backTask.task.selectDate = newValue.toIso8601String(),
      fieldHintText: 'Adicionar Data',
      locale: Locale('pt', 'BR'),
      inputType: InputType.date,
      enabled: false,
      format: DateFormat('dd-MM-yyyy'),
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(Icons.calendar_today_sharp, color: Colors.purple),
      ),
    );
  }

    Widget fieldSwitch(BuildContext context, BackAddTask backTask){
    return FormBuilderSwitch(//Input de check
      name: 'Publico',
      title: Text('Plantão Extra', 
        style: TextStyle(
          fontSize: 20
        ),
      ),
      initialValue: backTask.changeSwitch(backTask.isUpdate),
      onSaved: (newValue) => backTask.task.public = newValue.toString(),
      onChanged: (value){
        backTask.task.public = value.toString();
      },
      controlAffinity: ListTileControlAffinity.leading,
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
    );
  }

}
