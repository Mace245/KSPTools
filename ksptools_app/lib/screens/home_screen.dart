// lib/screens/home_screen.dart
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KSP Companion'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          _buildNavigationCard(
            context,
            icon: Icons.calculate,
            title: 'Delta-V Calculator',
            subtitle: 'Calculate stage Delta-V',
            routeName: '/calculator',
          ),
          const SizedBox(height: 10),
          _buildNavigationCard(
            context,
            icon: Icons.map,
            title: 'Delta-V Map',
            subtitle: 'View the planetary Delta-V map',
            routeName: '/map',
          ),
          const SizedBox(height: 10),
           _buildNavigationCard(
            context,
            icon: Icons.public,
            title: 'Celestial Bodies',
            subtitle: 'Info on planets and moons',
            routeName: '/bodies',
          ),
          const SizedBox(height: 10),
          _buildNavigationCard(
            context,
            icon: Icons.swap_horiz,
            title: 'Transfer Info',
            subtitle: 'Interplanetary transfer windows & Δv',
            routeName: '/transfers',
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationCard(BuildContext context,
      {required IconData icon,
      required String title,
      required String subtitle,
      required String routeName}) {
    return Card(
      elevation: 4.0,
      child: ListTile(
        leading: Icon(icon, size: 40.0, color: Theme.of(context).colorScheme.secondary),
        title: Text(title, style: Theme.of(context).textTheme.titleLarge),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
      ),
    );
  }
}