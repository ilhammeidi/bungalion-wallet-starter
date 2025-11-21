import 'package:ewallet_app/app/app_link.dart';
import 'package:ewallet_app/models/credit.dart';
import 'package:ewallet_app/models/package.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:ewallet_app/utils/check_platforms.dart';
import 'package:ewallet_app/widgets/home/partners_logo.dart';
import 'package:ewallet_app/widgets/product/package/package_list_slider.dart';
import 'package:ewallet_app/widgets/product/topup/topup_list_slider.dart';
import 'package:ewallet_app/widgets/promo/featured_promo_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:ewallet_app/constants/img_api.dart';
import 'package:ewallet_app/widgets/promo/promo_list_slider.dart';
import 'package:ewallet_app/widgets/promo/ads_banner.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/widgets/promo/banner_promo.dart';
import 'package:ewallet_app/widgets/promo/header_promo.dart';
import 'package:ewallet_app/widgets/promo/search.dart';
import 'package:get/route_manager.dart';

class PromoScreen extends StatefulWidget {
  const PromoScreen({super.key});

  @override
  State<PromoScreen> createState() => _PromoScreenState();
}

class _PromoScreenState extends State<PromoScreen> {
  final ScrollController _scrollref = ScrollController();
  bool _isFixed = false;

  void _showInitialDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          contentPadding: EdgeInsets.all(spacingUnit(1)),
          insetPadding: EdgeInsets.zero,
          content: Stack(children: [
            Padding(
              padding: EdgeInsets.all(spacingUnit(2)),
              child: ClipRRect(
                borderRadius: ThemeRadius.big,
                child: GestureDetector(
                  child: Image.network(ImgApi.photo[145], width: 400,),
                  onTap: () {
                    Get.toNamed(AppLink.promoDetail);
                  },
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.all(8),
                  shape: const CircleBorder(),
                ),
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.close, color: Colors.black,)
              ),
            )
          ])
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showInitialDialog();
    });
  }

  @override
  void dispose() {
    _scrollref.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scrollref.addListener(() {
      setState(() {
        if(_scrollref.offset > 100) {
          _isFixed = true;
        } else {
          _isFixed = false;
        }
      });
    });

    final List<Package> faturedGameList = [
      gamePackages[0],
      gamePackages[9],
      gamePackages[4],
      gamePackages[10],
      gamePackages[7],
    ];
    final List<Package> packageEntertainmentList = [
      entertainmentPackages[0],
      entertainmentPackages[3],
      entertainmentPackages[6],
      entertainmentPackages[1],
      entertainmentPackages[2],
    ];
    final List<Credit> appCreditList = appCredits;

    final List<Package> faturedEntertainmentList = entertainmentPackages.sublist(0, 5);
    final List<Package> appPackageList = appPackages.sublist(0, 5);
    final List<Credit> educationCreditList = educationCredits;
    
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: colorScheme(context).surfaceContainerLow.withValues(alpha: _isFixed ? 1 : 0),
        automaticallyImplyLeading: false,
        toolbarHeight: isOnAndorid() ? 20 : 1,
        surfaceTintColor: Colors.transparent,
      ),
      body: CustomScrollView(
        controller: _scrollref,
        slivers: [
          SliverToBoxAdapter(child: Stack(
            alignment: Alignment.topCenter,
            children: [
              BannerPromo(),
              Padding(
                padding: EdgeInsets.only(top: isOnDesktopAndWeb() ? 0 : 40),
                child: HeaderPromo(),
              )
            ]
          )),
          /// MINI MAP
          SliverStickyHeader.builder(
            sticky: true,
            builder: (context, state) {
              /// SEARCH
              return Padding(
                padding: EdgeInsets.only(top: isOnDesktopAndWeb() ? 0 : 48),
                child: const SearchPromo(),
              );
            },
            /// PROMO AND EVENT LIST
            sliver: SliverList(delegate: SliverChildListDelegate([
            
              /// PROMO
              VSpace(),
              const PromoListSlider(),
              const VSpaceShort(),
            
              /// VENDOR DEALS
              const PartnersLogo(),
              const VSpaceBig(),
            
              /// PROMO GAME LIST SLIDER
              AdsBanner(img: ImgApi.photo[243]),
              const VSpaceBig(),
              FeaturedPromoList(items: faturedGameList, title: 'Featured Game Vouchers'),
              const VSpaceBig(),
            
              /// PROMO MOBILE PACKAGE AND CREDIT
              PackageListSlider(
                title: 'Apps Package Promo',
                packageList: appPackageList,
                coverHeadline: 'APPS',
                coverTitle: 'Top trending apps package',
                coverImg: ImgApi.promoApps,
                withCover: true,
                onViewAll: () {
                  Get.toNamed(AppLink.appList);
                },
              ),
              const VSpaceBig(),
              TopupListSlider(
                title: 'App Credit Vouchers',
                creditList: appCreditList,
                withCover: false,
                category: 'app',
                creditType: CreditType.coin,
                onViewAll: () {
                  Get.toNamed(AppLink.appList);
                },
              ),
              const VSpaceBig(),
            
              /// ENTERTAINEMNT PROMO
              AdsBanner(img: ImgApi.photo[244]),
              const VSpaceBig(),
              FeaturedPromoList(items: faturedEntertainmentList, title: 'Featured Entertainment'),
              const VSpaceBig(),
              PackageListSlider(
                title: 'Streaming Package Promo',
                packageList: packageEntertainmentList,
                coverHeadline: 'APPS',
                coverTitle: 'Top podcasts and films',
                coverImg: ImgApi.promoEntertainment,
                withCover: true,
                onViewAll: () {
                  Get.toNamed(AppLink.appList);
                },
              ),
              const VSpaceBig(),
            
              /// EDUCATION CREDIT PROMO
              AdsBanner(img: ImgApi.photo[256]),
              const VSpaceBig(),
              TopupListSlider(
                title: 'Education Credit Vouchers',
                creditList: educationCreditList,
                withCover: false,
                category: 'education',
                creditType: CreditType.coin,
                onViewAll: () {
                  Get.toNamed(AppLink.educationList);
                },
              ),
              SizedBox(height: 120)
            ]))
          ),
        ],
      )
    );
  }
}