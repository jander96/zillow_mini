import 'dart:math';

import 'package:flutter/material.dart';

class PropertySpecifications extends StatelessWidget {
  const PropertySpecifications({super.key, required this.bedrooms, required this.bathrooms});
  final int bedrooms;
  final int bathrooms;


  @override
  Widget build(BuildContext context) {
    Widget specItem(String value, String label) {
      return Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSurface),
            ),
            Text(label, style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 14, color: Colors.grey)),
          ],
        ),
      );
    }

    const dot = Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Icon(Icons.circle, size: 5, color: Colors.grey),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Specifications',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 10),
        Row(
          children: <Widget>[
            specItem(bedrooms.toString(), 'Beds'),
            dot,
            specItem(bathrooms.toString(), 'Baths'),
            dot,
            Text(
              '${(Random().nextDouble() * 10000).toStringAsFixed(2)} Approx. Sq. Ft.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
          ],
        ),
      ],
    );
  }
}