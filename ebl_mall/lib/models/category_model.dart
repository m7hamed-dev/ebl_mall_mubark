// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

import 'dart:convert';

CategoriesModel categoriesModelFromJson(String str) =>
    CategoriesModel.fromJson(json.decode(str));

class CategoriesModel {
  CategoriesModel({
    required this.data,
  });

  List<CategoryModel> data;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        data: List<CategoryModel>.from(json["data"].map((x) => CategoryModel.fromJson(x))),
      );
}

class CategoryModel {
  CategoryModel({
    required this.id,
    required this.name,
    required this.code,
    required this.img,
    required this.miniImg,
    required this.time,
  });

  int id;
  String name;
  String code;
  String img;
  String miniImg;
  String time;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        img: json["img"],
        miniImg: json["mini_img"],
        time: json["time"],
      );
}
