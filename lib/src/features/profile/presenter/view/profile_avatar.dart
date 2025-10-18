import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zillow_mini/src/core/presenter/extensions/context_extensions.dart';
import 'package:zillow_mini/src/features/login/presenter/models/user_ui.dart';
import 'package:zillow_mini/src/features/profile/presenter/view_model/profile_view_model.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key, this.size = 40});

  final double size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileViewModel, UserUI?>(
      builder: (context, user) {
        return GestureDetector(
          onTap: () {
            context.showDeveloperContact();
          },
          child: ClipOval(
            child: (user == null)
                ? Image.asset('assets/images/profile_placeholder.png', height: size, width: size)
                : CachedNetworkImage(
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        CircularProgressIndicator(value: downloadProgress.progress),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                    imageUrl: user.image,
                    height: size,
                    width: size,
                  ),
          ),
        );
      },
    );
  }
}
