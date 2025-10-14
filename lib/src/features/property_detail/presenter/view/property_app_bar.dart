import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zillow_mini/src/features/favorites/presenter/view/favorite_icon.dart';

class PropertyAppBar extends StatelessWidget {
  const PropertyAppBar({
    super.key,
    required this.propertyId,
    required this.pageController,
    required this.currentImageIndex,
    required this.onImageChanged,
    required this.image,
  });

  final PageController pageController;
  final int currentImageIndex;
  final ValueChanged<int> onImageChanged;
  final String image;
  final String propertyId;

  @override
  Widget build(BuildContext context) {
    final imageList = ['assets/image1.jpg', 'assets/image2.jpg', 'assets/image3.jpg'];

    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: 280.0,
      pinned: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: <Widget>[
            PageView.builder(
              controller: pageController,
              itemCount: imageList.length,
              onPageChanged: (index) {
                onImageChanged(index);
              },
              itemBuilder: (context, index) {
                return CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: index == 0 ? image : 'https://picsum.photos/600/400?random=$index',
                );
              },
            ),

            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  imageList.length,
                      (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    height: 8.0,
                    width: currentImageIndex == index ? 24.0 : 8.0,
                    decoration: BoxDecoration(
                      color: currentImageIndex == index ? Colors.white : Colors.white54,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      leading: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.onSurface),
          style: IconButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.surface.withValues(alpha: .6)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, right: 8.0),
          child: AnimatedFavoriteIcon(propertyId: propertyId),
        ),
      ],
    );
  }
}
