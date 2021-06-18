import 'package:calendar_task/app/dataBase/connection.dart';
import 'package:calendar_task/app/domain/entities/task.dart';
import 'package:calendar_task/app/domain/interfaces/task_dao.dart';
import 'package:sqflite/sqflite.dart';

class TaskDaoImplement implements TaskDao{

  String tableName = 'taskTable';
  String id = 'id';
  String title = 'title';
  String description = 'description';
  String selectDate = 'selectDate';
  String dateNow = 'dateNow';
  String public = 'public';

  Database _db;

  @override
  Future<List<Task>> listAllTask() async{
    _db = await Connection.getDataBase();
    List<Map<String, dynamic>> resultList = await _db.query(tableName);
    List<Task> taskList =  List.generate(resultList.length, (i){
      var line = resultList[i];
        return Task(
          id: line['id'],
          title: line['title'],
          description: line['description'],
          public: line['public'],
          selectDate: line['selectDate'],
          dateNow: line['dateNow'],
        );
      }
    );
    return taskList;
  }


  @override
  saveTask(Task task) async{
    _db = await Connection.getDataBase();
    var sql;
    if(task.id == null){
      sql = 'INSERT INTO $tableName ($title, $description, $selectDate, $dateNow, $public) VALUES(?,?,?,?,?)';
      _db.rawInsert(sql, [task.title, task.description, task.selectDate, task.dateNow, task.public]);
    }else{
      sql = 'UPDATE $tableName SET $title = ?, $description = ?, $selectDate = ?, $dateNow = ?, $public = ? WHERE $id = ?';
      _db.rawUpdate(sql, [task.title, task.description, task.selectDate, task.dateNow, task.public, task.id]);
    }
  }

  @override
  deleteTask(int id) async{
    _db = await Connection.getDataBase();
    var sql;
    sql = 'DELETE FROM $tableName  WHERE id = ?';
    _db.rawDelete(sql, [id]);
  }



}