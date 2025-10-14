import 'package:flutter/material.dart';

class PropertyAmenitiesSection extends StatefulWidget {
  final List<Map<String, dynamic>> amenities;

  const PropertyAmenitiesSection({super.key, required this.amenities});

  @override
  State<PropertyAmenitiesSection> createState() => _PropertyAmenitiesSectionState();
}

class _PropertyAmenitiesSectionState extends State<PropertyAmenitiesSection> {
  bool _showAllAmenities = false;

  @override
  Widget build(BuildContext context) {
    final displayedAmenities = _showAllAmenities ? widget.amenities : widget.amenities.take(5).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Amenities',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 10),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: displayedAmenities.map((amenity) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                children: [
                  Icon(amenity['icon'] as IconData, color: Colors.grey.shade600, size: 20),
                  const SizedBox(width: 10),
                  Text(amenity['name'] as String, style: const TextStyle(fontSize: 16, color: Colors.black87)),
                ],
              ),
            );
          }).toList(),
        ),


        if (widget.amenities.length > 5 && !_showAllAmenities)
          TextButton(
            onPressed: () {
              setState(() {
                _showAllAmenities = true;
              });
            },
            child: const Text(
              'Load more',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ),
      ],
    );
  }
}