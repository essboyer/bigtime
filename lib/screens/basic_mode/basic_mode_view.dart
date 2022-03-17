import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'basic_mode_view_model.dart';

class BasicModeView extends StatelessWidget {
  const BasicModeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BasicModeViewModel>.reactive(
        viewModelBuilder: () => BasicModeViewModel(),
        onModelReady: (viewModel) => viewModel.initialise(),
        builder: (context, viewModel, child) => Scaffold(body: _buildBody()));
  }
}

_buildBody() {}
