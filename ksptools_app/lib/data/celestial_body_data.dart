// lib/data/celestial_body_data.dart
import 'package:ksptools_app/models/celestial_body.dart';

// Data primarily from KSP Wiki. Double-check for accuracy.
// Gravity based on 1 Kerbin g = 9.81 m/s^2
final List<CelestialBody> celestialBodies = [
  const CelestialBody(
    name: 'Kerbol',
    gravityASL: 1.77 * 9.81, // Calculated for radius - it's huge! Use low orbit gravity if needed
    radius: 261600000, // meters
    soiRadius: double.infinity, // Effectively infinite within the system
    type: 'Star',
    description: 'The star at the center of the Kerbol system.',
  ),
  const CelestialBody(
    name: 'Kerbin',
    gravityASL: 9.81, // 1g
    radius: 600000, // meters
    soiRadius: 84159286,
    hasAtmosphere: true,
    atmosphereHeight: 70000,
    atmospherePressureASL: 1.0, // atm
    type: 'Planet',
    parentBody: 'Kerbol',
    description: 'The home planet of the Kerbals.',
  ),
  const CelestialBody(
    name: 'Mun',
    gravityASL: 1.63, // 0.166 g
    radius: 200000,
    soiRadius: 2429559.1,
    hasAtmosphere: false,
    type: 'Moon',
    parentBody: 'Kerbin',
    description: 'Kerbin\'s closest and largest moon.',
  ),
   const CelestialBody(
    name: 'Minmus',
    gravityASL: 0.491, // 0.05 g
    radius: 60000,
    soiRadius: 2247428.4,
    hasAtmosphere: false,
    type: 'Moon',
    parentBody: 'Kerbin',
    description: 'Kerbin\'s smaller, mint-colored moon in an inclined orbit.',
  ),
   const CelestialBody(
    name: 'Duna',
    gravityASL: 2.94, // 0.3 g
    radius: 320000,
    soiRadius: 47921949,
    hasAtmosphere: true,
    atmosphereHeight: 50000,
    atmospherePressureASL: 0.2, // atm (thin atmosphere)
    type: 'Planet',
    parentBody: 'Kerbol',
    description: 'The red planet, similar to Mars.',
  ),
  const CelestialBody(
    name: 'Ike',
    gravityASL: 1.10, // 0.112 g
    radius: 130000,
    soiRadius: 1049598.9,
    hasAtmosphere: false,
    type: 'Moon',
    parentBody: 'Duna',
    description: 'Duna\'s large, captured asteroid-like moon.',
  ),
  // --- ADD MORE BODIES HERE ---
  // Eve, Gilly, Moho, Dres, Jool, Laythe, Vall, Tylo, Bop, Pol, Eeloo
  // Remember to source data carefully from KSP Wiki or reliable sources.
];