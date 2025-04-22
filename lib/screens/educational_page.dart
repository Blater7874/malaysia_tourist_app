import 'package:flutter/material.dart';

class EducationalPage extends StatelessWidget {
  final List<String> adventures = [
    'images/batu_caves.png',
    'images/eco_park.png',
    'images/adventure_park.png',
    'images/bukit_kiara.png',
    'images/skytrex.png',
  ];

  EducationalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Educational Places'),
        backgroundColor: Colors.white24,
      ),
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
          SafeArea(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: adventures.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 24),
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(adventures[index], fit: BoxFit.contain),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
