import 'dart:convert';
import 'package:ebl_mall/data/constant.dart';
import 'package:ebl_mall/models/category_model.dart';
import 'package:ebl_mall/models/sub_category_model.dart';
import 'package:ebl_mall/tools/custom_flushbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//
class API {
  //
  static Future<void> similationSignIn(BuildContext context, Map map) async {
    if (map['phone'] == '123') {
      CustomFlushBar.flushbar('phone success !!', context, isError: false);
    } else {
      CustomFlushBar.flushbar('phone Error !!', context, isError: true);
    }
  }

  // sign-up
  Future signUP(Map body) async {
    try {
      // define response from http package
      final response =
          await http.post(Uri.parse('url'), body: json.encode(body));
      // check reponse if equals 200 it mean success
      if (response.statusCode == 200) {
        return response.body;
      } else {
        // return
        return 400;
      }
    } catch (e) {
      return e;
    }
  }

  // sign-in
  Future signIN(Map body) async {
    try {
      // define response from http package
      final response =
          await http.post(Uri.parse('url'), body: json.encode(body));
      // check reponse if equals 200 it mean success
      if (response.statusCode == 200) {
        return response.body;
      } else {
        // return
        return 400;
      }
    } catch (e) {
      return e;
    }
  }

  // fetch all animals
  Future fetchAnimals() async {
    try {
      // define response from http package
      final response = await http.get(Uri.parse('url'));
      // check reponse if equals 200 it mean success
      if (response.statusCode == 200) {
        return response.body;
      } else {
        // return
        return 400;
      }
    } catch (e) {
      return e;
    }
  }
  // fetch all animals

  // section categories
  static Future<List<CategoryModel>?> fetchCategories() async {
    try {
      // define response from http package
      final response =
          await http.get(Uri.parse('${Constant.baseUrl}catogries'));
      // check reponse if equals 200 it mean success
      if (response.statusCode == 200) {
        var categoryModel = categoriesModelFromJson(response.body).data;
        return categoryModel;
      } else {
        // return
        return null;
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  static Future fetchMainCategories() async {
    try {
      // define response from http package
      final response =
          await http.get(Uri.parse('${Constant.baseUrl}SubCatogery'));
      // check reponse if equals 200 it mean success
      if (response.statusCode == 200) {
        return response.body;
      } else {
        // return
        return 400;
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  // sub categories
  static Future fetchSubCategories(int categoryID) async {
    try {
      // define response from http package
      final response = await http
          .get(Uri.parse(Constant.baseUrl + 'SubCatogery/index/$categoryID'));
      // check reponse if equals 200 it mean success
      if (response.statusCode == 200) {
        final subCategoryModel = subCategoryModelFromJson(response.body);
        return subCategoryModel.data;
      }
      return null;
    } catch (e) {
      return Future.error(e);
    }
  }

  // section banners
  static Future fetchBanners() async {
    try {
      // define response from http package
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
      // check reponse if equals 200 it mean success
      if (response.statusCode == 200) {
        return response.body;
      }
      return null;
    } catch (e) {
      return Future.error(e);
    }
  }
}
