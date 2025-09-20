import 'package:flutter/material.dart';

class Brand {
  final String name;
  final String displayName;
  final Widget icon;
  final bool isSelected;

  Brand({
    required this.name,
    required this.displayName,
    required this.icon,
    this.isSelected = false,
  });
}
