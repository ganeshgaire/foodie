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

// popular cuisines
 static Future<List<Item>> getPopularCuisines() async {
    var res = await http.get(ServerApi.popularCuisines);
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);
      List<Item> populars = [];
      for (var data in jsonData) {
        populars.add(Item.fromJson(data));
      }
      return populars;
    } else {
      throw "Can't get populars.";
    }
  }
  // foods by category
   static Future<List<Item>> getCategoryItems(categorySlug) async {
    var res = await http.get("${ServerApi.foodsByCategory}/$categorySlug");
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);
      List<Item> foodsByCategory = [];
      for (var data in jsonData['data']) {
        foodsByCategory.add(Item.fromJson(data));
      }
      return foodsByCategory;
    } else {
      throw "Can't get foods by category.";
    }
  }

// daddys special
 static Future<List<Item>> getSpecialFoods() async {
    var res = await http.get(ServerApi.specialFoods);
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);
      List<Item> specials = [];
      for (var data in jsonData['data']) {
        specials.add(Item.fromJson(data));
      }
      return specials;
    } else {
      throw "Can't get specials.";
    }
  }

  // get address
 static Future<List<Address>> getAddresses() async {
    var res = await http.get(ServerApi.deliveryAddresses);
    print(res.body);
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);
      List<Address> addresses = [];
      for (var data in jsonData['data']) {
        addresses.add(Address.fromJson(data));
      }
      return addresses;
    } else {
      throw "Can't get addresses.";
    }
  }
 
}
