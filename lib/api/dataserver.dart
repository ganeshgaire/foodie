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

  // // popular cuisines
  // static Future<List> popularCuisines() async {
  //   var res = await http.get(ServerApi.popularCuisines);
  //   print(res.body);
  //   if (res.statusCode == 200) {
  //     var popularcuisines = jsonDecode(res.body);

  //     // List<PopularCuisine> categories = [];
  //     // for (var data in jsonData) {
  //     //   categories.add(Category.fromJson(data));
  //     // }

  //     return popularcuisines;
  //   } else {
  //     throw "Can't get popularcuisines.";
  //   }
  // }
}
