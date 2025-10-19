import 'package:flutter/material.dart';

class SettingListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;


  const SettingListTile({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4.0),
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.onSurface,
        size: 24.0,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: trailing ?? const Icon(
        Icons.chevron_right,
        color: Colors.grey,
      ),
      onTap: onTap,
    );
  }
}