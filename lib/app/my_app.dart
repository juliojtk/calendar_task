import 'package:calendar_task/app/routes/app_routes.dart';
import 'package:calendar_task/app/view/add_task.dart';
import 'package:calendar_task/app/view/detail_task.dart';
import 'package:calendar_task/app/view/main_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('pt', 'BR'),
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        AppRoutes.HOME : (context) => MainCalendar(),
        AppRoutes.ADDEVENT : (context) => AddEvent(),
        AppRoutes.DETAILS : (context) => DetailTask(),
      },
    );
  }
}