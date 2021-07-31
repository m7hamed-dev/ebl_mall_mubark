import 'package:ebl_mall/style/style.dart';
import 'package:flutter/material.dart';

class MyElevatedBtn extends StatelessWidget {
  final Function()? onPressed;
  final Widget? child;
  final Color? color;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final double? radius;
  final double? elevation;
  // final Color? textColor;
  const MyElevatedBtn({
    Key? key,
    this.onPressed,
    this.child,
    this.color,
    this.margin,
    this.width,
    this.height,
    this.radius,
    this.elevation,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? 50.0,
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
        onLongPress: () {},
        style: ElevatedButton.styleFrom(
          primary: color ?? Style.primaryColor,

          // fixedSize: Size.zero,
          elevation: elevation ?? .5,
          padding: EdgeInsets.symmetric(vertical: 10.0),
          textStyle: TextStyle(
            fontSize: 20,
            // color: color,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 5.0),
          ),
        ),
      ),
    );
  }
}

class MyElevatedIconBtn extends StatelessWidget {
  final Function()? onPressed;
  // final Widget child;
  final Widget label;
  final Widget icon;
  final Color? color;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final double? radius;
  final double? elevation;
  // final Color? textColor;
  const MyElevatedIconBtn({
    Key? key,
    this.onPressed,
    required this.label,
    required this.icon,
    this.color,
    this.margin,
    this.width,
    this.height,
    this.radius,
    this.elevation,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? 50.0,
      child: ElevatedButton.icon(
        label: label,
        icon: icon,
        onPressed: onPressed,
        // child: child,
        onLongPress: () {},
        style: ElevatedButton.styleFrom(
          primary: color ?? Style.primaryColor,
          // fixedSize: Size.zero,
          elevation: elevation ?? .5,
          padding: EdgeInsets.symmetric(vertical: 10.0),
          textStyle: TextStyle(
            fontSize: 20,
            // color: color,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 5.0),
          ),
        ),
      ),
    );
  }
}
