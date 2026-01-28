import 'package:flutter/material.dart';

class RowWithSpacing extends Row {
  RowWithSpacing({
    super.key,
    double spacing = 8,
    bool hasleadingSpace = false,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textBaseline,
    super.textDirection,
    super.verticalDirection,
    List<Widget> children = const [],
  }) : super(
          children: [
            ...hasleadingSpace ? [SizedBox(width: spacing)] : [],
            ...children.expand((e) => [e, SizedBox(width: spacing)])
          ],
        );
}
