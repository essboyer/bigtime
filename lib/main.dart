import 'dart:io';

import 'package:bigtime/locator.dart';
import 'package:bigtime/main/app_state.dart';
import 'package:bigtime/screens/main_page/main_page_view.dart';
import 'package:bigtime/services/theme_service.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:window_size/window_size.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupScreen();
  runApp(ChangeNotifierProvider<AppState>(
    create: (_) => AppState(),
    child: BigtimeApp(),
  ));

  doWhenWindowReady(() {
    const initialSize = Size(800, 300);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
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
  BigtimeApp({Key? key}) : super(key: key);
  final ThemeService ts = locator<ThemeService>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'bigtime',
        theme: appState.getTheme(),
        home: const MainPage(),
      ),
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
