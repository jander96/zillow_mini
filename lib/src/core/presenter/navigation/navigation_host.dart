import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class NavigationHost extends StatelessWidget {
  const NavigationHost({super.key, required this.child, required this.children});

  final StatefulNavigationShell child;
  final List<Widget> children;

  void _onTap(int index) {
    child.goBranch(
      index,
      initialLocation: index == child.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [(Icons.home, "Home"), (Icons.settings, "Settings")];
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SafeArea(child: AnimatedBranchContainer(currentIndex: child.currentIndex, children: children),),
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        backgroundColor: Theme.of(context).colorScheme.surface,
        tabBuilder: (index, isActive) {
          final (icon ,label)= tabs[index];
          return Column(
            children: [
              Icon(
                icon,
                color: isActive ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              Text(label, style: Theme.of(context).textTheme.bodySmall,)
            ],
          );
        },
        blurEffect: true,
        activeIndex: child.currentIndex,
        gapWidth: 12,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: _onTap,
        itemCount: tabs.length,
        //other params
      ),
    );
  }
}



extension ListExtension<T> on List<T> {
  List<R> mapIndexed<R>(R Function(int index, T item) mapper) {
    return toList().asMap().entries.map((entry) {
      return mapper(entry.key, entry.value);
    }).toList();
  }
}

class AnimatedBranchContainer extends StatelessWidget {
  const AnimatedBranchContainer({
    super.key,
    required this.currentIndex,
    required this.children,
  });

  final int currentIndex;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;

        return Stack(
          children: children.mapIndexed((int index, Widget navigator) {
            final positionX = (index - currentIndex) * screenWidth;
            return AnimatedPositioned(
              key: navigator.key,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOutCubic,
              top: 0,
              bottom: 0,
              left: positionX,
              width: screenWidth,
              child: IgnorePointer(
                ignoring: index != currentIndex,
                child: TickerMode(enabled: index == currentIndex, child: navigator),
              ),
            );
          }).toList(),
        );
      },
    );
  }

}