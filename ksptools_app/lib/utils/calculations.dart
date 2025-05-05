// lib/utils/calculations.dart
import 'dart:math';
import 'package:ksptools_app/utils/constants.dart';

/// Calculates Delta-V using the Tsiolkovsky rocket equation.
/// Isp (Specific Impulse) is in seconds.
/// m_initial is the total mass (wet mass).
/// m_final is the final mass (dry mass).
double calculateDeltaV(double isp, double mInitial, double mFinal) {
  if (isp <= 0 || mInitial <= 0 || mFinal <= 0 || mInitial < mFinal) {
    return 0.0; // Invalid input
  }
  return isp * G0 * log(mInitial / mFinal);
}

/// Linearly interpolates Isp based on atmospheric pressure (0.0 = vacuum, 1.0 = sea level).
double interpolateIsp(double ispVac, double ispAtm, double pressure) {
   if (pressure <= 0.0) return ispVac; // Vacuum
   if (pressure >= 1.0) return ispAtm; // Sea Level or denser
   return ispAtm + (ispVac - ispAtm) * (1.0 - pressure);
}