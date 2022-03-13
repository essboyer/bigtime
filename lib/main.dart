import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:resizable_widget/resizable_widget.dart';

import 'widgets/time_in_hours_and_minutes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'bigtime',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'bigtime'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    _getWindowSize();
  }

  String _windowSize = "";

  Future _getWindowSize() async {
    var size = await DesktopWindow.setWindowSize(const Size(1200, 300));
    // setState(() {
    //   _windowSize = '${size.width} x ${size.height}';
    //   print(_windowSize);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 40,
      //   actions: const [
      //     IconButton(onPressed: null, icon: Icon(Icons.settings))
      //   ],
      // ),
      body: Center(
        child: ResizableWidget(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[FittedBox(child: TimeInHourAndMinute())],
        ),
      ),
    );
  }
}
