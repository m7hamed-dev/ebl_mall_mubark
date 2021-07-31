import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ebl_mall/main.dart';

//
class ShimmerHomeDropDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: context.width,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3.0),
      ),
      child: Shimmer.fromColors(
        child: Card(color: Colors.grey),
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
      ),
    );
  }
}
