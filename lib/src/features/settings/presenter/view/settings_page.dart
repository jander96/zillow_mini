import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zillow_mini/src/core/presenter/navigation/navigation.dart';
import 'package:zillow_mini/src/core/presenter/theme/theme_switcher.dart';
import 'package:zillow_mini/src/features/profile/presenter/view/profile_header.dart';
import 'package:zillow_mini/src/features/settings/presenter/view/settings_list_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,

      appBar: AppBar(
          toolbarHeight: 0, backgroundColor: Colors.transparent, elevation: 0,
        actions: [

        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Settings',
                    style: theme.textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  ThemeSwitcherAnimated(size: 28,),
                ],
              ),
            ),



            const ProfileHeader(),

            SettingListTile(icon: Icons.person_outline, title: 'User Profile', onTap: () => context.goNamed(AppRoute.profile.name),),
            SettingListTile(icon: Icons.lock_outline, title: 'Change Password'),
            SettingListTile(icon: Icons.help_outline, title: 'FAQs'),
            SettingListTile(
              icon: Icons.notifications_none,
              title: 'Push Notification',
              trailing: Switch(value: true, onChanged: (bool value) {}, activeThumbColor: Colors.green),
            ),

            const SizedBox(height: 20.0),

            const Padding(padding: EdgeInsets.symmetric(horizontal: 24.0), child: ContactInfoBox()),

            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}

class ContactInfoBox extends StatelessWidget {
  const ContactInfoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(color: const Color(0xFFE8F6F8), borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        children: [
          Text(
            'If you have any other query you can reach out to us.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 10.0),
          TextButton(
            onPressed: () {},
            child: Text(
              'WhatsApp Us',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
