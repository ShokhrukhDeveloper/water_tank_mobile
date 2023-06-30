import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:water_tank_mobile/Data/Model/Company.dart';
import 'package:water_tank_mobile/Data/Model/Order.dart';
import 'package:water_tank_mobile/Data/Model/OrdersPagenated.dart';
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
  static Future createOrder({required int quantity,required int productId})async
  {
    try{
      var result = await http.post(Uri.parse(AppUrls.order(quantity: quantity, productId: productId)),
          headers: {'Content-Type': 'application/json; charset=UTF-8', 'accept':'*/*' },
      );
      print(AppUrls.order(quantity: quantity, productId: productId));
      print(result.statusCode);
      print(result.body);
      if(result.statusCode==200)
        {

          var r = jsonDecode(result.body);
          print(r);
              return  Order.fromJson(r);
        }
    }catch(e)
    {
    if (kDebugMode) {
      print(e);
    }
    }
  }
  static Future getCreatedOrder({ int limit=10,int page=1})async
  {
    try{
      var result = await http.get(Uri.parse(AppUrls.orderCreated(limit: limit,page: page)),
          headers: {'Content-Type': 'application/json; charset=UTF-8', 'accept':'*/*' },
      );

      print(result.statusCode);
      print(result.body);
      if(result.statusCode==200)
        {
          var r = jsonDecode(result.body);
              return  OrdersPagenated.fromJson(r);
        }
    }catch(e)
    {
    if (kDebugMode) {
      print(e);
    }
    }
  }
  static Future getDeliveringOrder({ int limit=10,int page=1})async
  {
    try{
      var result = await http.get(Uri.parse(AppUrls.orderDelivering(limit: limit,page: page)),
          headers: {'Content-Type': 'application/json; charset=UTF-8', 'accept':'*/*' },
      );

      print(result.statusCode);
      print(result.body);
      if(result.statusCode==200)
        {
          var r = jsonDecode(result.body);
              return  OrdersPagenated.fromJson(r);
        }
    }catch(e)
    {
    if (kDebugMode) {
      print(e);
    }
    }
  }
  static Future getCompletedOrder({int limit=10,int page=1})async
  {
    try{
      var result = await http.get(Uri.parse(AppUrls.orderCompleted(limit: limit,page: page)),
          headers: {'Content-Type': 'application/json; charset=UTF-8', 'accept':'*/*' },
      );

      print(result.statusCode);
      print(result.body);
      if(result.statusCode==200)
        {
          var r = jsonDecode(result.body);
          return  OrdersPagenated.fromJson(r);
        }
    }catch(e)
    {
    if (kDebugMode) {
      print(e);
    }
    }
  }
}