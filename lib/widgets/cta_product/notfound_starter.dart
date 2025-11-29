import 'package:ewallet_app/app/app_link.dart';
import 'package:ewallet_app/ui/themes/theme_button.dart';
import 'package:ewallet_app/ui/themes/theme_shadow.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/route_manager.dart';

class NotfoundStarter extends StatelessWidget {
  const NotfoundStarter({super.key});

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Uri urlFullVersion = Uri.parse('https://codecanyon.net/user/ilhammeidi/portfolio');

    return Padding(
      padding: EdgeInsets.all(spacingUnit(2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Screen only available in the Bungalion Full version', style: ThemeText.title2, textAlign: TextAlign.center,),
          const VSpace(),
          Container(
            decoration: BoxDecoration(
              boxShadow: [ThemeShade.shadeMedium(context)],
              borderRadius: BorderRadiusGeometry.circular(20),
              border: Border.all(color: Theme.of(context).colorScheme.outlineVariant, width: 1)
            ),
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(19),
              child: Image.asset('assets/images/preview.jpg')
            )
          ),
          const VSpace(),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {
                _launchUrl(urlFullVersion);
              },
              style: ThemeButton.btnBig.merge(ThemeButton.invert(context)),
              child: Text('Get the Full Version', style: ThemeText.subtitle),
            )
          ),
          const VSpace(),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                Get.toNamed(AppLink.home);
              },
              style: ThemeButton.btnBig.merge(ThemeButton.outlinedInvert(context)),
              child: Text('Back to Home', style: ThemeText.subtitle),
            )
          ),
          SizedBox(height: 300)
        ],
      ),
    );
  }
}