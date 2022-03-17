import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:resizable_widget/resizable_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:window_size/window_size.dart';

import 'screens/basic_mode/basic_mode_view_model.dart';
import 'screens/main_page/main_page_view_model.dart';
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

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainPageViewModel>.reactive(
        viewModelBuilder: () => MainPageViewModel(),
        onModelReady: (viewModel) => viewModel.initialise(),
        builder: (context, viewModel, child) => Scaffold(body: _buildBody()));
  }
}

_buildBody() {}

// class BigtimeMainPage extends StatefulWidget {
//   const BigtimeMainPage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<BigtimeMainPage> createState() => _BigtimeMainPageState();
// }

// class _BigtimeMainPageState extends State<BigtimeMainPage> {
//   @override
//   void initState() {
//     super.initState();
//     _getWindowSize();
//   }

//   String _windowSize = "";

//   Future _getWindowSize() async {
//     //var size = await DesktopWindow.setWindowSize(const Size(1200, 300));
//     // setState(() {
//     //   _windowSize = '${size.width} x ${size.height}';
//     //   print(_windowSize);
//     // });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   toolbarHeight: 40,
//       //   actions: const [
//       //     IconButton(onPressed: null, icon: Icon(Icons.settings))
//       //   ],
//       // ),
//       body: Center(
//         child: ResizableWidget(
//           //mainAxisAlignment: MainAxisAlignment.center,
//           children: const <Widget>[TimeDisplay()],
//         ),
//       ),
//     );
//   }
// }
