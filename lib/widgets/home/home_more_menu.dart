import 'package:ewallet_app/app/app_link.dart';
import 'package:ewallet_app/constants/img_api.dart';
import 'package:ewallet_app/models/vendor.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:ewallet_app/utils/shimmer_preloader.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class HomeMoreMenu extends StatelessWidget {
  const HomeMoreMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: [
      /// MOBILE
      _buildGridItems(context, mobileVendors, mobileVendors.length, 'Topup Mobile Credit or Data Package', AppLink.mobilePurchase),
      LineSpace(),
    
      /// GAME
      _buildGridItems(context, gameVendors, gameVendors.length, 'Topup Games and Buy Various Items', AppLink.gamePurchase),
      LineSpace(),
    
      /// ELECTRIC
      Text('Electrical Billing and Prepaid Token', textAlign: TextAlign.start, style: ThemeText.subtitle2),
      SizedBox(height: spacingUnit(2),),
      Row(children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(AppLink.electricityPurchase);
          },
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(ImgApi.iconGrdElectric, width: 32,),
            SizedBox(height: 4,),
            Text('Electrical Billing', style: ThemeText.paragraph,)
          ]),
        ),
        SizedBox(width: spacingUnit(2)),
        GestureDetector(
          onTap: () {
            Get.toNamed(AppLink.electricityPurchase);
          },
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(ImgApi.iconGrdElectric, width: 32,),
            SizedBox(height: 4,),
            Text('Buy Token', style: ThemeText.paragraph,)
          ]),
        )
      ]),
      LineSpace(),
    
      /// INTERNET
      _buildGridItems(context, internetVendors, 5, 'Internet Billings', AppLink.internetList),
      LineSpace(),
    
      /// TV
      _buildGridItems(context, tvVendors, 5, 'TV Billings', AppLink.tvList),
      LineSpace(),
    
      /// EnTERTAINMENT
      _buildGridItems(context, entertainmentVendors, 5, 'Entertainment', AppLink.entertainmentPurchase),
      LineSpace(),
    
      /// EnTERTAINMENT
      _buildGridItems(context, appVendors, appVendors.length, 'Apps and Software', AppLink.appPurchase),
      LineSpace(),
    
      /// EDUCATION
      _buildGridItems(context, educationVendors, 5, 'Education', AppLink.educationPurchase),
      VSpaceShort(),
    ]);
  }

  Widget _buildGridItems(BuildContext context, List<Vendor> vendors, int length, String title, String route) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: ThemeText.subtitle2),
      SizedBox(height: spacingUnit(2),),
      GridView.builder(
        padding: EdgeInsets.zero,
        itemCount: length,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1,
        ),
        itemBuilder: (BuildContext context, int index) {
          Vendor item = vendors[index];
          return GestureDetector(
            onTap: () {
              Get.toNamed(route, arguments: {'vendorId': item.id});
            },
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              ClipRRect(
                borderRadius: ThemeRadius.small,
                child: Image.network(
                  item.logo,
                  width: 32,
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return SizedBox(
                      width: 32,
                      height: 32,
                      child: ShimmerPreloader()
                    );
                  },
                )
              ),
              SizedBox(height: 1,),
              Text(item.name, textAlign: TextAlign.center, style: ThemeText.caption, maxLines: 2, overflow: TextOverflow.ellipsis,)
            ]),
          );
        },
        clipBehavior: Clip.antiAlias,
      ),
    ]);
  }
}