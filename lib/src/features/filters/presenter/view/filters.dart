import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
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
              context.read<FiltersViewModel>().setFilters(
                (filters) => filters.copyWith(sortBy: value == filters.sortBy ? null : value),
              );
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
      },
    );
  }
}

class CityFilterChips extends StatefulWidget {
  const CityFilterChips({super.key});

  @override
  State<CityFilterChips> createState() => _CityFilterChipsState();
}

class _CityFilterChipsState extends State<CityFilterChips> with AutomaticKeepAliveClientMixin {
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
        builder: (context, cities) {
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
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}


class PriceRangeSlider extends StatefulWidget {
  const PriceRangeSlider({super.key, this.minPrice = 0, this.maxPrice = 1000});

  final double minPrice;
  final double maxPrice;

  @override
  State<PriceRangeSlider> createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  late RangeValues _currentRangeValues;
  late NumberFormat _currencyFormatter;

  bool get _isFilterActive =>
      _currentRangeValues.start.round() != widget.minPrice.round() ||
          _currentRangeValues.end.round() != widget.maxPrice.round();

  @override
  void initState() {
    super.initState();
    _currentRangeValues = RangeValues(widget.minPrice, widget.maxPrice);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final locale = Localizations.localeOf(context);
    _currencyFormatter = NumberFormat.simpleCurrency(locale: locale.toString(), decimalDigits: 0);
  }

  String _formatCurrency(double amount) {
    return _currencyFormatter.format(amount);
  }

  void _resetFilter() {
    setState(() {
      _currentRangeValues = RangeValues(widget.minPrice, widget.maxPrice);
    });
  }

  void _applyFilter(RangeValues values) {
    context.read<FiltersViewModel>().setFilters(
      (filters) => filters.copyWith(minPrice: values.start, maxPrice: values.end),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String minLabel = _formatCurrency(_currentRangeValues.start);
    final String maxLabel = _formatCurrency(_currentRangeValues.end);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.l10n.priceRange, style: TextStyle(fontSize: 14)),
          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('$minLabel', style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12)),
              Text('$maxLabel', style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12)),
            ],
          ),

          Row(
            children: [
              Expanded(
                child: RangeSlider(
                  padding: EdgeInsets.zero,
                  values: _currentRangeValues,
                  min: widget.minPrice,
                  max: widget.maxPrice,
                  divisions: (widget.maxPrice - widget.minPrice).toInt(),
                  labels: RangeLabels(minLabel, maxLabel),
                  onChanged: (RangeValues values) {
                    setState(() {
                      _currentRangeValues = values;
                    });
                  },
                  onChangeEnd: _applyFilter,
                ),
              ),


              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: ScaleTransition(
                      scale: animation,
                      child: child,
                    ),
                  );
                },
                child: _isFilterActive
                    ? IconButton(
                  key: const ValueKey('closeButton'),
                  onPressed: _resetFilter,
                  icon: const Icon(Icons.close),
                  padding: EdgeInsets.zero,
                )
                    : const SizedBox(
                  key: const ValueKey('emptySpace'),
                  width: 48,
                  height: 48,
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
