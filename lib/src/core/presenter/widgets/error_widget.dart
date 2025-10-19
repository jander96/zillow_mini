import 'package:flutter/material.dart';
import 'package:zillow_mini/src/core/presenter/extensions/context_extensions.dart';

class ErrorStateWidget extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onRetry;
  final IconData icon;

  const ErrorStateWidget({
    super.key,
    this.title = 'Error',
    this.message = 'Something went wrong.',
    required this.onRetry,
    this.icon = Icons.error_outline,
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
              color: Theme.of(context).colorScheme.error,
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

            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label:  Text(context.l10n.retry),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 48),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



