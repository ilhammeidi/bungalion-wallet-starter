import 'package:ewallet_app/models/notification.dart';
import 'package:ewallet_app/screens/messages/notification_list.dart';
import 'package:ewallet_app/ui/themes/theme_breakpoints.dart';
import 'package:ewallet_app/widgets/header/top_decoration.dart';
import 'package:ewallet_app/widgets/tab_menu/tab_menu_basic.dart';
import 'package:flutter/material.dart';
import 'package:ewallet_app/models/chat.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:ewallet_app/widgets/chat/chat_list.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> with SingleTickerProviderStateMixin {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    int notifCount = notifList.where((item) => item.isRead == false).length;

    List<Widget> tabContent = [
      const NotificationList(),
      ChatList(data: chatListPersonal),
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        title: Text('Inbox', style: ThemeText.subtitle),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: ThemeSize.xs
            ),
            child: TabMenuBasic(
              menus: ['Notifications ($notifCount)', 'Messages'],
              current: _current,
              onSelect: (int index) {
                setState(() {
                  _current = index;
                });
              },
            )
          )
        ),
        flexibleSpace: TopDecoration(),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: spacingUnit(2)),
        child: tabContent[_current]
      )
    );
  }
}