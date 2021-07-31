import 'package:ebl_mall/data/local_storage.dart';
import 'package:ebl_mall/main.dart';
import 'package:ebl_mall/models/user_model.dart';
import 'package:ebl_mall/style/style.dart';
import 'package:ebl_mall/ui/account/profile2.dart';
import 'package:ebl_mall/ui/account/sign_in_page.dart';
import 'package:ebl_mall/ui/ads/create_ads_page.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  //
  InkWell _column(IconData icon, String data, {required int index}) {
    return InkWell(
      onTap: () => Push.goTo(
        context,
        index == 4
            ? ProfileTwoPage(
                user: UserModel(
                  name: 'mohamed elsyed',
                  phone: '0929469784',
                  imageUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSD-l889V8_Nv64SYZECELEBUzvWgmgxdlAow&usqp=CAU',
                ),
              )
            : isLoginIn == false
                ? SignInPage()
                : (index == 1 ? CreateAdsPage() : CreateAdsPage()),
      ),
      onLongPress: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(icon, color: Colors.white),
          Text(data, style: Style.tiny(fontSize: 12.0, color: Colors.white)),
        ],
      ),
    );
  }

  bool isLoginIn = false;
  //
  check() async {
    isLoginIn = await LocalStorage.checkLogin();
    setState(() {});
  }

  @override
  void initState() {
    check();
    super.initState();
  }

  //
  @override
  Widget build(BuildContext context) {
    // return BottomAppBar(
    //   color: Style.primaryColor,
    //   shape: CircularNotchedRectangle(),

    // notchMargin: 10.0,
    return Container(
      height: 55.0,
      decoration: BoxDecoration(
          color: Style.primaryColor,
          borderRadius: BorderRadius.circular(10.00),
          boxShadow: [
            BoxShadow(
              color: HexColor("#1c000000"),
              blurRadius: 11.0,
              spreadRadius: 0.0,
              offset: Offset(0.0, 1.0),
            )
          ]),
      margin: EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // _column(Icons.home, 'الرئيسة'), _div,
          _column(Icons.branding_watermark, 'إضافة إعلان', index: 2), _div,
          _column(Icons.account_balance_rounded, 'إضافة حراج', index: 1), _div,
          _column(isLoginIn ? Icons.account_circle_rounded : Icons.close,
              'الملف الشخصي',
              index: 0),
          // Left Tab bar icons
          // Icon(
          //   Icons.account_circle,
          //   color: Colors.white,
          //   // color: currentTab == 3 ? Colors.blue : Colors.grey,
          // ),
          // Right Tab bar icons
          // Icon(
          //   Icons.chat,
          //   color: Colors.white,
          //   // color: currentTab == 3 ? Colors.blue : Colors.grey,
          // )
        ],
      ),
    );
    // ),
    // ),
    // );
  }

  Widget get _div => Container(height: 33.0, width: .5, color: Colors.white);
}
