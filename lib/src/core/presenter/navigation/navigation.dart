import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zillow_mini/src/core/presenter/navigation/auth_notifier.dart';
import 'package:zillow_mini/src/core/presenter/navigation/navigation_host.dart';
import 'package:zillow_mini/src/di.dart';
import 'package:zillow_mini/src/features/home/presenter/view/home_page.dart';
import 'package:zillow_mini/src/features/login/presenter/view/login_page.dart';
import 'package:zillow_mini/src/features/profile/presenter/view/profile_page.dart';
import 'package:zillow_mini/src/features/property_detail/presenter/view/detail_page.dart';
import 'package:zillow_mini/src/features/settings/presenter/view/settings_page.dart';
import 'package:zillow_mini/src/features/splash/splash_page.dart';

final _rootKeyShell = GlobalKey<NavigatorState>();
final _propertyKey = GlobalKey<NavigatorState>();
final _settingsKey = GlobalKey<NavigatorState>();

enum AppRoute {
  splash('/splash'),
  login('/login'),
  home('/'),
  detail('detail:property_id'),
  profile('profile'),
  settings('/settings');

  final String path;

  const AppRoute(this.path);
}

final AuthNotifier authNotifier = getIt.get();
final goRouter = GoRouter(
  navigatorKey: _rootKeyShell,
  refreshListenable: authNotifier,
  debugLogDiagnostics: true,
  initialLocation: AppRoute.login.path,
  redirect: (BuildContext context, GoRouterState state) {
    final status = authNotifier.status;
    final isLoggingIn = state.uri.toString() == AppRoute.login.path;
    final isChecking = status == AuthStatus.checking;
    final isSplashScreen = state.uri.toString() == AppRoute.splash.path;

    if (isChecking) {
      return isSplashScreen ? null : AppRoute.splash.path;
    }

    if (status == AuthStatus.loggedOut) {
      return isLoggingIn ? null : AppRoute.login.path;
    }

    if (status == AuthStatus.loggedIn) {
      return (isLoggingIn || isSplashScreen) ? AppRoute.home.path : null;
    }

    return null;
  },
  routes: [
    GoRoute(name: AppRoute.splash.name, path: AppRoute.splash.path, builder: (context, state) => const SplashScreen()),
    GoRoute(name: AppRoute.login.name, path: AppRoute.login.path, builder: (context, state) => LoginPage()),
    StatefulShellRoute(
      navigatorContainerBuilder: (context, navigationShell, children) {
        return NavigationHost(child: navigationShell, children: children);
      },
      builder: (context, state, navigationShell) {
        return navigationShell;
      },

      branches: [
        StatefulShellBranch(
          navigatorKey: _propertyKey,
          routes: [
            GoRoute(
              parentNavigatorKey: _propertyKey,
              name: AppRoute.home.name,
              path: AppRoute.home.path,
              pageBuilder: (context, state) =>
                  buildSlideHorizontalPage(context: context, state: state, child: const HomePage()),
              routes: [
                GoRoute(
                  parentNavigatorKey: _rootKeyShell,
                  name: AppRoute.detail.name,
                  path: AppRoute.detail.path,
                  pageBuilder: (context, state) {
                    final id = state.pathParameters['property_id'];
                    if (id == null) throw Exception("No value passed to property_id");
                    return buildSlideUpPage(
                      context: context,
                      state: state,
                      child: PropertyDetailPage(propertyId: id),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _settingsKey,
          routes: [
            GoRoute(
              parentNavigatorKey: _settingsKey,
              name: AppRoute.settings.name,
              path: AppRoute.settings.path,
              pageBuilder: (context, state) =>
                  buildSlideHorizontalPage(context: context, state: state, child: SettingsPage()),
              routes: [
                GoRoute(
                  parentNavigatorKey: _rootKeyShell,
                  name: AppRoute.profile.name,
                  path: AppRoute.profile.path,
                  pageBuilder: (context, state) {
                    return buildSlideUpPage(context: context, state: state, child: ProfilePage());
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);

CustomTransitionPage buildSlideUpPage({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 400),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      final tween = Tween(begin: begin, end: end);
      final curvedAnimation = CurvedAnimation(parent: animation, curve: Curves.easeOutCubic);

      return SlideTransition(position: tween.animate(curvedAnimation), child: child);
    },
  );
}

CustomTransitionPage buildSlideHorizontalPage({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 400),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      final tween = Tween(begin: begin, end: end);
      final curvedAnimation = CurvedAnimation(parent: animation, curve: Curves.easeOutCubic);

      return SlideTransition(position: tween.animate(curvedAnimation), child: child);
    },
  );
}
