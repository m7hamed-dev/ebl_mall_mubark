import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomChip extends StatelessWidget {
  final Widget label;
  const CustomChip({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    return Chip(
      label: label,
      backgroundColor: HexColor('#fff1db'),
    );
  }
}
