import 'dart:convert';
import 'package:foodie/models/models.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:foodie/api/serverapi.dart';

class DataServer {
static Future<void> register({var body}) async {
  print(ServerApi.registerApi);
  const Map<String, String> header = {
  'Content-type': 'application/json',
  'Accept': 'application/json',
};
  return http.post(ServerApi.registerApi, body: body,headers: header).then((http.Response response) {
    print(response.body);
    final int statusCode = response.statusCode;

    if (statusCode == 200) {
           
    } else {
            throw new Exception("Error while fetching data");
    }
  });
}

static Future<void> verifyOtp({var body}) async {
  print(ServerApi.verifyOtp);
  const Map<String, String> header = {
  'Content-type': 'application/json',
  'Accept': 'application/json',
};
  return http.post(ServerApi.verifyOtp, body:body,headers: header).then((http.Response response) {
    print(response.body);
    final int statusCode = response.statusCode;

    if (statusCode == 200) {
           print("success ${response.body}");
    } else {
            throw new Exception("Error while fetching data");
    }
  });
}

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
