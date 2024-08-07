// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ToggleeSwitch extends StatelessWidget {
  const ToggleeSwitch({
    super.key,
    required this.onToggle, required this.initIndex, required this.labels,
  });
  final List<String> labels ;
  final Function(int?)? onToggle;
  final int initIndex;

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
        minWidth: double.maxFinite,
        activeBorders: [Border.all(color: Colors.white)],
        activeFgColor: Colors.white,
        initialLabelIndex: initIndex,
        totalSwitches: 3,
        labels: labels,
        onToggle: onToggle);
  }
}
