import 'package:flutter/material.dart';

class ErrorNetworkWidget extends StatelessWidget {
  const ErrorNetworkWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('network error'),
    );
  }
}