//MENU MODEL

import 'dart:convert';

import 'package:equatable/equatable.dart';

List<MenuModel> menuModelFromJson(String str) =>
    List<MenuModel>.from(json.decode(str).map((x) => MenuModel.fromJson(x)));

String menuModelToJson(List<MenuModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MenuModel extends Equatable {
  const MenuModel({
    required this.id,
    required this.name,
    this.cover,
    required this.desc,
    required this.price,
  });

  final int id;
  final String name;
  final String? cover;
  final String desc;
  final int price;

  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
        id: json["id"],
        name: json["name"],
        cover: json["cover"],
        desc: json["desc"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "cover": cover,
        "desc": desc,
        "price": price,
      };

  @override
  List<Object?> get props => [
        id,
        name,
        cover,
        desc,
        price,
      ];
}
