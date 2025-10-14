import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:zillow_mini/src/core/presenter/navigation/navigation.dart';
import 'package:zillow_mini/src/core/presenter/theme/theme.dart';
import 'package:zillow_mini/src/di.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  configureDependencies();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      title: 'Zillow mini',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
