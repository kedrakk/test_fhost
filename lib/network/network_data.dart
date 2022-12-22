import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/cat_fact.dart';
import '../model/prices.dart';

class NetworkData {
  var backEndURL = "https://dev-backend.fundex.com.sg";
  Future<MetalPrices> getMetalPrices() async {
    try {
      var url = Uri.parse("$backEndURL/home/getPrices");
      var response = await http.get(
        url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          "Access-Control-Allow-Origin":
              "*", // Required for CORS support to work
          "Access-Control-Allow-Credentials":
              'true', // Required for cookies, authorization headers with HTTPS
          "Access-Control-Allow-Headers":
              "Origin,Content-Type,Accept,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
          "Access-Control-Allow-Methods": "GET,PUT,PATCH,POST,DELETE"
        },
      );
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        return MetalPrices.fromJson(body);
      } else {
        throw Exception(response.body.toString());
      }
    } catch (exp) {
      throw Exception(exp.toString());
    }
  }

  Future<CatFact> getARandomCatFat() async {
    try {
      var url = Uri.parse("https://catfact.ninja/fact");
      var response = await http.get(
        url,
      );
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        return CatFact.fromJson(body);
      } else {
        throw Exception(response.body.toString());
      }
    } catch (exp) {
      throw Exception(exp.toString());
    }
  }
}
