import 'package:ewallet_app/ui/themes/theme_breakpoints.dart';
import 'package:ewallet_app/utils/check_platforms.dart';
import 'package:ewallet_app/widgets/profile/contact_panel.dart';
import 'package:ewallet_app/widgets/profile/favorites_grid.dart';
import 'package:ewallet_app/widgets/profile/latest_transactions.dart';
import 'package:ewallet_app/models/purchase_history.dart';
import 'package:ewallet_app/widgets/profile/news_list.dart';
import 'package:ewallet_app/widgets/profile/slider_counter.dart';
import 'package:flutter/material.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/widgets/settings/setting_list.dart';
import 'package:ewallet_app/widgets/profile/profile_banner_header.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _active = 0;

  final List<Widget> _content = [
    /// PROFILE WIDGETS
    Column(children: [
      SliderCounter(),
      VSpaceShort(),
      LatestTransactions(
        items: purchaseList,
        counts: 3,
      ),
      VSpaceBig(),
      ContactPanel(),
      VSpaceBig(),
      FavoritesGrid(),
      VSpace(),
      NewsList(),
      VSpace(),
    ]),

    /// SETTINGS
    Align(
      alignment: Alignment.center,
      child: Container(
        constraints: BoxConstraints(maxWidth: ThemeSize.sm),
        child: SettingList()
      )
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          delegate: ProfileBannerHeader(
            minExtent: topPadding + 120,
            maxExtent: isOnDesktopAndWeb() ? 300 : 350,
            current: _active,
            onSelect: (int val) {
              setState(() {
                _active = val;
              });
            }
          ),
          pinned: true,
        ),
        SliverToBoxAdapter(
          child: _content[_active]
        ),
        SliverPadding(padding: EdgeInsets.only(bottom: spacingUnit(12)))
      ],
    );
  }
}