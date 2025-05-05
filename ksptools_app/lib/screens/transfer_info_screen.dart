// lib/screens/transfer_info_screen.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ksptools_app/data/transfer_data.dart';
import 'package:ksptools_app/models/transfer_info.dart';

class TransferInfoScreen extends StatelessWidget {
  const TransferInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat("#,##0", "en_US"); // No decimals for Dv

    return Scaffold(
      appBar: AppBar(
        title: const Text('Interplanetary Transfer Info'),
        actions: [
           Tooltip(
             message: 'Shows typical Δv and times for transfers.\nActual values depend on maneuver timing and efficiency.\nTransfer window planning tools are more precise.',
             child: IconButton(
               icon: const Icon(Icons.info_outline),
               onPressed: () {
                  // Could show a dialog explanation here too
               },
             ),
           )
        ],
      ),
      body: ListView.builder(
        itemCount: transferData.length,
        itemBuilder: (context, index) {
          final transfer = transferData[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${transfer.origin}  ➔  ${transfer.destination}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),
                  _buildTransferDetailRow(context, 'Ejection Burn (approx):', '${numberFormat.format(transfer.ejectionDv)} m/s'),
                   if(transfer.captureDv != null)
                     _buildTransferDetailRow(context, 'Capture Burn (approx):', '${numberFormat.format(transfer.captureDv)} m/s'),
                  _buildTransferDetailRow(context, 'Total Mission Δv (typical):', '${numberFormat.format(transfer.totalDv)} m/s'),
                  _buildTransferDetailRow(context, 'Est. Travel Time:', _formatDuration(transfer.travelTime)),
                  if (transfer.notes.isNotEmpty) ...[
                     const SizedBox(height: 8),
                     Text('Notes:', style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
                     Text(transfer.notes, style: Theme.of(context).textTheme.bodyMedium),
                  ]
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTransferDetailRow(BuildContext context, String label, String value) {
     return Padding(
       padding: const EdgeInsets.symmetric(vertical: 3.0),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Text(label, style: Theme.of(context).textTheme.bodyLarge),
           Text(value, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
         ],
       ),
     );
   }

   // Helper to format Duration nicely
    String _formatDuration(Duration duration) {
      if (duration.inDays > 1) {
        return '${duration.inDays} days';
      } else if (duration.inHours > 0) {
         return '${duration.inHours} hours';
      } else {
         return '${duration.inMinutes} minutes';
      }
    }
}