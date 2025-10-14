import 'package:flutter/material.dart';

class PropertyTitleSection extends StatelessWidget {
  const PropertyTitleSection({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ],
    );
  }
}

class PropertyAddress extends StatelessWidget {
  const PropertyAddress({super.key, required this.city});

  final String city;

  @override
  Widget build(BuildContext context) {
    return Text(city, style: Theme.of(context).textTheme.bodyLarge?.copyWith());
  }
}

class PropertyPrice extends StatelessWidget {
  const PropertyPrice({super.key, required this.price});

  final String price;

  @override
  Widget build(BuildContext context) {
    return Text(
      price,
      style: Theme.of(
        context,
      ).textTheme.titleLarge!.copyWith(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green.shade600),
    );
  }
}