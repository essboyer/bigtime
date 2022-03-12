import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';

class TimeInHourAndMinute extends StatefulWidget {
  @override
  _TimeInHourAndMinuteState createState() => _TimeInHourAndMinuteState();
}

class _TimeInHourAndMinuteState extends State<TimeInHourAndMinute> {
  DateTime _timeOfDay = DateTime.now();
  String _timeStr = "00";
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      _timeStr =
          "${_timeOfDay.hour}:${_timeOfDay.minute}:${_timeOfDay.second < 10 ? "0" : ""}${_timeOfDay.second}";
      //if (_timeOfDay.minute != TimeOfDay.now().minute) {
      setState(() {
        _timeOfDay = DateTime.now();
      });
      //}
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
          // if you use _timeOfDay.hour then it will show 20:10 like that
          // But we want 8:10
          _timeStr,
          style: const TextStyle(
            fontSize: 200,
            fontWeight: FontWeight.bold,
            fontFeatures: [FontFeature.tabularFigures()],
          ),
        ),
      ],
    );
  }
}
