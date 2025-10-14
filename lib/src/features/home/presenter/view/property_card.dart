import 'package:flutter/material.dart';
import 'package:zillow_mini/src/core/presenter/models/property_ui.dart';

class PropertyCard extends StatelessWidget {
  const PropertyCard({super.key, required this.property, required this.onTap});
  final PropertyUI property;
  final ValueChanged<PropertyUI> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(property),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.album),
              title: Text(property.title),
              subtitle: Text(property.formatedPrice),
            ),]
        )
      ),
    );
  }
}
