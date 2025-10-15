import 'package:flutter/material.dart';
import 'package:zillow_mini/src/core/presenter/models/property_ui.dart';
import 'package:zillow_mini/src/features/favorites/presenter/view/favorite_icon.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PropertyCard extends StatelessWidget {
  const PropertyCard({super.key, required this.propertyUI, required this.onTap});

  final PropertyUI propertyUI;
  final ValueChanged<PropertyUI> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(propertyUI),
      child: Card(
        margin: const EdgeInsets.all(12.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            PropertyImage(imageUrl: propertyUI.image, propertyId: propertyUI.id),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _TitleAndPrice(title: propertyUI.title, price: propertyUI.formatedPrice),
                  const SizedBox(height: 5),
                  _Subtitle(subtitle: propertyUI.city),
                  Divider(
                    height: 16,
                    thickness: 1,
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.1),
                  ),
                  _FacilitiesGroup(
                    bedrooms: propertyUI.bedrooms,
                    bathrooms: propertyUI.bathrooms,
                    laundryRooms: propertyUI.laundryRoom,
                    otherFacilities: propertyUI.otherFacilities,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PropertyImage extends StatelessWidget {
  const PropertyImage({super.key, required this.imageUrl, required this.propertyId});

  final String imageUrl;
  final String propertyId;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            cacheKey: imageUrl,
            height: 250,
            fit: BoxFit.cover,
            width: double.infinity,
            placeholder: (context, url) => Center(child: CircularProgressIndicator.adaptive(strokeWidth: 1)),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),

        Positioned(top: 10, right: 10, child: AnimatedFavoriteIconProvider(propertyId: propertyId)),
      ],
    );
    ;
  }
}

class _TitleAndPrice extends StatelessWidget {
  const _TitleAndPrice({super.key, required this.title, required this.price});

  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          price,
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green.shade600),
        ),
      ],
    );
  }
}

class _Subtitle extends StatelessWidget {
  const _Subtitle({super.key, required this.subtitle});

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[Text(subtitle)]);
    ;
  }
}

class _FacilitiesGroup extends StatelessWidget {
  const _FacilitiesGroup({
    super.key,
    required this.bedrooms,
    required this.bathrooms,
    required this.laundryRooms,
    required this.otherFacilities,
  });

  final int bedrooms;
  final int bathrooms;
  final int laundryRooms;
  final int otherFacilities;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _FacilityItem(icon: Icons.bed_outlined, label: '$bedrooms Bedroom'),
        _FacilityItem(icon: Icons.bathtub_outlined, label: '$bedrooms Bathroom'),
        _FacilityItem(icon: Icons.local_laundry_service_outlined, label: '$laundryRooms Laundry Room'),
        _OtherFacilitiesButton(count: otherFacilities),
      ],
    );
  }
}

class _FacilityItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _FacilityItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(icon, color: Theme.of(context).colorScheme.onSurfaceVariant, size: 30),
        const SizedBox(height: 4),
        Text(label, style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12)),
      ],
    );
  }
}

class _OtherFacilitiesButton extends StatelessWidget {
  final int count;

  const _OtherFacilitiesButton({required this.count});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 30,
          width: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            '+$count',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
          ),
        ),
        const SizedBox(height: 4),
        Text('Other Facilities', style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12)),
      ],
    );
  }
}
