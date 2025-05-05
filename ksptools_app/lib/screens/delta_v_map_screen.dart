// lib/screens/delta_v_map_screen.dart
import 'package:flutter/material.dart';

class DeltaVMapScreen extends StatelessWidget {
  const DeltaVMapScreen({super.key});

  // --- Choose ONE of the following options ---

  // Option A: Network Image URL (Replace with a valid URL)
  final String imageUrl = 'https://wiki.kerbalspaceprogram.com/images/7/73/KerbinDeltaVMap.png'; // Example URL - find a good one!

  // Option B: Asset Image Path (Make sure you added it to pubspec.yaml)
  final String imagePath = 'assets/images/BwZpO4f.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delta-V Map'),
      ),
      body: Center(
        child: InteractiveViewer( // Allows zooming and panning
          panEnabled: true,
          boundaryMargin: const EdgeInsets.all(20),
          minScale: 0.5,
          maxScale: 4.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0), // Add padding around the image
            child:
              // --- Use the widget corresponding to your chosen option ---

              // Option A: Network Image
              // Image.network(
              //    imageUrl,
              //    fit: BoxFit.contain, // Adjust fit as needed
              //    loadingBuilder: (context, child, loadingProgress) {
              //      if (loadingProgress == null) return child;
              //      return Center(
              //        child: CircularProgressIndicator(
              //          value: loadingProgress.expectedTotalBytes != null
              //              ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
              //              : null,
              //        ),
              //      );
              //    },
              //    errorBuilder: (context, error, stackTrace) {
              //       return const Center(child: Text('Error loading map image. Check URL or network connection.'));
              //    },
              //  )

              // Option B: Asset Image
              
              Image.asset(
                imagePath,
                fit: BoxFit.contain, // Adjust fit as needed
                 errorBuilder: (context, error, stackTrace) {
                    return const Center(child: Text('Error loading map image. Check asset path and pubspec.yaml.'));
                 },
              )
            
          ),
        ),
      ),
    );
  }
}