import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'advanced_mode_view_model.dart';

class AdvancedModeView extends StatelessWidget {
  const AdvancedModeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdvancedModeViewModel>.reactive(
        viewModelBuilder: () => AdvancedModeViewModel(),
        onModelReady: (viewModel) => viewModel.initialise(),
        builder: (context, viewModel, child) => const Scaffold());
  }
}
