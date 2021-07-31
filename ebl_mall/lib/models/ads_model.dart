// To parse this JSON data, do
//
//     final adsModel = adsModelFromJson(jsonString);

import 'dart:convert';

AdsModel adsModelFromJson(String str) => AdsModel.fromJson(json.decode(str));

class AdsModel {
  AdsModel({
    required this.data,
  });

  final List<Datum> data;

  factory AdsModel.fromJson(Map<String, dynamic> json) => AdsModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        categoryId: json["category_id"],
        type: json["type"],
        price: json["price"],
        priceTime: json["price_time"],
        time: json["time"],
      );
}
