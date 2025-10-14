import 'package:flutter/material.dart';

extension DeveloperContact on BuildContext {
  void showDeveloperContact() {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text('janderdeveloper@gmail.com'),
        backgroundColor: Theme.of(this).colorScheme.primaryContainer,
      ),
    );
  }
}
