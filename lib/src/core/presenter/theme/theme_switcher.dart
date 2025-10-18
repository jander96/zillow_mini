import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zillow_mini/src/core/presenter/theme/theme_view_model.dart';

class ThemeSwitcherAnimated extends StatelessWidget {
  final double size;

  const ThemeSwitcherAnimated({super.key, this.size = 32.0});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeViewModel, AppThemeMode>(
      builder: (context, themeMode) {
        final isLight = themeMode == AppThemeMode.light;

        return GestureDetector(
          onTap: context.read<ThemeViewModel>().toggleTheme,
          child: Container(
            width: size * 1.5,
            height: size * 1.5,

            decoration: BoxDecoration(
              color: isLight ? Colors.yellow.withOpacity(0.2) : Colors.blueGrey.shade800,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(size / 4),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(scale: animation, child: child);
              },

              child: isLight
                  ? Icon(Icons.wb_sunny, key: const ValueKey('sun'), color: Colors.amber, size: size)
                  : Icon(Icons.nightlight_round, key: const ValueKey('moon'), color: Colors.white, size: size),
            ),
          ),
        );
      },
    );
  }
}
