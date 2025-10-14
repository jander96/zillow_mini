
import 'package:flutter/material.dart';

class LocationButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LocationButton({super.key, required this.onPressed});

  @override
  Widget build(context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.location_on, color: Colors.blue, size: 20),
      label: const Text(
        'Locate on Map',
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      ),
    );
  }
}