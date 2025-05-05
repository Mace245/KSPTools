// lib/main.dart
import 'package:flutter/material.dart';
import 'package:ksptools_app/screens/home_screen.dart';
import 'package:ksptools_app/screens/delta_v_calculator_screen.dart';
import 'package:ksptools_app/screens/delta_v_map_screen.dart';
import 'package:ksptools_app/screens/celestial_body_list_screen.dart';
import 'package:ksptools_app/screens/transfer_info_screen.dart';


void main() {
  runApp(const KspCompanionApp());
}

class KspCompanionApp extends StatelessWidget {
  const KspCompanionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KSP Companion',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        brightness: Brightness.dark, // KSP vibes
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      // Define named routes for easy navigation
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/calculator': (context) => const DeltaVCalculatorScreen(),
        '/map': (context) => const DeltaVMapScreen(),
        '/bodies': (context) => const CelestialBodyListScreen(),
        // Detail screen route will be handled differently (passing arguments)
        '/transfers': (context) => const TransferInfoScreen(),
      },
    );
  }
}