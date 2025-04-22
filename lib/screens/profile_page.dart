import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background_page.png'),
            fit: BoxFit.cover,
          ),
        ),
         //Background Image /\

        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 60),
        child: Column(
          children: [ //Profile information card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: const [
                  Icon(Icons.account_circle, size: 60),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nurul Syuhada',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text('Nationality: Malaysian'),
                        Text('Email: nsy@gmail.com'),
                        Text('Phone num: 019 999 1234'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
              child: const Text('LOG OUT'),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                minimumSize: Size.fromHeight(50),
                side: const BorderSide(color: Colors.red),
              ),
              child: const Text(
                'DELETE ACCOUNT',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
