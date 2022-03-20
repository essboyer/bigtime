import 'dart:io';

import 'package:bigtime/main/app_state.dart';
import 'package:bigtime/screens/main_page/main_page_view.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:window_size/window_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupScreen();
  runApp(ChangeNotifierProvider<AppState>(
    create: (_) => AppState(),
    child: const BigtimeApp(),
  ));
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
    return const MainPageView();
  }
}
