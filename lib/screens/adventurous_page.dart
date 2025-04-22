import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AdventurousPage extends StatelessWidget {
  final List<String> adventures = [
    'images/batu_caves.png',
    'images/eco_park.png',
    'images/adventure_park.png',
    'images/bukit_kiara.png',
    'images/skytrex.png',
  ];

  final List<String> urls = [
    'https://www.miradventures.com/guidedrockclimbingbatucavesmalaysia.html', // Example URL for Batu Caves
    'https://www.google.com/maps/place/KL+Forest+Eco+Park,+Jalan+Puncak,+Kuala+Lumpur,+50250+Kuala+Lumpur,+Federal+Territory+of+Kuala+Lumpur/@3.1542632,101.7020936,18z/data=!4m22!1m15!4m14!1m6!1m2!1s0x31cc482aee585291:0xfbc4735bd7fb9239!2sKL+Forest+Eco+Park!2m2!1d101.7045166!2d3.1542904!1m6!1m2!1s0x31cc482aee585291:0xfbc4735bd7fb9239!2sJalan+Puncak,+Kuala+Lumpur,+50250+Kuala+Lumpur,+Wilayah+Persekutuan+Kuala+Lumpur!2m2!1d101.7045166!2d3.1542904!3m5!1s0x31cc482aee585291:0xfbc4735bd7fb9239!8m2!3d3.1542904!4d101.7045166!16s%2Fg%2F11c3w0h_ns!5m1!1e1?entry=ttu&g_ep=EgoyMDI1MDQxNi4xIKXMDSoASAFQAw%3D%3D', // Example URL for Eco Park
    'https://www.waze.com/ul?ll=3.1373,101.6873&navigate=yes', // Example URL for Adventure Park
    'https://www.waze.com/ul?ll=3.1592,101.7185&navigate=yes', // Example URL for Bukit Kiara
    'https://www.waze.com/ul?ll=3.1702,101.7364&navigate=yes', // Example URL for Skytrex
  ];

  AdventurousPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adventurous'),
        backgroundColor: Colors.white24,
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: adventures.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigate to the page when an image is tapped
                _launchURL(urls[index]);
              },
              child: Container(
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
              ),
            );
          },
        ),
      ),
    );
  }

  // Method to launch URL
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
