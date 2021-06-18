import 'package:flutter/material.dart';

class ButtonData {
  final String title;

  ButtonData({@required this.title});
}

class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}

class Stocks {
  int yearval;
  int salesval;

  Stocks(this.yearval, this.salesval);
}
