import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:water_tank_mobile/Data/Storage/LocalStorage.dart';
import 'package:water_tank_mobile/Pages/HomePage/HomePage.dart';
import 'API/MyHttp.dart';
import 'Pages/SignInPage/SignInPage.dart';

const String programName="Nur-Hayot water";
void main() async {
  HttpOverrides.global = MyHttpOverrides();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: programName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:LocalStorage.getToken()==null?
      const SignInPage()
          :const HomePage(),
    );
  }
}
