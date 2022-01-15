// Copyright 2020 J-P Nurmi <jpnurmi@gmail.com>
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:cupertino_stepper/cupertino_stepper.dart';

int currentStep;

class StepperPage extends StatefulWidget {
  @override
  final int idPelanggaran;
  final String status;
  StepperPage(this.status, this.idPelanggaran);

  @override
  State<StatefulWidget> createState() {
    return _StepperPageState(this.status, this.idPelanggaran);
  }
}

class _StepperPageState extends State<StepperPage> {
  int idPelanggaran;
  String status;
  _StepperPageState(this.status, this.idPelanggaran);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('CupertinoStepper for Flutter'),
      ),
      child: SafeArea(
        child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            switch (orientation) {
              case Orientation.portrait:
                return _buildStepper(StepperType.vertical);
              case Orientation.landscape:
                return _buildStepper(StepperType.horizontal);
              default:
                throw UnimplementedError(orientation.toString());
            }
          },
        ),
      ),
    );
  }

  CupertinoStepper _buildStepper(StepperType type) {
    void statusValidation(String status) {
      if (status == "Pemberitahuan Informasi") {
        currentStep = 0;
      } else {
        currentStep = 1;
      }
    }

    statusValidation(status);

    return CupertinoStepper(
      type: type,
      currentStep: currentStep,
      steps: [
        _buildStep(
          title: Text('Pemberitahuan Informasi'),
          state: StepState.disabled,
        ),
        _buildStep(
          title: Text('Menuggu Konfirmasi'),
          state: StepState.disabled,
        ),
        _buildStep(
          title: Text('Selesai'),
          state: StepState.disabled,
        )
      ],
    );
  }

  Step _buildStep({
    Widget title,
    StepState state = StepState.indexed,
    bool isActive = false,
  }) {
    return Step(
      title: title,
      subtitle: Text('Subtitle'),
      state: state,
      isActive: isActive,
      content: LimitedBox(
        maxWidth: 200,
        maxHeight: 200,
        child: Container(color: CupertinoColors.systemGrey),
      ),
    );
  }
}
