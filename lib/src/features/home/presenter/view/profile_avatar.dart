
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zillow_mini/src/core/presenter/extensions/context_extensions.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.showDeveloperContact();
      },
      child: ClipOval(
        child: CachedNetworkImage(
            imageUrl:  'https://avatars.githubusercontent.com/u/109311109?v=4',
          height: 40,
          width: 40,
        ),
      ),
    );
  }
}
