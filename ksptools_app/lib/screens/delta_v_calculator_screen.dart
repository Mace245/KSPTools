// lib/screens/delta_v_calculator_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:ksptools_app/utils/calculations.dart';

class DeltaVCalculatorScreen extends StatefulWidget {
  const DeltaVCalculatorScreen({super.key});

  @override
  State<DeltaVCalculatorScreen> createState() => _DeltaVCalculatorScreenState();
}

class _DeltaVCalculatorScreenState extends State<DeltaVCalculatorScreen> {
  final _formKey = GlobalKey<FormState>();
  final _ispVacController = TextEditingController();
  final _ispAtmController = TextEditingController();
  final _wetMassController = TextEditingController();
  final _dryMassController = TextEditingController();

  double _deltaVVac = 0.0;
  double _deltaVAtm = 0.0;
  double _twrVac = 0.0; // Optional: Add Thrust input later for TWR
  double _twrAtm = 0.0; // Optional: Add Thrust input later for TWR

  final _numberFormat = NumberFormat("#,##0.0", "en_US");

  void _calculate() {
    if (_formKey.currentState!.validate()) {
      final double ispVac = double.tryParse(_ispVacController.text) ?? 0.0;
      final double ispAtm = double.tryParse(_ispAtmController.text) ?? 0.0;
      final double wetMass = double.tryParse(_wetMassController.text) ?? 0.0;
      final double dryMass = double.tryParse(_dryMassController.text) ?? 0.0;

      if (wetMass > 0 && dryMass > 0 && wetMass >= dryMass) {
         setState(() {
           // Calculate Delta V
           _deltaVVac = calculateDeltaV(ispVac, wetMass, dryMass);
           _deltaVAtm = calculateDeltaV(ispAtm, wetMass, dryMass);

           // TODO: Add Thrust input field and calculate TWR if needed
           // Example:
           // final double thrustVac = double.tryParse(_thrustVacController.text) ?? 0.0;
           // final double thrustAtm = double.tryParse(_thrustAtmController.text) ?? 0.0;
           // _twrVac = calculateTWR(thrustVac, wetMass, current_body_gravity);
           // _twrAtm = calculateTWR(thrustAtm, wetMass, current_body_gravity);
         });
      } else {
         setState(() {
            _deltaVVac = 0.0;
            _deltaVAtm = 0.0;
         });
         ScaffoldMessenger.of(context).showSnackBar(
           const SnackBar(content: Text('Invalid mass values. Wet mass must be >= Dry mass and both > 0.')),
         );
      }
    }
  }

   @override
   void dispose() {
     _ispVacController.dispose();
     _ispAtmController.dispose();
     _wetMassController.dispose();
     _dryMassController.dispose();
     super.dispose();
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delta-V Calculator'),
      ),
      body: SingleChildScrollView( // Allows scrolling on smaller screens
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildTextField(
                controller: _ispVacController,
                labelText: 'Vacuum Isp (s)',
                hintText: 'e.g., 345',
              ),
              const SizedBox(height: 12),
              _buildTextField(
                controller: _ispAtmController,
                labelText: 'Atmosphere (ASL) Isp (s)',
                 hintText: 'e.g., 290',
              ),
              const SizedBox(height: 12),
               _buildTextField(
                controller: _wetMassController,
                labelText: 'Wet Mass (tons)',
                hintText: 'Mass with fuel',
              ),
              const SizedBox(height: 12),
               _buildTextField(
                controller: _dryMassController,
                labelText: 'Dry Mass (tons)',
                 hintText: 'Mass without fuel',
              ),
              // TODO: Add Thrust Input field here if calculating TWR
              const SizedBox(height: 20),
              ElevatedButton.icon(
                icon: const Icon(Icons.calculate),
                label: const Text('Calculate'),
                onPressed: _calculate,
                 style: ElevatedButton.styleFrom(
                   padding: const EdgeInsets.symmetric(vertical: 12),
                   textStyle: Theme.of(context).textTheme.titleMedium,
                 ),
              ),
              const SizedBox(height: 24),
              const Divider(),
              const SizedBox(height: 16),
              Text('Results:', style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 12),
              _buildResultRow('Vacuum Δv:', '${_numberFormat.format(_deltaVVac)} m/s'),
              _buildResultRow('Atmosphere (ASL) Δv:', '${_numberFormat.format(_deltaVAtm)} m/s'),
               // Add more results like interpolated Δv or TWR here if implemented
               // _buildResultRow('TWR (Vac):', _numberFormat.format(_twrVac)),
               // _buildResultRow('TWR (ASL):', _numberFormat.format(_twrAtm)),

               // Example for interpolated Isp (requires pressure input/slider)
               // double pressureExample = 0.5; // Example: 50% pressure
               // double ispInterpolated = interpolateIsp(
               //   double.tryParse(_ispVacController.text) ?? 0.0,
               //   double.tryParse(_ispAtmController.text) ?? 0.0,
               //   pressureExample
               // );
               // double deltaVInterpolated = calculateDeltaV(ispInterpolated, ...);
               // _buildResultRow('Δv at ${pressureExample*100}% atm:', '${_numberFormat.format(deltaVInterpolated)} m/s'),

            ],
          ),
        ),
      ),
    );
  }

   Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: const OutlineInputBorder(),
        filled: true,
        // fillColor: Colors.white10, // Slightly lighter background for fields
      ),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
         FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')), // Allow numbers and one decimal point
      ],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a value';
        }
        if (double.tryParse(value) == null) {
           return 'Please enter a valid number';
        }
         if (double.parse(value) < 0) {
           return 'Value cannot be negative';
         }
        return null;
      },
    );
  }

   Widget _buildResultRow(String label, String value) {
     return Padding(
       padding: const EdgeInsets.symmetric(vertical: 6.0),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Text(label, style: Theme.of(context).textTheme.titleMedium),
           Text(value, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
         ],
       ),
     );
   }
}