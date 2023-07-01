import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:water_tank_mobile/Data/Model/Company.dart';
import 'package:water_tank_mobile/Data/Model/Order.dart';
import 'package:water_tank_mobile/Data/Model/OrdersPagenated.dart';
import 'package:water_tank_mobile/Data/Model/Product.dart';
import 'package:water_tank_mobile/Data/Model/User.dart';
import 'package:water_tank_mobile/Data/Storage/LocalStorage.dart';
import 'package:water_tank_mobile/Data/Urls/Urls.dart';

import '../Data/Model/Token.dart';
class API
{
  static Future getHomeData()async
  {
    try{
      var result = await http.get(Uri.parse(AppUrls.home), headers: {'Content-Type': 'application/json; charset=UTF-8', 'accept':'*/*',"Authorization":"Bearer ${LocalStorage.getToken()}" },);
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
          headers: {'Content-Type': 'application/json; charset=UTF-8', 'accept':'*/*',"Authorization":"Bearer ${LocalStorage.getToken()}" },
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
          headers: {'Content-Type': 'application/json; charset=UTF-8', 'accept':'*/*' ,"Authorization":"Bearer ${LocalStorage.getToken()}"},
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
          headers: {'Content-Type': 'application/json; charset=UTF-8', 'accept':'*/*',"Authorization":"Bearer ${LocalStorage.getToken()}" },
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
      print(LocalStorage.getToken());
      var result = await http.get(Uri.parse(AppUrls.orderCompleted(limit: limit,page: page)),
          headers: {'Content-Type': 'application/json; charset=UTF-8', 'accept':'*/*',"Authorization":"Bearer ${LocalStorage.getToken()}" },
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
  static Future loginUser({required String phone,required String password})async
  {
    try{
      print(AppUrls.login);
      var result = await http.post(Uri.parse(AppUrls.login),
          headers: {'Content-Type': 'application/json; charset=UTF-8', 'accept':'*/*' },
        body: jsonEncode(
            {
              "phone" : phone,
              "password" : password
            }));

      print(result.statusCode);
      print(result.body);
      if(result.statusCode==200)
        {
          var r = jsonDecode(result.body);
          return  Token.fromJson(r);
        }
    }catch(e)
    {
    if (kDebugMode) {
      print(e);
    }
    }
  }
  static Future signUp({required String phone,required String address,required String name,required String password})async
  {
    try{
      print(AppUrls.signUp);
      var result = await http.post(Uri.parse(AppUrls.signUp),
          headers: {'Content-Type': 'application/json; charset=UTF-8', 'accept':'*/*' },
        body: jsonEncode(
            {
              "name": name,
              "address": address,
              "phone": phone,
              "password": password
            }));

      print(result.statusCode);
      print(result.body);
      if(result.statusCode==200)
        {
          var r = jsonDecode(result.body);
          return  User.fromJson(r);
        }
    }catch(e)
    {
    if (kDebugMode) {
      print(e);
    }
    }
  }
}