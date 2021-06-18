import 'package:calendar_task/app/view/viewBack/back_detail.dart';
import 'package:flutter/material.dart';

class DetailTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var backDetail = BackDetail(context);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){

        var width = constraints.biggest.width;
        var radius = width/4;

        return Scaffold(
          appBar: AppBar(
            title: Text('Detalhes ${backDetail.task.title}'),
          ),
          backgroundColor: Colors.white,
          body: ListView(
            padding: EdgeInsets.all(30),
            children: [
              CircleAvatar(
                child: backDetail.task.public.contains('false') ? Icon(Icons.local_hospital, size: width/3, color: Colors.red[600],) : Icon(Icons.local_hospital_outlined, size:  width/3, color: Colors.black,),
                radius: radius,
                backgroundColor: backDetail.task.public.contains('false') ? Colors.white : Colors.amber[100],
              ),
              Divider(thickness: 2,),
              Padding(
                padding: const EdgeInsets.only(top:15),
                child: Center(
                  child: Text(
                    '${backDetail.task.title.toUpperCase()}',
                    style: TextStyle(
                      fontSize: 20, 
                      fontWeight: FontWeight.bold,
                    )
                  ),
                ),
              ),
              Divider(thickness: 2,),
              Padding(
                padding: const EdgeInsets.only(top:10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${backDetail.task.description}',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                    ),
                  ),
                ), 
              ),
              Divider(thickness: 2,),
              Padding(
                padding: const EdgeInsets.only(top:10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      backDetail.task.public.contains('false') ? 'Plantão Normal' : 'Plantão Extra',
                      style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ), 
              ),
              Divider(thickness: 2,),
              Padding(
                padding: const EdgeInsets.only(top:10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'Data ${backDetail.showData(backDetail.task.selectDate)}',
                      style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ), 
              ),
            ],
          ),
        );
      }
    );
  }
}