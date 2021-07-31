import 'package:ebl_mall/style/style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'text_form_field.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 56.0,
      // decoration: BoxDecoration(
      //   color: Colors.red,
      //   borderRadius: BorderRadius.circular(22),
      // ),
      child: InputWidget(
        contentPadding: EdgeInsets.zero,
        hint: 'بحث ',
        onTap: () {
          // KeyboardUtil.hideKeyboard(context);
          // Go.toPage(context: context, page: SearchProductPage());
        },
        validator: (v) {},
        suffixIcon: Icon(
          FontAwesomeIcons.search,
          color: Style.primaryColor,
          size: 16.0,
        ),
        // prefixIcon: Icon(
        //   Icons.search,
        //   color: Colors.grey,
        // ),
      ),
    );
  }
}
