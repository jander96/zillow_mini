import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zillow_mini/src/di.dart';
import 'package:zillow_mini/src/features/favorites/presenter/view_model/FavoritesViewModel.dart';


class _ClampedCurve extends Curve {
  final Curve _curve;
  const _ClampedCurve(this._curve);

  @override
  double transform(double t) => (_curve.transform(t)).clamp(0.0, 1.0);
}

class AnimatedFavoriteIconProvider extends StatelessWidget {
  const AnimatedFavoriteIconProvider({super.key, required this.propertyId});
  final String propertyId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=> FavoritesViewModel(propertyId, getIt.get()),
    child: AnimatedFavoriteIcon(propertyId: propertyId));
  }
}


class AnimatedFavoriteIcon extends StatefulWidget {
  const AnimatedFavoriteIcon({super.key, required this.propertyId});

  final String propertyId;

  @override
  State<AnimatedFavoriteIcon> createState() => _AnimatedFavoriteIconState();
}

class _AnimatedFavoriteIconState extends State<AnimatedFavoriteIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.3), weight: 40),
      TweenSequenceItem(tween: Tween(begin: 1.3, end: 0.9), weight: 30),
      TweenSequenceItem(tween: Tween(begin: 0.9, end: 1.0), weight: 30),
    ]).animate(
      CurvedAnimation(parent: _controller, curve: _ClampedCurve(Curves.easeOutBack)),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onToggle() {
    _controller.forward(from: 0);
    context.read<FavoritesViewModel>().add(FavoriteToggle());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesViewModel, FavoriteState>(
      builder: (context, state) {
        bool isFavorite = false;

        if (state is FavoriteLoaded) {
          isFavorite = state.isFavorite;
        }

        return ScaleTransition(
          scale: _scaleAnimation,
          child: GestureDetector(
            onTap: _onToggle,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: () {
                if (state is FavoriteLoading) {
                  return SizedBox(
                    key: const ValueKey('loading'),
                    width: 24,
                    height: 24,
                    child: const CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.red,
                    ),
                  );
                } else if (state is FavoriteLoaded) {
                  return Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    key: ValueKey(isFavorite),
                    color: isFavorite ? Colors.red : Colors.grey,
                    size: 30,
                  );
                } else {
                  return const Icon(
                    Icons.favorite_border,
                    key: ValueKey('default'),
                    color: Colors.grey,
                    size: 30,
                  );
                }
              }(),
            ),
          ),
        );
      },
    );
  }
}