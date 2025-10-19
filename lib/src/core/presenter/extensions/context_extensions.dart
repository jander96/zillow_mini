import 'package:flutter/material.dart';
import 'package:zillow_mini/l10n/app_localizations.dart';

extension DeveloperContact on BuildContext {
  void showDeveloperContact() {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text('janderdeveloper@gmail.com'),
        backgroundColor: Theme.of(this).colorScheme.primaryContainer,
      ),
    );
  }

  void showSnackbar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
