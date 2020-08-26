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
}
