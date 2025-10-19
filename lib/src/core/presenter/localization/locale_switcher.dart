import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zillow_mini/src/core/presenter/localization/localization_view_model.dart';
import 'package:zillow_mini/src/core/presenter/extensions/context_extensions.dart';

class LanguageSwitcherTile extends StatelessWidget {
  const LanguageSwitcherTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationViewModel, AppLocale>(
      builder: (context, currentLocale) {
        final viewModel = context.read<LocalizationViewModel>();

        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4.0),
          leading: const Icon(Icons.language),
          title:  Text(
            context.l10n.appLocale,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          subtitle: Text(
            context.l10n.currentLanguage(currentLocale.id == 'en_US' ? context.l10n.en : context.l10n.es),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
          ),
          trailing: SizedBox(
            width: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _LanguageFlag(
                  flag: '🇺🇸',
                  isSelected: currentLocale.id == 'en_US',
                  onTap: () => viewModel.changeLocale('en', 'US'),
                ),
                const SizedBox(width: 8),
                _LanguageFlag(
                  flag: '🇪🇸',
                  isSelected: currentLocale.languageCode == 'es',
                  onTap: () => viewModel.changeLocale('es', 'ES'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _LanguageFlag extends StatelessWidget {
  final String flag;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageFlag({
    required this.flag,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8), child: Padding(
        padding: const EdgeInsets.all(2),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          decoration: BoxDecoration(
            border: isSelected
                ? Border.all(color: Colors.blue.shade600, width: 3)
                : Border.all(color: Colors.transparent, width: 3),
            borderRadius: BorderRadius.circular(6),
            boxShadow: isSelected
                ? [
              BoxShadow(
                color: Colors.blue.withOpacity(0.5),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ]
                : [
              BoxShadow(
                color: Colors.transparent,
                blurRadius: 0,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Text(
            flag,
            style: const TextStyle(fontSize: 28),
          ),
        ),
      ),
    );
  }
}