// lib/models/celestial_body.dart
class CelestialBody {
  final String name;
  final double gravityASL; // Surface gravity in m/s^2
  final double radius; // Equatorial radius in meters
  final double soiRadius; // Sphere of Influence radius in meters
  final bool hasAtmosphere;
  final double atmosphereHeight; // Height in meters where pressure > 0
  final double atmospherePressureASL; // Pressure at sea level in atm (Kerbin = 1)
  final String type; // e.g., 'Planet', 'Moon'
  final String? parentBody; // Name of the body it orbits, null for Kerbol
  final String description; // Short description

  const CelestialBody({
    required this.name,
    required this.gravityASL,
    required this.radius,
    required this.soiRadius,
    this.hasAtmosphere = false,
    this.atmosphereHeight = 0.0,
    this.atmospherePressureASL = 0.0,
    required this.type,
    this.parentBody,
    this.description = '',
  });

   // Helper to get gravity in 'g's (relative to Kerbin's 9.81 or 9.82 - use consistent value)
   double get gravityInG => gravityASL / 9.81; // Or use 9.82 if preferred KSP standard
}