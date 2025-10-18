import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:zillow_mini/src/core/presenter/navigation/navigation.dart';
import 'package:zillow_mini/src/core/presenter/theme/theme.dart';
import 'package:zillow_mini/src/core/presenter/theme/theme_view_model.dart';
import 'package:zillow_mini/src/di.dart';
import 'package:zillow_mini/src/features/profile/presenter/view_model/profile_view_model.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  await dotenv.load(fileName: ".env");
  configureDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProfileViewModel(getIt.get())),
        BlocProvider(create: (context) => ThemeViewModel(getIt.get())),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeViewModel, AppThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp.router(
          routerConfig: goRouter,
          title: 'Zillow mini',
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en'), // English
            Locale('es'), // Spanish
          ],
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeMode.isDark ? ThemeMode.dark : ThemeMode.light,
        );
      }
    );
  }
}
