// lib/utils/constants.dart

// Standard gravity (used in Tsiolkovsky equation with Isp in seconds)
// KSP uses 9.82 m/s^2 for Kerbin gravity, but standard g0 is often used in calcs.
// Let's stick to the standard physics constant unless specific KSP formula needs 9.82
const double G0 = 9.80665; // m/s^2