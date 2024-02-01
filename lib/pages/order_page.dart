
import 'package:flutter/material.dart';
import "package:flutte_app/pages/order_list.dart";
import "package:flutte_app/pages/home_page.dart";
import "package:flutte_app/pages/settings_page.dart";


class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  int _selectedIndex = 0;
  final List _bottomNavBarItems = ["Anasayfa", "Siparişler", "Settings"];

  void _navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = [
    HomePage(),
    OrderListPage(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_bottomNavBarItems[_selectedIndex], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),), backgroundColor: Colors.orange,),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Anasayfa", //Home Page
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delivery_dining),
            label: "Siparişler",
          ), // Order Page
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}