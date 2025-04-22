import 'package:flutter/material.dart';

class ShoppingPage extends StatelessWidget {
  // List of images for the educational places
  final List<String> educationalPlaces = [
    'images/pavilion.png', // Changed from images/ to assets/
    'images/suria_klcc.png',
    'images/berjaya_ts.png',
    'images/central_market.png',
    'images/petaling_street.png',
  ];

  ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping Places"),
        backgroundColor: Colors.white24,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background_page.png'),
            fit: BoxFit.cover,
          ),
        ),

        // Background Image /\
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: educationalPlaces.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Column(
                          children: [
                            Image.asset(
                              educationalPlaces[index],
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                // Placeholder widget when image fails to load
                                return Container(
                                  width: double.infinity,
                                  height: 200,
                                  color: Colors.grey[300],
                                  child: const Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.image_not_supported,
                                          size: 50,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          'Image not available',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [const SizedBox(height: 4)],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
