import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../Provider/value.dart';

class resolveSlider extends StatefulWidget {
  final int max, min, step, interval;
  const resolveSlider({
    super.key,
    required this.max,
    required this.min,
    required this.step,
    required this.interval,
  });

  @override
  State<resolveSlider> createState() => _resolveSliderState();
}

class _resolveSliderState extends State<resolveSlider> {
  int _value = 12;
  @override
  Widget build(BuildContext context) {
    return SfSlider(
      min: widget.min,
      max: widget.max,
      value: _value,
      interval: widget.interval.toDouble(),
      showTicks: true,
      stepSize: widget.step.toDouble(),
      showLabels: true,
      // enableTooltip: true,
      // minorTicksPerInterval: 1,
      onChanged: (value) {
        setState(() {
          _value = value.toInt();
          context.read<resolveValue>().rchange(value.toInt());
        });
      },
    );
  }
}
