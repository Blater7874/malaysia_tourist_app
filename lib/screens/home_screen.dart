import 'package:flutter/material.dart';
import 'currency_converter.dart'; // fungsi untuk gambar mall

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background_page.png'),
            fit: BoxFit.cover,
        ),
      ),
      // Background Image /\

      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with user icon and welcome message
            Row(
              children: const [
                Icon(Icons.account_circle_outlined, size: 32),
                SizedBox(width: 10),
                Text(
                  'Welcome, Nurul.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // "Eager to Explore?" Section
            const Text(
              'Eager to Explore?',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Image with navigation to CurrencyConverterPage
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CurrencyConverterPage(),
                  ), // Navigate to CurrencyConverterPage
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'images/central_market.png',
                ), // Ensure correct asset path
              ),
            ),
            const SizedBox(height: 8),
            const SizedBox(height: 24),

            // "Craving for Malaysian food?" Section
            const Text(
              'Craving for Malaysian food?',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Display the Nasi Lemak image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'images/nasi_lemak.png',
              ), // Ensure correct asset path
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
      ),
    );
  }
}
