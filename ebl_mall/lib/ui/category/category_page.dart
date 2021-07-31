import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:animate_do/animate_do.dart';
import 'package:ebl_mall/models/category_model.dart';
import 'package:ebl_mall/network/api.dart';
import 'package:ebl_mall/style/style.dart';
import 'package:ebl_mall/ui/category/filtter_category_page.dart';
import 'package:ebl_mall/widgets/error_network_widget.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../main.dart';

// all categories
class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
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
    fetchCategories();
    //
    super.initState();
  }

  Widget _body2() {
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

  //
  int selectedIndex = 0;
  bool isLoading = true;
  bool isNetworkError = false;

  List<CategoryModel> _categories = [];
  //
  Future fetchCategories() async {
    print('populateCategories');
    await API.fetchCategories().then((categories) {
      isLoading = false;
      if (categories != null) {
        _categories.addAll(categories);
      }
      setState(() {});
    }).catchError((error) {
      if (error is SocketException) {
        isLoading = false;
        isNetworkError = true;
        setState(() {});
      }
    });
  }

  Widget _body() {
    if (isLoading) {
      return ShimmerCategory();
    }
    if (isNetworkError) {
      return Container(child: ErrorNetworkWidget());
    }
    if (_categories.length == 0) {
      return Center(child: Text('no categoty'));
    }
    return FadeInRight(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        // shrinkWrap: true,
        // physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              setState(() {
                selectedIndex = index;
                //
                // Push.goTo(
                //     context,
                //     FiltterCategoryPage(
                //       categoryName: _categories[index].name,
                //       categoryID: _categories[index].id,
                //     ));
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: 60.0,
              width: 100.0,
              margin: EdgeInsets.all(4.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selectedIndex == index ? Style.heighOrang : Colors.white,
                borderRadius: BorderRadius.circular(
                    selectedIndex == index ? 50.0 : radius),
                boxShadow: [
                  BoxShadow(
                    color: HexColor("#1c000000"),
                    blurRadius: 11.0,
                    spreadRadius: 0.0,
                    offset: Offset(0.0, 3.0),
                  )
                ],
              ),
              child: Text(
                _categories[index].name,
                style: TextStyle(
                  color: index == selectedIndex ? Colors.white : Colors.black,
                  fontSize: 13.0,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.fade,
              ),
            ),
          );
        },
      ),
    );
  }

  double radius = 35.0;
  //
  @override
  Widget build(BuildContext context) {
    //
    return Container(
        // height: 60.0,
        color: Colors.transparent,
        child: Column(
          children: [
            Expanded(child: _body()),
            Expanded(child: _body2()),
          ],
        ));
  }
}
