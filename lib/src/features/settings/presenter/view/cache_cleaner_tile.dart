import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zillow_mini/src/features/profile/presenter/view_model/profile_view_model.dart';
import 'package:zillow_mini/src/features/settings/presenter/view/settings_list_tile.dart' show SettingListTile;
import 'package:zillow_mini/src/features/settings/presenter/view_model/cache_cleaner_view_model.dart';
import 'package:zillow_mini/src/core/presenter/extensions/context_extensions.dart';

class CacheCleanerTile extends StatelessWidget {
  const CacheCleanerTile({super.key});

  void _showConfirmationDialog(BuildContext context, CacheCleanerViewModel viewModel) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        final isLoading = viewModel.state is CleanerLoading;

        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: Text(context.l10n.confirmClean),
          content: Text(context.l10n.confirmCleanDescription),
          actions: <Widget>[
            TextButton(onPressed: () => context.pop(false), child: Text(context.l10n.cancel)),
            ElevatedButton(
              onPressed: isLoading
                  ? null
                  : () {
                      context.pop(true);
                      viewModel.clean();
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: isLoading
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                    )
                  :  Text(context.l10n.clean),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CacheCleanerViewModel>();

    return BlocConsumer<CacheCleanerViewModel, CleanerState>(
      listener: (context, state) {
        context.read<ProfileViewModel>().checkUser();
      },
      builder: (context, state) {
        Widget? trailingWidget;

        if (state is CleanerLoading) {
          trailingWidget = const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2));
        } else {
          trailingWidget = const Icon(Icons.chevron_right, color: Colors.grey);
        }

        return SettingListTile(
          icon: Icons.layers_clear,
          title: context.l10n.cleanCacheTitle,
          trailing: trailingWidget,
          onTap: state is CleanerLoading
              ? null
              : () {
                  _showConfirmationDialog(context, viewModel);
                },
        );
      },
    );
  }
}
