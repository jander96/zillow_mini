
import 'package:flutter/material.dart';
import 'package:zillow_mini/src/core/presenter/extensions/context_extensions.dart';

class LocationButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LocationButton({super.key, required this.onPressed});

  @override
  Widget build(context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.location_on, color: Colors.blue, size: 20),
      label:  Text(
        context.l10n.locateOnMap,
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      ),
    );
  }
}