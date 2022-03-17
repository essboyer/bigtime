import 'package:bigtime/screens/main_page/main_page_view_model.dart';
import 'package:bigtime/widgets/time_display.dart';
import 'package:flutter/material.dart';
import 'package:resizable_widget/resizable_widget.dart';
import 'package:stacked/stacked.dart';

class MainPageView extends StatelessWidget {
  const MainPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainPageViewModel>.reactive(
        viewModelBuilder: () => MainPageViewModel(),
        onModelReady: (viewModel) => viewModel.initialise(),
        builder: (context, viewModel, child) => Scaffold(
              body: _buildBody(viewModel),
            ));
  }

  Widget _buildBody(MainPageViewModel viewModel) {
    return Column(children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
              tooltip: 'Mode',
              onPressed: viewModel.onModeBtnPressed,
              icon: const Icon(Icons.mode)),
          IconButton(
              tooltip: "Settings",
              onPressed: viewModel.onSettingsBtnPressed,
              icon: const Icon(Icons.settings))
        ],
      ),
      Expanded(
        child: ResizableWidget(children: const [
          TimeDisplay(
            showMillisecond: true,
          )
        ]),
      )
    ]);
  }
}
