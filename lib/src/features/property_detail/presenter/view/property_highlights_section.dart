import 'package:flutter/material.dart';
import 'package:zillow_mini/src/core/presenter/extensions/context_extensions.dart';

class PropertyHighlightsSection extends StatelessWidget {
  const PropertyHighlightsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
         Text(
          context.l10n.highlights,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 10),
        const Wrap(
          spacing: 15.0,
          runSpacing: 5.0,
          children: [
            Text('Cafeteria', style: TextStyle(fontSize: 16)),
            Text('Intercom', style: TextStyle(fontSize: 16)),
            Text('Unisex Salon', style: TextStyle(fontSize: 16)),
          ],
        ),
      ],
    );
  }
}