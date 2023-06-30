import 'package:flutter/material.dart';
import 'package:water_tank_mobile/Pages/HomePage/Pages/Account.dart';
import 'package:water_tank_mobile/Pages/HomePage/Pages/Cart.dart';
import 'package:water_tank_mobile/Pages/HomePage/Pages/Home.dart';
import 'package:water_tank_mobile/Pages/HomePage/Pages/Notification/Notification.dart' as N;
import 'package:water_tank_mobile/Pages/Widgets/BottomNavBArWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  static final List<Widget> _pages=[const Home(), Cart(), N.Notification(), const Account()];
  static final List<String> _pagesTitle=[
    "Company Name here",
    "Cart",
    "Notification",
    "Account",
  ];
  int index=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pagesTitle[index]),
        centerTitle: true,
      ),
      body: _pages[index],
      bottomNavigationBar:  BottomNavBar(onChanged: (int index) {
        setState(() {
          this.index=index;
        });
      },),
    );
  }
}
