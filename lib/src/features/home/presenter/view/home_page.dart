import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zillow_mini/src/core/presenter/extensions/context_extensions.dart';
import 'package:zillow_mini/src/core/presenter/navigation/navigation.dart';
import 'package:zillow_mini/src/di.dart';
import 'package:zillow_mini/src/features/filters/presenter/view/filters.dart';
import 'package:zillow_mini/src/features/filters/presenter/view_model/cities_view_model.dart';
import 'package:zillow_mini/src/features/filters/presenter/view_model/filters_view_model.dart';
import 'package:zillow_mini/src/features/home/presenter/view/properties_list_widget.dart';
import 'package:zillow_mini/src/features/home/presenter/view/search_bar.dart';
import 'package:zillow_mini/src/features/home/presenter/view_model/home_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeViewModel(getIt.get(), getIt.get())),
        BlocProvider(create: (context) => FiltersViewModel(getIt.get())),
        BlocProvider(create: (context) => CitiesViewModel(getIt.get())),
      ],
      child: HomeContent(),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: RefreshIndicator(
            onRefresh: () async => context.read<HomeViewModel>().pagingController.refresh(),
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.all(8),
                  sliver: SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [SizedBox.shrink(), SortMenuButton()],
                    ),
                  ),
                ),
                SliverPersistentHeader(delegate: TitlePersistenceHeader()),

                SliverFloatingHeader(
                  snapMode: FloatingHeaderSnapMode.overlay,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: AppSearchBar(
                      onSearch: (query) {
                        context.read<FiltersViewModel>().setFilters((filters) => filters.copyWith(query: query));
                      },
                    ),
                  ),
                ),

                SliverToBoxAdapter(child: PriceRangeSlider()),
                SliverToBoxAdapter(child: CityFilterChips()),
                PropertiesListWidget(
                  pagingController: context.read<HomeViewModel>().pagingController,
                  onPropertyClick: (property) {
                    context.goNamed(AppRoute.detail.name, pathParameters: {'property_id': property.id});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TitlePersistenceHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return RichText(
      text: TextSpan(
        text: context.l10n.findYour,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
        children: [
          TextSpan(
            text: context.l10n.dreamProperty,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 72;

  @override
  double get minExtent => 56;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}
