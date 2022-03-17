import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'settings_screen_view_model.dart';

class SettingsScreenView extends StatelessWidget {
  const SettingsScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsScreenViewModel>.reactive(
        viewModelBuilder: () => SettingsScreenViewModel(),
        onModelReady: (viewModel) => viewModel.initialise(),
        builder: (context, viewModel, child) => Scaffold(body: _buildBody()));
  }
}

_buildBody() {}
