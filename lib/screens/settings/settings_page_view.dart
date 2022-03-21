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
        builder: (context, viewModel, child) => _buildBody(viewModel));
  }
}

Widget _buildBody(SettingsPageViewModel viewModel) {
  return Expanded(
    child: Column(
      children: [
        Row(children: [Text("Dark Mode"), ]),
        ElevatedButton(onPressed: viewModel.close, child: Text("Done"))
      ],
    ),
  );
}
