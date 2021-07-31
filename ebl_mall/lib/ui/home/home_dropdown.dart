import 'dart:convert';
import 'dart:io';

import 'package:ebl_mall/style/style.dart';
import 'package:flutter/material.dart';
import 'package:ebl_mall/main.dart';
import 'package:http/http.dart' as http;

class HomeDropDown extends StatefulWidget {
  @override
  _HomeDropDownState createState() => _HomeDropDownState();
}

class _HomeDropDownState extends State<HomeDropDown> {
  //
  String initCategoryName = '';
  bool isLoadingCategories = true;
  bool isInternetError = false;
  List<dynamic> categoryNames = [];
  //
  Future populateDropDown() async {
    try {
      http.Response response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      var resBody = json.decode(response.body);
      if (resBody != null) {
        categoryNames = resBody;
        isLoadingCategories = false;
        // update ui
        setState(() {});
      }
    } catch (e) {
      if (e is SocketException) {
        isLoadingCategories = false;
        isInternetError = true;
        setState(() {});
      }
    }
  }

  //
  @override
  void initState() {
    //
    populateDropDown();
    //
    super.initState();
  }

  Widget _body() {
    if (isLoadingCategories) {
      return Text('جاري جلب البيانات ..');
    }

    if (isInternetError) {
      return Text('check internet connection');
    }
    return DropdownButton<String>(
      underline: Container(),
      icon: Icon(Icons.keyboard_arrow_down),
      isExpanded: true,
      // style: TextStyle(),
      isDense: true,
      style: Style.medium(),
      onChanged: (v) => setState(() => initCategoryName = v!),
      hint: Text(initCategoryName),
      // value: 'initValueCategories',
      items: categoryNames.map((data) {
        return DropdownMenuItem<String>(
          value: data['title'],
          child: Text(data['title'], style: Style.tiny()),
        );
      }).toList(),
    );
  }

  // build
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3.0),
        border: Border.all(color: Style.customGrey),
      ),
      child: _body(),
    );
  }
}
