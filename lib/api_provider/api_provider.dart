import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/shopping_categories.dart';
import '../models/shopping_model.dart';

class ApiProvider {
  final Dio _dio = Dio();
  static const shoppingHomeUrl = 'https://fakestoreapi.com/products';

  List<ShoppingHomeModel> _shoppingHome = [];

  Future<List<ShoppingHomeModel>> getShoppingItems() async {
    try {
      Response response = await _dio.get(shoppingHomeUrl);
      _shoppingHome.addAll(
          List.from(response.data).map((e) => ShoppingHomeModel.fromJson(e)));
      return _shoppingHome;
    } catch (e) {
      return [];
    }
  }

  Future<List<ShoppingHomeModel>> getShoppingItemsDetails(String id) async {
    try {
      Response response = await _dio.get('https://fakestoreapi.com/products/${id}');
      _shoppingHome.addAll(
          List.from(response.data).map((e) => ShoppingHomeModel.fromJson(e)));
      return _shoppingHome;
    } catch (e) {
      return [];
    }
  }

}