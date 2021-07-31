import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ebl_mall/main.dart';

class ShimmerBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.25,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Container(
        height: 60.0,
        width: 100.0,
        margin: EdgeInsets.all(4.0),
        // color: Colors.red,
        child: Shimmer.fromColors(
          child: Card(color: Colors.grey),
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
        ),
      ),
    );
  }
}
