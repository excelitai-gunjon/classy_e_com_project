import 'dart:convert';

import 'package:flutter/cupertino.dart';
/// message : "All Categories"
/// categories : [{"id":1,"category_name":"Fashion","category_slug_name":"fashion","category_icon":"Fashion","created_at":null,"updated_at":"2022-01-04T07:05:07.000000Z"},{"id":2,"category_name":"Electronics","category_slug_name":"electronics","category_icon":"electronics","created_at":null,"updated_at":"2021-10-27T07:46:43.000000Z"},{"id":3,"category_name":"Sports","category_slug_name":"sports","category_icon":"sports","created_at":null,"updated_at":"2021-10-27T07:46:49.000000Z"},{"id":4,"category_name":"Mobile","category_slug_name":"mobile","category_icon":"mobile","created_at":null,"updated_at":"2021-10-27T07:47:16.000000Z"},{"id":5,"category_name":"Laptop","category_slug_name":"laptop","category_icon":"laptop","created_at":null,"updated_at":"2021-10-27T07:47:23.000000Z"},{"id":6,"category_name":"Fruit","category_slug_name":"fruit","category_icon":"fruit","created_at":null,"updated_at":"2021-10-27T07:47:30.000000Z"},{"id":7,"category_name":"Motor Bike","category_slug_name":"motor-bike","category_icon":"bike","created_at":null,"updated_at":"2021-10-27T07:47:36.000000Z"},{"id":8,"category_name":"Shoes","category_slug_name":"shoes","category_icon":"shoes","created_at":null,"updated_at":null}]

AllCategoryModel allCategoryModelFromJson(String str) => AllCategoryModel.fromJson(json.decode(str));
String allCategoryModelToJson(AllCategoryModel data) => json.encode(data.toJson());
class AllCategoryModel with ChangeNotifier{
  AllCategoryModel({
      String? message, 
      List<Categories>? categories,}){
    _message = message;
    _categories = categories;
}

  AllCategoryModel.fromJson(dynamic json) {
    _message = json['message'];
    if (json['categories'] != null) {
      _categories = [];
      json['categories'].forEach((v) {
        _categories?.add(Categories.fromJson(v));
      });
      notifyListeners();
    }
  }

  String? _message;
  List<Categories>? _categories;

  String? get message => _message;
  List<Categories>? get categories => _categories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_categories != null) {
      map['categories'] = _categories?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// category_name : "Fashion"
/// category_slug_name : "fashion"
/// category_icon : "Fashion"
/// created_at : null
/// updated_at : "2022-01-04T07:05:07.000000Z"

Categories categoriesFromJson(String str) => Categories.fromJson(json.decode(str));
String categoriesToJson(Categories data) => json.encode(data.toJson());
class Categories {
  Categories({
      int? id, 
      String? categoryName, 
      String? categorySlugName, 
      String? categoryIcon, 
      dynamic createdAt, 
      String? updatedAt,}){
    _id = id;
    _categoryName = categoryName;
    _categorySlugName = categorySlugName;
    _categoryIcon = categoryIcon;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Categories.fromJson(dynamic json) {
    _id = json['id'];
    _categoryName = json['category_name'];
    _categorySlugName = json['category_slug_name'];
    _categoryIcon = json['category_icon'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _categoryName;
  String? _categorySlugName;
  String? _categoryIcon;
  dynamic _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get categoryName => _categoryName;
  String? get categorySlugName => _categorySlugName;
  String? get categoryIcon => _categoryIcon;
  dynamic get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['category_name'] = _categoryName;
    map['category_slug_name'] = _categorySlugName;
    map['category_icon'] = _categoryIcon;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}