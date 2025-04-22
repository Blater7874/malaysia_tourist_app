// home_page.dart
import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'home_screen.dart'; // New
import 'currency_converter.dart';
import 'tourism_places.dart';
import 'emergency_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    CurrencyConverterPage(),
    TourismPlaces(),
    HomeScreen(),
    EmergencyPage(), // Now imported from home_screen.dart
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/background_page.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Background Image /\
          
          _pages.elementAt(_selectedIndex),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_exchange),
            label: 'Converter',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.place), label: 'Places'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Emergency'),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
