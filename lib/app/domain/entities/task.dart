class Task{

int id;
String title;
String description;
String selectDate;
String dateNow;
String public;

Task({this.id, this.title, this.description, this.selectDate, this.dateNow, this.public});

Task.mapToModel(Map<String, dynamic> dados){
  this.id = dados['id'];
  this.title = dados['title'];
  this.description = dados['description'];
  this.selectDate = dados['selectDate'];
  this.dateNow = dados['dateNow'];
  this.public = dados['public'];
}

}