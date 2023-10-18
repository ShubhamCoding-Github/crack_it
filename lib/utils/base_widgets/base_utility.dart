import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatFlutterDateTime({required DateTime flutterDateTime, bool? getDayFirst, String? separator}) {
  String seprate = separator ?? "-";
if (getDayFirst ?? false) {
  return "${flutterDateTime.day.toString().padLeft(2, '0')}$seprate${flutterDateTime.month.toString().padLeft(2, '0')}$seprate${flutterDateTime.year.toString().padLeft(2, '0')}";
} else {
  return "${flutterDateTime.year.toString().padLeft(2, '0')}$seprate${flutterDateTime.month.toString().padLeft(2, '0')}$seprate${flutterDateTime.day.toString().padLeft(2, '0')}";
}
}

String formatBackendDate(String dateString,
    {bool? getDayFirst, String? separator}) {
  if (dateString.isNotEmpty && dateString != "null") {
    String sprt = separator ?? '-';
    DateTime date = DateTime.parse(dateString);
    String day = date.day.toString().padLeft(2, '0');
    String month = date.month.toString().padLeft(2, '0');
    String year = date.year.toString().substring(0);
    if (getDayFirst ?? true) {
      return '$day$sprt$month$sprt$year';
    } else {
      return '$year$sprt$month$sprt$day';
    }
  } else {
    return "";
  }
}

String formatTime(DateTime dateTime) {
  if (dateTime.hour >= 12) {
  }

  String hour = dateTime.hour.toString();
  if (dateTime.hour < 10) {
    hour = "0${(dateTime.hour)}";
  }

  String minute = dateTime.minute.toString();
  if (dateTime.minute < 10) {
    minute = '0${dateTime.minute}';
  }
  return '$hour:$minute';
}

String getFormattedTimeWithMonth(String dateString1) {
  if (dateString1.isNotEmpty && dateString1 != "null") {
    DateTime date = DateTime.parse(dateString1);
    String formattedTime =
    DateFormat('MMM dd,\nhh:mm a').format(date.toLocal());
    return formattedTime;
  } else {
    return "";
  }
}

String getFormattedMonth(String dateString1) {
  if (dateString1.isNotEmpty && dateString1 != "null") {
    DateTime date = DateTime.parse(dateString1);
    String formattedTime =
    DateFormat('EEE dd MMM').format(date);
    return formattedTime;
  } else {
    return "";
  }
}


String getFormattedTime3(String dateString1) {
  if (dateString1.isNotEmpty && dateString1 != "null") {
    DateTime date = DateTime.parse(dateString1);
    String formattedTime = DateFormat('hh:mm a').format(date);
    return formattedTime;
  } else {
    return 'N/A';
  }
}

String showFormatOfTimeOfDay(TimeOfDay timeOfDay) {
  final now = DateTime.now();
  final today =
  DateTime(now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
  return DateFormat.jm().format(today); // "hh:mm a" format
}

String backendFormatOfTime(String timeString) {
  final parsedTime = DateFormat.jm().parse(timeString); // Parse the time string
  final formattedTime = DateFormat("HH:mm:ss").format(parsedTime); // Format to "hh:mm:ss" format
  return formattedTime;
}