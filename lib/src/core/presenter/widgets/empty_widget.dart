import 'package:flutter/material.dart';
import 'package:zillow_mini/src/core/presenter/extensions/context_extensions.dart';

class EmptyStateWidget extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onClearFilters;
  final IconData icon;

  const EmptyStateWidget({
    super.key,
    this.title = 'Sin resultados encontrados',
    this.message = 'Tu búsqueda no arrojó resultados. Intenta con un término diferente o limpia los filtros.',
    required this.onClearFilters,
    this.icon = Icons.search_off,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 64.0,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
            ),
            const SizedBox(height: 16.0),

            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8.0),

            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24.0),

            OutlinedButton.icon(
              onPressed: onClearFilters,
              icon: const Icon(Icons.close),
              label:  Text(context.l10n.cleanFilters),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(150, 48),
              ),
            ),
          ],
        ),
      ),
    );
  }
}