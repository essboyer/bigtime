import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:resizable_widget/resizable_widget.dart';

class TimeDisplay extends StatefulWidget {
  const TimeDisplay({Key? key}) : super(key: key);

  @override
  _TimeDisplayState createState() => _TimeDisplayState();
}

class _TimeDisplayState extends State<TimeDisplay> {
  DateTime _timeOfDay = DateTime.now();
  String _timeStr = "00";
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
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
    return FittedBox(
      child: Text(_timeStr,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFeatures: [FontFeature.tabularFigures()])),
    );
  }
}
