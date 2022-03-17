import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';

class TimeDisplay extends StatefulWidget {
  /// Text color
  final Color color;

  /// Maybe you would like to see the milliseconds?
  final bool showMillisecond;

  /// The precision of milliseconds, between 1-3
  final int millisPrecision;

  const TimeDisplay(
      {Key? key,
      this.color = Colors.white,
      this.showMillisecond = false,
      this.millisPrecision = 1})
      : super(key: key);

  @override
  _TimeDisplayState createState() => _TimeDisplayState();
}

class _TimeDisplayState extends State<TimeDisplay> {
  DateTime _timeOfDay = DateTime.now();
  Timer? _timer;
  String _timeStr = "00";

  @override
  void initState() {
    super.initState();
    _timer ??= Timer.periodic(const Duration(milliseconds: 100), _runClock);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(_timeStr,
          style: TextStyle(
              color: widget.color,
              fontWeight: FontWeight.bold,
              fontFeatures: const [FontFeature.tabularFigures()])),
    );
  }

  void _runClock(Timer timer) {
    _timeStr = "${_timeOfDay.hour < 10 ? "0" : ""}${_timeOfDay.hour}:"
        "${_timeOfDay.minute < 10 ? "0" : ""}${_timeOfDay.minute}:"
        "${_timeOfDay.second < 10 ? "0" : ""}${_timeOfDay.second}";
    if (widget.showMillisecond) {
      _timeStr +=
          ":${_timeOfDay.millisecond < 100 ? 0 : _timeOfDay.millisecond.toString().substring(0, widget.millisPrecision)}";
    }
    setState(() {
      _timeOfDay = DateTime.now();
    });
  }
}
