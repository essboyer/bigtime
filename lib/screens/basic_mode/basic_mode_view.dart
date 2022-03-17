import 'package:bigtime/widgets/time_display.dart';
import 'package:flutter/material.dart';
import 'package:resizable_widget/resizable_widget.dart';
import 'package:stacked/stacked.dart';

import 'basic_mode_view_model.dart';

class BasicModeView extends StatelessWidget {
  const BasicModeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BasicModeViewModel>.reactive(
        disposeViewModel: false,
        viewModelBuilder: () => BasicModeViewModel(),
        onModelReady: (viewModel) => viewModel.initialise(),
        builder: (context, viewModel, child) => _buildBody());
  }
}

Widget _buildBody() {
  return Expanded(child: ResizableWidget(children: const [TimeDisplay()]));
}
