import 'dart:convert';
import 'package:foodie/models/models.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'package:foodie/api/serverapi.dart';

class DataServer {
  static Future<http.Response> register({body}) {
    return http.post(
      ServerApi.registerApi,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }

  static Future<List<Category>> fetchCategories() async {
    var res = await http.get(ServerApi.categoriesApi);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Category> categories = body
          .map(
            (dynamic item) => Category.fromJson(item),
          )
          .toList();

      return categories;
    } else {
      throw "Can't get categories.";
    }
  }
}
