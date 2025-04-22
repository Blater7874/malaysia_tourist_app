import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/home_page.dart';
import 'screens/tourism_places.dart';
import 'screens/leisure_page.dart';
import 'screens/adventurous_page.dart';
import 'screens/shopping_page.dart';
import 'screens/emergency_page.dart';
import 'screens/educational_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Malaysia Travel App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(), // ✅ Make sure this is HomePage
      routes: {
        '/home': (context) => HomeScreen(),
        '/places': (context) => TourismPlaces(),
        '/leisure': (context) => LeisurePage(),
        '/adventure': (context) => AdventurousPage(),
        '/shopping': (context) => ShoppingPage(),
        '/emergency': (context) => EmergencyPage(),
        '/education': (context) => EducationalPage(),
      },
    );
  }
}
