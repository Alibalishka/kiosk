import 'package:flutter/material.dart';

class ColumnSpacer extends StatelessWidget {
  static const int _multiplier = 10;

  final double value;

  const ColumnSpacer(this.value, {super.key});

  @override
  Widget build(BuildContext context) => SizedBox(height: value * _multiplier);
}
