import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:zillow_mini/src/core/presenter/models/property_ui.dart';
import 'package:zillow_mini/src/features/home/presenter/view/property_card.dart';

class PropertiesListWidget extends StatefulWidget {
  const PropertiesListWidget({super.key, required this.pagingController, required this.onPropertyClick});

  final PagingController<int, PropertyUI> pagingController;
  final ValueChanged<PropertyUI> onPropertyClick;

  @override
  State<PropertiesListWidget> createState() => _PropertiesListWidgetState();
}

class _PropertiesListWidgetState extends State<PropertiesListWidget> {
  @override
  Widget build(BuildContext context) {
    return PagingListener(
      controller: widget.pagingController,
      builder: (context, state, fetchNextPage) => PagedSliverList<int, PropertyUI>.separated(
        state: state,
        fetchNextPage: fetchNextPage,
        builderDelegate: PagedChildBuilderDelegate(
          animateTransitions: true,
          itemBuilder: (context, property, index) => PropertyCard(propertyUI: property, onTap: widget.onPropertyClick),
        ), separatorBuilder: (BuildContext context, int index) =>SizedBox.square(dimension: 8,),
      ),
    );
  }
}
