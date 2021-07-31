// To parse this JSON data, do
//
// final subCategoryModel = subCategoryModelFromJson(jsonString);

import 'dart:convert';

SubCategoryModel subCategoryModelFromJson(String str) =>
    SubCategoryModel.fromJson(json.decode(str));

class SubCategoryModel {
  SubCategoryModel({
    required this.data,
  });

  List<SubCategory> data;

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      SubCategoryModel(
        data: List<SubCategory>.from(
            json["data"].map((x) => SubCategory.fromJson(x))),
      );
}

class SubCategory {
  SubCategory({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.type,
    required this.price,
    required this.priceTime,
    required this.time,
  });

  int id;
  String name;
  int categoryId;
  String type;
  String price;
  dynamic priceTime;
  String time;

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json["id"],
        name: json["name"],
        categoryId: json["category_id"],
        type: json["type"],
        price: json["price"],
        priceTime: json["price_time"],
        time: json["time"],
      );
}
