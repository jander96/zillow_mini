import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zillow_mini/src/core/presenter/extensions/context_extensions.dart';
import 'package:zillow_mini/src/core/presenter/models/property_ui.dart';
import 'package:zillow_mini/src/di.dart';
import 'package:zillow_mini/src/features/property_detail/presenter/view/amenities_section.dart';
import 'package:zillow_mini/src/features/property_detail/presenter/view/contact_buttons.dart';
import 'package:zillow_mini/src/features/property_detail/presenter/view/header_texts.dart';
import 'package:zillow_mini/src/features/property_detail/presenter/view/location_button.dart';
import 'package:zillow_mini/src/features/property_detail/presenter/view/property_app_bar.dart';
import 'package:zillow_mini/src/features/property_detail/presenter/view/property_highlights_section.dart';
import 'package:zillow_mini/src/features/property_detail/presenter/view/property_specification.dart';
import 'package:zillow_mini/src/features/property_detail/presenter/view_model/property_detail_view_model.dart';

class PropertyDetailPage extends StatelessWidget {
  const PropertyDetailPage({super.key, required this.propertyId});

  final String propertyId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PropertyDetailViewModel(propertyId, getIt.get()),
      child: PropertyDetailContent(),
    );
  }
}

class PropertyDetailContent extends StatelessWidget {
  const PropertyDetailContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertyDetailViewModel, PropertyDetailState>(
      builder: (context, state) {
        return Scaffold(
          body: switch (state) {
            PropertyDetailInitial() => SizedBox.shrink(),
            PropertyDetailLoading() => Center(child: CircularProgressIndicator()),
            PropertyDetailLoaded() => _PropertyView(property: state.property),
            PropertyDetailError() => Text(state.error.toString()),
          },
        );
      },
    );
  }
}

class _PropertyView extends StatefulWidget {
  const _PropertyView({super.key, required this.property});

  final PropertyUI property;

  @override
  State<_PropertyView> createState() => _PropertyViewState();
}

class _PropertyViewState extends State<_PropertyView> {
  int _currentImageIndex = 0;
  final PageController _pageController = PageController();

  final List<Map<String, dynamic>> amenities = [
    {'icon': Icons.watch_later_outlined, 'name': 'Creche/Day Care'},
    {'icon': Icons.self_improvement, 'name': 'Yoga/Meditation Area'},
    {'icon': Icons.local_atm, 'name': 'ATM'},
    {'icon': Icons.shopping_bag_outlined, 'name': 'Shopping Mall'},
    {'icon': Icons.videogame_asset_outlined, 'name': 'Indoor Games'},
    {'icon': Icons.restaurant, 'name': 'Cafeteria'},
    {'icon': Icons.phone_in_talk, 'name': 'Intercom'},
    {'icon': Icons.content_cut, 'name': 'Unisex Salon'},
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).colorScheme.surface,

      body: CustomScrollView(
        slivers: <Widget>[
          PropertyAppBar(
            propertyId: widget.property.id,
            pageController: _pageController,
            currentImageIndex: _currentImageIndex,
            onImageChanged: (value) {
              setState(() {
                _currentImageIndex = value;
              });
            },
            image: widget.property.image,
          ),

          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    PropertyTitleSection(title: widget.property.title),
                    const SizedBox(height: 5),
                    PropertyAddress(city: widget.property.city),
                    const SizedBox(height: 10),
                    PropertyPrice(price: widget.property.formatedPrice),
                    const SizedBox(height: 20),
                    PropertySpecifications(bedrooms: widget.property.bathrooms, bathrooms: widget.property.bathrooms),
                    const SizedBox(height: 10),
                    LocationButton(
                      onPressed: () {
                        context.showDeveloperContact();
                      },
                    ),
                    const SizedBox(height: 30),
                    PropertyAmenitiesSection(amenities: amenities),
                    const SizedBox(height: 30),
                    PropertyHighlightsSection(),
                    const SizedBox(height: 20),
                    ContactButtonsRow(),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
