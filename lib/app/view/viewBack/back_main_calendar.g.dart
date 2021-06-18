// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'back_main_calendar.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BackMainCalendar on BackMainCalendarBase, Store {
  final _$focusedDayAtom = Atom(name: 'BackMainCalendarBase.focusedDay');

  @override
  DateTime get focusedDay {
    _$focusedDayAtom.reportRead();
    return super.focusedDay;
  }

  @override
  set focusedDay(DateTime value) {
    _$focusedDayAtom.reportWrite(value, super.focusedDay, () {
      super.focusedDay = value;
    });
  }

  final _$selectDateAtom = Atom(name: 'BackMainCalendarBase.selectDate');

  @override
  DateTime get selectDate {
    _$selectDateAtom.reportRead();
    return super.selectDate;
  }

  @override
  set selectDate(DateTime value) {
    _$selectDateAtom.reportWrite(value, super.selectDate, () {
      super.selectDate = value;
    });
  }

  final _$formatAtom = Atom(name: 'BackMainCalendarBase.format');

  @override
  CalendarFormat get format {
    _$formatAtom.reportRead();
    return super.format;
  }

  @override
  set format(CalendarFormat value) {
    _$formatAtom.reportWrite(value, super.format, () {
      super.format = value;
    });
  }

  final _$listAtom = Atom(name: 'BackMainCalendarBase.list');

  @override
  List<Task> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(List<Task> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$listEventTaskAtom = Atom(name: 'BackMainCalendarBase.listEventTask');

  @override
  List<Task> get listEventTask {
    _$listEventTaskAtom.reportRead();
    return super.listEventTask;
  }

  @override
  set listEventTask(List<Task> value) {
    _$listEventTaskAtom.reportWrite(value, super.listEventTask, () {
      super.listEventTask = value;
    });
  }

  final _$listTaskAtom = Atom(name: 'BackMainCalendarBase.listTask');

  @override
  Future<List<Task>> get listTask {
    _$listTaskAtom.reportRead();
    return super.listTask;
  }

  @override
  set listTask(Future<List<Task>> value) {
    _$listTaskAtom.reportWrite(value, super.listTask, () {
      super.listTask = value;
    });
  }

  final _$selectedTasksAtom = Atom(name: 'BackMainCalendarBase.selectedTasks');

  @override
  Map<DateTime, List<Task>> get selectedTasks {
    _$selectedTasksAtom.reportRead();
    return super.selectedTasks;
  }

  @override
  set selectedTasks(Map<DateTime, List<Task>> value) {
    _$selectedTasksAtom.reportWrite(value, super.selectedTasks, () {
      super.selectedTasks = value;
    });
  }

  final _$dotColorAtom = Atom(name: 'BackMainCalendarBase.dotColor');

  @override
  Color get dotColor {
    _$dotColorAtom.reportRead();
    return super.dotColor;
  }

  @override
  set dotColor(Color value) {
    _$dotColorAtom.reportWrite(value, super.dotColor, () {
      super.dotColor = value;
    });
  }

  @override
  String toString() {
    return '''
focusedDay: ${focusedDay},
selectDate: ${selectDate},
format: ${format},
list: ${list},
listEventTask: ${listEventTask},
listTask: ${listTask},
selectedTasks: ${selectedTasks},
dotColor: ${dotColor}
    ''';
  }
}
