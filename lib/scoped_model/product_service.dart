import 'package:dio/dio.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:prent/model/products_model.dart';
import 'dart:convert';


class ProductModel extends Model {
  Products _products;
  Dio dio = Dio();

  Future<Response<dynamic>> getCats() async {
    dio.options.baseUrl = 'http://p-prent.com/api';
    return await dio.get('/home');
  }

  Future<Products> loadCategoriesResponse() async {
    var jsonString, jsonResponse;
    jsonString = await getCats();
    jsonResponse = json.decode(jsonString.toString());
    if (jsonString.statusCode >= 200 && jsonString.statusCode < 300) {
      _products = Products.fromJson(jsonResponse);
      return _products;
    } else {
      return _products;
    }
  }
}