import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:resizable_widget/resizable_widget.dart';
import 'package:window_size/window_size.dart';
import 'widgets/time_display.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupScreen();
  runApp(const BigtimeApp());
}

void setupScreen() async {
  // No full screen for us, by default
  if (Platform.isMacOS || Platform.isLinux || Platform.isWindows) {
    Screen? scr = await getCurrentScreen();
    double width = scr?.frame.width ?? 0;
    double height = scr?.frame.height ?? 0;
    DesktopWindow.setWindowSize(
        Size(width - (width * 0.5), height - (height * 0.8)));
  }
}

class BigtimeApp extends StatelessWidget {
  const BigtimeApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'bigtime',
      theme: ThemeData.dark(),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody());
  }

  Widget _buildBody() {
    return Column(children: <Widget>[
      Expanded(
        child: ResizableWidget(children: const [TimeDisplay()]),
      )
    ]);
  }
}
