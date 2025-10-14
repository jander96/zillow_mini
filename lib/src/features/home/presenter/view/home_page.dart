import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zillow_mini/src/core/presenter/extensions/context_extensions.dart';
import 'package:zillow_mini/src/core/presenter/navigation/navigation.dart';
import 'package:zillow_mini/src/di.dart';
import 'package:zillow_mini/src/features/home/presenter/view/profile_avatar.dart';
import 'package:zillow_mini/src/features/home/presenter/view/properties_list_widget.dart';
import 'package:zillow_mini/src/features/home/presenter/view/search_bar.dart';
import 'package:zillow_mini/src/features/home/presenter/view_model/home_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => HomeViewModel(getIt.get()), child: HomeContent());
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
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){
                    context.showDeveloperContact();
                  }, icon:  Icon(Icons.menu)),
                  ProfileAvatar()

                ],
              )),
              SliverToBoxAdapter(child: SizedBox(height: 16),),
              SliverPersistentHeader(delegate: TitlePersistenceHeader()),
              SliverFloatingHeader(
                snapMode: FloatingHeaderSnapMode.overlay,
                child: AppSearchBar(
                  onSearch: (query) {
                    context.read<HomeViewModel>().search(query);
                  },
                ),
              ),
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
    );
  }
}

class TitlePersistenceHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return RichText(
      text: TextSpan(
        text: "Find your \n",
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
        children: [
          TextSpan(text: "dream property", style: Theme.of(context).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 72;

  @override
  double get minExtent => 56;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate)=> false;

}
