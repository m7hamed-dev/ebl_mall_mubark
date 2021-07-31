import 'package:ebl_mall/main.dart';
import 'package:ebl_mall/style/style.dart';
import 'package:ebl_mall/ui/home/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 3),
      () => Push.goTo(
        context,
        MyHomePage(),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //
    return Container(
      color: Style.primaryColor,
      child: Scaffold(
        backgroundColor: Style.primaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: CircularProgressIndicator()),
            SizedBox(height: 30.0),
            Text('please waiting ..'),
          ],
        ),
      ),
    );
  }
}
