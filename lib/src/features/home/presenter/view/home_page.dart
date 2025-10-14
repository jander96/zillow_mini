import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zillow_mini/src/core/presenter/navigation/navigation.dart';
import 'package:zillow_mini/src/di.dart';
import 'package:zillow_mini/src/features/home/presenter/view/properties_list_widget.dart';
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
      appBar: AppBar(title: const Text('Zillow mini')),
      body: PropertiesListWidget(
        pagingController: context.read<HomeViewModel>().pagingController,
        onPropertyClick: (property) {
          context.goNamed(AppRoute.detail.name, pathParameters: {'property_id': property.id});
        },
      ),
    );
  }
}
