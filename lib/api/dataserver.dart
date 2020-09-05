import 'dart:convert';
import 'package:foodie/models/models.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:foodie/api/serverapi.dart';

class DataServer {

//fetch categories
  static Future<List<Category>> fetchCategories() async {
    var res = await http.get(ServerApi.categoriesApi);
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);

      List<Category> categories = [];
      for (var data in jsonData) {
        categories.add(Category.fromJson(data));
      }
      return categories;
    } else {
      throw "Can't get categories.";
    }
  }
}
