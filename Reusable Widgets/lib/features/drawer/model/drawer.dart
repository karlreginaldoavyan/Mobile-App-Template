import 'package:flutter/material.dart';

class ModelDrawer {
  final String label;
  final String title;
  final Widget child;
  ModelDrawer(this.label, this.title, {required this.child});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ModelDrawer && other.label == label;
  }

  @override
  int get hashCode => label.hashCode;
}
