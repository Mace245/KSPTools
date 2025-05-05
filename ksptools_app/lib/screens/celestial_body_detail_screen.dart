// lib/screens/celestial_body_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ksptools_app/models/celestial_body.dart';

class CelestialBodyDetailScreen extends StatelessWidget {
  final CelestialBody body;

  const CelestialBodyDetailScreen({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat("#,##0.0", "en_US");
    final largeNumFormat = NumberFormat("0.##E0", "en_US"); // For radius, SOI

    return Scaffold(
      appBar: AppBar(
        title: Text(body.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(body.name, style: Theme.of(context).textTheme.headlineMedium),
            Text(
              '${body.type}${body.parentBody != null ? " orbiting ${body.parentBody}" : ""}',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey.shade400),
            ),
             if (body.description.isNotEmpty) ...[
               const SizedBox(height: 12),
               Text(body.description, style: Theme.of(context).textTheme.bodyLarge),
             ],
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            Text('Physical Characteristics:', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 12),
            _buildDetailRow('Surface Gravity (ASL):', '${numberFormat.format(body.gravityASL)} m/s² (${numberFormat.format(body.gravityInG)} g)'),
            _buildDetailRow('Equatorial Radius:', '${largeNumFormat.format(body.radius)} m'),
            _buildDetailRow('Sphere of Influence (SOI):', body.soiRadius.isFinite ? '${largeNumFormat.format(body.soiRadius)} m' : 'N/A'),
            const SizedBox(height: 16),

            if (body.hasAtmosphere) ...[
              Text('Atmosphere:', style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 12),
              _buildDetailRow('Presence:', 'Yes'),
              _buildDetailRow('Height:', '${largeNumFormat.format(body.atmosphereHeight)} m'),
               _buildDetailRow('Pressure (ASL):', '${numberFormat.format(body.atmospherePressureASL)} atm'),
            ] else ... [
               Text('Atmosphere:', style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 12),
              _buildDetailRow('Presence:', 'No'),
            ],
            const SizedBox(height: 20),
            // Optional: Add button to view on KSP Wiki
            // Center(
            //   child: ElevatedButton.icon(
            //     icon: const Icon(Icons.open_in_new),
            //     label: Text('View ${body.name} on KSP Wiki'),
            //     onPressed: _launchWikiUrl, // Implement _launchWikiUrl using url_launcher
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 16)),
          Flexible( // Allow text wrapping for long values
             child: Text(
               value,
               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
               textAlign: TextAlign.end, // Align value to the right
             ),
          ),
        ],
      ),
    );
  }

  // TODO: Implement wiki link launching if needed
  // void _launchWikiUrl() async {
  //   final Uri url = Uri.parse('https://wiki.kerbalspaceprogram.com/wiki/${body.name}'); // Basic URL structure
  //   if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
  //     // Handle error, e.g., show a snackbar
  //     print('Could not launch $url');
  //   }
  // }
}