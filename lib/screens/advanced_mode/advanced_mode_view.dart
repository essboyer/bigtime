import 'package:bigtime/widgets/time_display.dart';
import 'package:flutter/material.dart';
import 'package:resizable_widget/resizable_widget.dart';
import 'package:stacked/stacked.dart';

import 'advanced_mode_view_model.dart';

class AdvancedModeView extends StatelessWidget {
  const AdvancedModeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdvancedModeViewModel>.reactive(
        viewModelBuilder: () => AdvancedModeViewModel(),
        onModelReady: (viewModel) => viewModel.initialise(),
        builder: (context, viewModel, child) => _buildBody());
  }

  Widget _buildBody() {
    return Expanded(
        child: ResizableWidget(
            isHorizontalSeparator: true,
            children: const [TimeDisplay(), TimeDisplay()]));
  }
}
