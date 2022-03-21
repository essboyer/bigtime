import 'package:bigtime/screens/advanced_mode/advanced_mode_view.dart';
import 'package:bigtime/screens/basic_mode/basic_mode_view.dart';
import 'package:bigtime/screens/main_page/main_page_view_model.dart';
import 'package:bigtime/screens/settings/settings_page_view.dart';
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
              body: SafeArea(child: _buildBody(viewModel)),
            ));
  }

  Widget _buildBody(MainPageViewModel viewModel) {
    return Column(children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
              padding: const EdgeInsets.all(0.0),
              tooltip:
                  (viewModel.advancedMode ? 'Advanced' : 'Basic') + ' Mode',
              onPressed: viewModel.onModeBtnPressed,
              icon: Icon(viewModel.advancedMode ? Mdi.alphaA : Mdi.alphaB)),
          IconButton(
              padding: const EdgeInsets.all(0.0),
              tooltip: "Settings",
              onPressed: viewModel.onSettingsBtnPressed,
              icon: const Icon(Mdi.cog))
        ],
      ),
      _buildDisplayArea(viewModel),
    ]);
  }

  Widget _buildDisplayArea(MainPageViewModel viewModel) {
    return [
      const BasicModeView(),
      const AdvancedModeView(),
      const SettingsPageView()
    ][viewModel.showSettings
        ? 2
        : viewModel.advancedMode
            ? 1
            : 0];
  }
}
