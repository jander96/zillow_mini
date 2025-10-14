import 'package:go_router/go_router.dart';
import 'package:zillow_mini/src/features/home/presenter/view/home_page.dart';
import 'package:zillow_mini/src/features/property_detail/presenter/view/detail_page.dart';

enum AppRoute {
  home('/'),
  detail('detail:property_id');

  final String path;

  const AppRoute(this.path);
}

final goRouter = GoRouter(
  initialLocation: AppRoute.home.path,
  routes: [
    GoRoute(
      name: AppRoute.home.name,
      path: AppRoute.home.path,
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          name: AppRoute.detail.name,
          path: AppRoute.detail.path,
          builder: (context, state) {
            final id = state.pathParameters['property_id'];
            if (id == null) throw Exception("No value passed to property_id");
            return PropertyDetailPage(propertyId: id);
          },
        ),
      ],
    ),
  ],
);
