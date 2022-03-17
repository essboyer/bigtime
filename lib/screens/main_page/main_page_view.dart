import 'package:bigtime/screens/advanced_mode/advanced_mode_view.dart';
import 'package:bigtime/screens/basic_mode/basic_mode_view.dart';
import 'package:bigtime/screens/main_page/main_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
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
              icon: const Icon(Mdi.abTesting)),
          IconButton(
              tooltip: "Settings",
              onPressed: viewModel.onSettingsBtnPressed,
              icon: const Icon(Icons.settings))
        ],
      ),
      _buildDisplayArea(viewModel),
    ]);
  }

  Widget _buildDisplayArea(MainPageViewModel viewModel) {
    if (viewModel.advancedMode) {
      return const AdvancedModeView();
    }
    return const BasicModeView();
  }
}
