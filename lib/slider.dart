import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'Provider/value.dart';

class slider2 extends StatefulWidget {
  final int max, min, step, interval;
  final String tasks;
  const slider2({
    super.key,
    required this.max,
    required this.min,
    required this.step,
    required this.interval,
    required this.tasks,
  });

  @override
  State<slider2> createState() => _slider2State();
}

class _slider2State extends State<slider2> {
  @override
  Widget build(BuildContext context) {
    int _value = 50;

    return SfSlider(
      min: widget.min,
      max: widget.max,
      value: // if(widget.tasks=="sensitivity"){context.watch<SensitivityValue>().svalue;}else{if(widget.tasks=="load"){context.watch<resolveValue>().rvalue;}else{if(widget.tasks=="resolve"){context.watch<loadValue>().lvalue;}},
          _value,
      interval: widget.interval.toDouble(),
      showTicks: true,
      stepSize: widget.step.toDouble(),
      showLabels: true,
      // enableTooltip: true,
      // minorTicksPerInterval: 1,
      onChanged: (value) {
        setState(() {
          _value = value.toInt();
          context.read<SensitivityValue>().schange(value.toInt());
        });
      },
    );
  }
}
