import 'package:flutter/material.dart';
import 'adventurous_page.dart'; // Ensure these pages are correctly imported
import 'educational_page.dart';
import 'shopping_page.dart';
import 'leisure_page.dart';

class TourismPlaces extends StatelessWidget {
  const TourismPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'images/background_page.png',
          ), // Background image path
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Lighten the background with a transparent overlay
          Container(
            color: Colors.white.withOpacity(
              0.4,
            ), // Adjust opacity for lighter background
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Tourism places suggestion.',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdventurousPage(),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'images/adventurous.png', // Ensure correct asset path
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EducationalPage(),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'images/educational.png', // Ensure correct asset path
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ShoppingPage()),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'images/shopping.png', // Ensure correct asset path
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LeisurePage()),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'images/leisure.png', // Ensure correct asset path
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
