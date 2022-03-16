import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:resizable_widget/resizable_widget.dart';
import 'package:window_size/window_size.dart';

import 'widgets/time_display.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupScreen();
  runApp(const MyApp());
}

void setupScreen() async {
  Size maxWindowSize;

  // No full screen for us, by default
  if (Platform.isMacOS || Platform.isLinux || Platform.isWindows) {
    Screen? scr = await getCurrentScreen();
    double width = scr?.frame.width ?? 0;
    double height = scr?.frame.height ?? 0;
    DesktopWindow.setWindowSize(
        Size(width - (width * 0.5), height - (height * 0.8)));
  }
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
    //var size = await DesktopWindow.setWindowSize(const Size(1200, 300));
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
          children: const <Widget>[TimeDisplay()],
        ),
      ),
    );
  }
}
