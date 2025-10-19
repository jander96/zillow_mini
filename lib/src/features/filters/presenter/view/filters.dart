import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zillow_mini/src/core/domain/models/property.dart';
import 'package:zillow_mini/src/core/presenter/extensions/context_extensions.dart';
import 'package:zillow_mini/src/features/filters/domain/filters.dart';
import 'package:zillow_mini/src/features/filters/presenter/view_model/cities_view_model.dart';
import 'package:zillow_mini/src/features/filters/presenter/view_model/filters_view_model.dart';

class SortMenuButton extends StatelessWidget {
  const SortMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FiltersViewModel, Filters>(
      builder: (context, filters) {
        return Badge.count(
          isLabelVisible: filters.count > 0,
          count: filters.count,
          child: PopupMenuButton<PropertySortBy>(
            initialValue: filters.sortBy,
            onSelected: (value) {
              context.read<FiltersViewModel>().setFilters((filters) => filters.copyWith(sortBy: value == filters.sortBy ? null : value),);
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<PropertySortBy>>[
              PopupMenuItem<PropertySortBy>(value: PropertySortBy.priceAsc, child: Text(context.l10n.lowerPrice)),
              PopupMenuItem<PropertySortBy>(value: PropertySortBy.priceDesc, child: Text(context.l10n.higherPrice)),
              PopupMenuItem<PropertySortBy>(value: PropertySortBy.cityAsc, child: Text(context.l10n.cityAZ)),
              PopupMenuItem<PropertySortBy>(value: PropertySortBy.cityDesc, child: Text(context.l10n.cityZA)),
            ],
            icon: const Icon(Icons.sort),
          ),
        );
      }
    );
  }
}

class CityFilterChips extends StatefulWidget {
  const CityFilterChips({super.key});

  @override
  State<CityFilterChips> createState() => _CityFilterChipsState();
}

class _CityFilterChipsState extends State<CityFilterChips>  with AutomaticKeepAliveClientMixin{

  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: BlocBuilder<CitiesViewModel, List<String>>(
        builder: (context,cities) {
          return Wrap(
            spacing: 8.0,
            children: cities.map((city) {
              return BlocBuilder<FiltersViewModel, Filters>(
                builder: (context, filters) {
                  return ChoiceChip(
                    label: Text(city),
                    selected: filters.city == city,
                    onSelected: (bool selected) {
                      context.read<FiltersViewModel>().setFilters((filters) {
                        return filters.copyWith(city: city == filters.city ? null : city);
                      });
                    },
                  );
                }
              );
            }).toList(),
          );
        }
      ),
    );
  }
  @override
  bool get wantKeepAlive => true;
}