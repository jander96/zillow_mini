import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zillow_mini/src/features/login/presenter/models/user_ui.dart';
import 'package:zillow_mini/src/features/login/presenter/view/logout_button.dart';
import 'package:zillow_mini/src/features/profile/presenter/view/profile_avatar.dart';
import 'package:zillow_mini/src/features/profile/presenter/view_model/profile_view_model.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const ProfileAvatar(),
              const SizedBox(width: 16.0),
              BlocBuilder<ProfileViewModel, UserUI?>(
                builder: (context,user) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${user?.email ?? 'Unknown'} ',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.grey.shade600,
                        ),
                      ),
                      RichText(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                        text : '${user?.name ?? 'Unknown'} ',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onSurface,
                        ),
                        children: [
                          TextSpan(text :"(${user?.role.name ?? 'n/a'})", style: theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.grey.shade600,
                          ))
                        ]
                      ),

                      ),
                    ],
                  );
                }
              ),
            ],
          ),
          // Botón de Logout
          LogoutButton(buttonBuilder: (context, onPressed, state) {
            return IconButton(
              onPressed: () {
                showDialog(context: context, builder: (context) {
                  return AlertDialog(
                    title: Text('Logout'),
                    content: Text('Are you sure you want to logout?'),
                    actions: [
                      TextButton(onPressed: () => Navigator.of(context).pop(), child: Text('No')),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.errorContainer.withValues(alpha: .6)),
                          onPressed: onPressed, child: Text('Yes')),
                    ],
                  );
                },);
              },
              icon: Icon(
                Icons.logout,
                color: theme.colorScheme.primary,
              ),
            );
          },),
        ],
      ),
    );
  }
}