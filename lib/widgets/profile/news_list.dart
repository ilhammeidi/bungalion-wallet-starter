import 'package:ewallet_app/ui/themes/theme_breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:ewallet_app/models/news.dart';
import 'package:ewallet_app/widgets/cards/news_card.dart';
import 'package:ewallet_app/widgets/title/title_action.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key});

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Uri urlBlog = Uri.parse('https://verselion.ux-maestro.com/en/blog/');
    final Uri urlBlogDetail = Uri.parse('https://verselion.ux-maestro.com/en/blog/detail-blog/');
    const double cardHeight = 180;
  
    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
        child: TitleAction(
          title: 'You have to know',
          textAction: 'See All',
          onTap: () {
            _launchUrl(urlBlog);
          }
        ),
      ),
      SizedBox(height: spacingUnit(2)),
      SizedBox(
        height: cardHeight,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: newsList.length,
          padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
          itemBuilder: ((context, index) {
            News item = newsList[index];
            return Padding(
              padding: EdgeInsets.only(left: index == 0 ? 8 : 0, right: 8, bottom: 8),
              child: SizedBox(
                width: ThemeBreakpoints.smUp(context) ? 200 : 160,
                child: GestureDetector(
                  onTap: () {
                    _launchUrl(urlBlogDetail);
                  },
                  child: NewsCard(
                    thumb: item.thumb,
                    title: item.title,
                    date: item.date,
                  ),
                )
              ),
            );
          }),
        ),
      )
    ]);
  }
}