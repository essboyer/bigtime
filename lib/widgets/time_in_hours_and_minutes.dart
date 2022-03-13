import 'dart:async';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TimeInHourAndMinute extends StatefulWidget {
  const TimeInHourAndMinute({Key? key}) : super(key: key);

  @override
  _TimeInHourAndMinuteState createState() => _TimeInHourAndMinuteState();
}

class _TimeInHourAndMinuteState extends State<TimeInHourAndMinute> {
  DateTime _timeOfDay = DateTime.now();
  String _timeStr = "00";
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 1), (timer) {
      _timeStr = "${_timeOfDay.hour < 10 ? "0" : ""}${_timeOfDay.hour}:"
          "${_timeOfDay.minute < 10 ? "0" : ""}${_timeOfDay.minute}:"
          "${_timeOfDay.second < 10 ? "0" : ""}${_timeOfDay.second}";
      // "${_timeOfDay.millisecond < 10 ? "0" : ""}"
      // "${_timeOfDay.millisecond < 100 ? "0" : ""}"
      // ":${_timeOfDay.millisecond}";
      setState(() {
        _timeOfDay = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _timeStr,
          // minFontSize: 200,
          // maxFontSize: 400,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontFeatures: [FontFeature.tabularFigures()],
          ),
        ),
      ],
    );
  }
}
