// lib/screens/celestial_body_list_screen.dart
import 'package:flutter/material.dart';
import 'package:ksptools_app/data/celestial_body_data.dart';
import 'package:ksptools_app/models/celestial_body.dart';
import 'package:ksptools_app/screens/celestial_body_detail_screen.dart'; // We'll create this next

class CelestialBodyListScreen extends StatelessWidget {
  const CelestialBodyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Optional: Sort bodies (e.g., Kerbol system outwards)
    // celestialBodies.sort((a, b) => /* Your sorting logic */ );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Celestial Bodies'),
      ),
      body: ListView.builder(
        itemCount: celestialBodies.length,
        itemBuilder: (context, index) {
          final body = celestialBodies[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            child: ListTile(
              leading: _getBodyIcon(body.type), // Simple icon based on type
              title: Text(body.name),
              subtitle: Text('${body.type}${body.parentBody != null ? " of ${body.parentBody}" : ""}'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CelestialBodyDetailScreen(body: body),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  // Simple function to return an icon based on body type
  Widget _getBodyIcon(String type) {
     IconData iconData;
     Color color = Colors.grey; // Default color
     switch (type) {
       case 'Star':
         iconData = Icons.wb_sunny;
         color = Colors.yellow.shade700;
         break;
       case 'Planet':
         iconData = Icons.public;
         color = Colors.blue.shade300; // Adjust as needed
         break;
       case 'Moon':
         iconData = Icons.brightness_3; // Represents a moon/night
         color = Colors.grey.shade400;
         break;
       default:
         iconData = Icons.help_outline;
     }
     return Icon(iconData, color: color, size: 36,);
  }
}