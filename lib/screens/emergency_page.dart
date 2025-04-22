import 'package:flutter/material.dart';

class EmergencyPage extends StatelessWidget {
  final List<Map<String, String>> contacts = [
    {'image': 'images/malaysia_emergency_services.png'},
    {'image': 'images/embassy_indonesia.png'},
  ];

  EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background_page.png'),
            fit: BoxFit.cover,
          ),
      ),
         //Background Image /\

      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Text(
              'Emergency Contacts',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ...contacts.map((contact) => _buildContactCard(contact)),
          ],
        ),
      ),
    ),
  );
}

  Widget _buildContactCard(Map<String, String> contact) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(contact['image']!, fit: BoxFit.cover),
      ),
    );
  }
}
