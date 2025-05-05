// lib/models/transfer_info.dart
class TransferInfo {
  final String origin;
  final String destination;
  final double ejectionDv; // Approx Delta-V for ejection burn from low orbit
  final double? captureDv; // Approx Delta-V for capture burn into low orbit (can be null if aerobraking common)
  final double totalDv; // Approx total mission Dv (LKO -> L_Target_O)
  final Duration travelTime; // Approx travel time
  final String notes; // e.g., "Ideal Hohmann", "Aerobraking possible"

  const TransferInfo({
    required this.origin,
    required this.destination,
    required this.ejectionDv,
    this.captureDv,
    required this.totalDv,
    required this.travelTime,
    this.notes = '',
  });
}