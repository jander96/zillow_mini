import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zillow_mini/src/di.dart';
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
            PropertyDetailLoaded() => Text(state.property.title),
            PropertyDetailError() => Text(state.error.toString()),
          },
        );
      },
    );
  }
}
