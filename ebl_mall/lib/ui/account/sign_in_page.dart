import 'package:ebl_mall/data/local_storage.dart';
import 'package:ebl_mall/network/api.dart';
import 'package:ebl_mall/style/style.dart';
import 'package:ebl_mall/tools/custom_flushbar.dart';
import 'package:ebl_mall/widgets/my_elevated_btn.dart';
import 'package:ebl_mall/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import '../../main.dart';

class SignInPage extends StatefulWidget {
  //
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  //
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(),
      body: BodyWidget(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // SvgPicture.asset(
                  //   'assets/svgs/background.svg',
                  //   fit: BoxFit.cover,
                  // ),
                  //
                  //
                  InputWidget(
                    hint: 'إدخل رقم الهاتف',
                    textInputType: TextInputType.number,
                    controller: phoneController,
                    // validator: (value) => Validation.phoneValidate(value),
                  ),
                  InputWidget(
                    hint: 'إدخل كلمة المرور',
                  ),
                  InputWidget(
                    hint: 'إعد إدخل كلمة المرور ',
                  ),
                  // sign in
                  MyElevatedBtn(
                    color: Style.primaryColor,
                    radius: 40.0,
                    child: Text(
                      'تسجيل دخول',
                      style: Style.bold(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (phoneController.text.trim().isEmpty) {
                        return CustomFlushBar.flushbar(
                            'fields are required !!', context,
                            isError: true);
                      }
                      Map map = {'phone': phoneController.text.trim()};
                      //
                      await API.similationSignIn(context, map);
                      //
                      await LocalStorage.setLogin(true);
                      //
                      CustomFlushBar.flushbar('login success', context,
                          isError: false);
                    },
                  ),
                ]
                    .map((e) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 3.0),
                          child: e,
                        ))
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
