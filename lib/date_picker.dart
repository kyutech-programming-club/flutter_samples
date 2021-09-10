import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

Future<String> selectDate(BuildContext context) async {
  String selectedDate = "";
  final selected = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2015),
    lastDate: DateTime(2022),
  );
  if (selected != null) {
    selectedDate = (DateFormat.yMMMEd('ja')).format(selected);
  }
  return selectedDate;
}
