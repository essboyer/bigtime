import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'settings_page_view_model.dart';

class SettingsPageView extends StatelessWidget {
  const SettingsPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsPageViewModel>.reactive(
        viewModelBuilder: () => SettingsPageViewModel(),
        onModelReady: (viewModel) => viewModel.initialise(),
        builder: (context, viewModel, child) => _buildBody(context, viewModel));
  }
}

Widget _buildBody(BuildContext context, SettingsPageViewModel viewModel) {
  return Expanded(
      child: Column(children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        const Text('Light mode'),
        Switch(
            activeColor: Theme.of(context).colorScheme.secondary,
            value: viewModel.themeService.isDarkMode(),
            onChanged: (newVal) {
              viewModel.switchTheme(newVal);
            }),
        const Text('Dark mode'),
      ],
    ),
  ]));
}
