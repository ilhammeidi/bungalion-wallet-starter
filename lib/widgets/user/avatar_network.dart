import 'package:ewallet_app/constants/img_api.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:flutter/material.dart';

class AvatarNetwork extends StatelessWidget {
  const AvatarNetwork({
    super.key,
    required this.radius,
    required this.backgroundImage,
    this.type = 'avatar',
    this.backgroundColor
  });

  final double radius;
  final String backgroundImage;
  final Color? backgroundColor;
  final String type;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor ?? ThemePalette.primaryLight,
      backgroundImage: FadeInImage.assetNetwork(
        placeholder: type == 'avatar' ? ImgApi.placholderAvatar : ImgApi.placholderLogo, // Path to your local placeholder image
        image: backgroundImage, // URL of the network image
        fit: BoxFit.cover, // How the image should be fitted inside the circle
        fadeInDuration: const Duration(milliseconds: 300), // Duration of the fade-in animation
        fadeOutDuration: const Duration(milliseconds: 100), // Duration of the fade-out animation for the placeholder
      ).image, // Important,
    );
  }
}