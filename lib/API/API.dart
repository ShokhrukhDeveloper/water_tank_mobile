import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:water_tank_mobile/Data/Model/Company.dart';
import 'package:water_tank_mobile/Data/Model/Product.dart';
import 'package:water_tank_mobile/Data/Urls/Urls.dart';
class API
{
  static Future getHomeData()async
  {
    try{
      var result = await http.get(Uri.parse(AppUrls.home));
      if(result.statusCode==200)
        {
          var r = jsonDecode(result.body);
          if(r is List)
            {
              return  r.map((e) => Product.fromJson(e)).toList();
            }
          return result.body;
        }
    }catch(e)
    {
    if (kDebugMode) {
      print(e);
    }
    }
  }
  static Future getCompanyData()async
  {
    try{
      var result = await http.get(Uri.parse(AppUrls.company));
      if(result.statusCode==200)
        {
          var r = jsonDecode(result.body);
              return  Company.fromJson(r);
        }
    }catch(e)
    {
    if (kDebugMode) {
      print(e);
    }
    }
  }
}