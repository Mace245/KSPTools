// lib/data/transfer_data.dart
import 'package:ksptools_app/models/transfer_info.dart';

// Approximate data for ideal transfers (Hohmann-like).
// Source from reliable KSP Delta-V maps or wiki pages.
// Units: Delta-V in m/s, Time in days.
final List<TransferInfo> transferData = [
   const TransferInfo(
     origin: 'Kerbin (LKO 80km)',
     destination: 'Mun (Low Orbit)',
     ejectionDv: 860,
     captureDv: 210, // Capture + circularization
     totalDv: 3400 + 860 + 210 + 580, // LKO -> Mun encounter -> Mun Orbit -> Mun Landing (Example total, adjust as needed)
     travelTime: Duration(hours: 6), // Very approx
     notes: 'Includes ~3400 to LKO. Landing Δv ~580 m/s.',
   ),
   const TransferInfo(
     origin: 'Kerbin (LKO 80km)',
     destination: 'Minmus (Low Orbit)',
     ejectionDv: 930, // To encounter
     captureDv: 160, // Capture + circularization
     totalDv: 3400 + 930 + 160 + 180, // LKO -> Minmus encounter -> Minmus Orbit -> Minmus Landing (Example total)
     travelTime: Duration(days: 4), // Very approx
     notes: 'Includes ~3400 to LKO. Landing Δv ~180 m/s. Plane change needed (~30-200 m/s).',
   ),
   const TransferInfo(
     origin: 'Kerbin (LKO 80km)',
     destination: 'Duna (Low Orbit)',
     ejectionDv: 1060, // Approx ejection from LKO for Duna intercept
     captureDv: 360,  // Capture + circularization at Duna (can be reduced with aerobraking)
     totalDv: 3400 + 1060 + 250 + 360, // LKO -> Duna Intercept -> Course Correction -> Duna Capture -> Duna Orbit
     travelTime: Duration(days: 270), // Approx Hohmann time
     notes: 'Includes ~3400 to LKO. Aerobraking at Duna highly recommended. Landing Δv ~1450 (parachute assisted). Mid-course correction ~250.',
   ),
   const TransferInfo(
     origin: 'Kerbin (LKO 80km)',
     destination: 'Eve (Low Orbit)',
     ejectionDv: 1100, // Approx ejection from LKO for Eve intercept
     captureDv: 1350, // High gravity capture (can be reduced with aerobraking)
     totalDv: 3400 + 1100 + 150 + 1350, // LKO -> Eve Intercept -> Course Correction -> Eve Capture -> Eve Orbit
     travelTime: Duration(days: 180), // Approx Hohmann time
     notes: 'Includes ~3400 to LKO. Aerobraking possible but dangerous due to thick atm. Landing easy, ASCENT VERY HARD (~11500 Δv from ASL).',
   ),
   // --- ADD MORE TRANSFER DATA ---
   // Kerbin -> Jool, Duna -> Kerbin, etc.
   // Specify origin/destination orbits clearly (e.g., LKO, High Orbit, ASL)
];