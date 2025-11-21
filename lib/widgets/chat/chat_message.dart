import 'package:ewallet_app/widgets/user/avatar_network.dart';
import 'package:flutter/material.dart';
import 'package:ewallet_app/models/chat.dart';
import 'package:ewallet_app/constants/app_const.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:get/route_manager.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({
    super.key,
    required this.chatMessages,
    required this.avatar,
    required this.name,
    required this.scrollCtrl,
    this.isAdmin = false
  });

  final List<MessageItem> chatMessages;
  final String avatar;
  final String name;
  final bool isAdmin;

  final ScrollController scrollCtrl;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollCtrl,
      itemCount: chatMessages.length,
      itemBuilder: (context, index) {
        return Padding(padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: ChatBuble(
            avatar: avatar,
            name: name,
            date: chatMessages[index].date,
            isMe: chatMessages[index].isMe,
            message: chatMessages[index].message,
            isAdmin: isAdmin,
          )
        );
      }
    );
  }
}

class ChatBuble extends StatelessWidget {
  const ChatBuble({
    super.key,
    required this.isMe,
    required this.name,
    required this.avatar,
    required this.message,
    required this.date,
    this.isAdmin = false
  });

  final bool isMe;
  final String name;
  final String message;
  final String avatar;
  final String date;
  final bool isAdmin;

  List<Widget> _bubleList(bool isMe, String message, String date, context) {
    final bool isDark = Get.isDarkMode;

    return [
      AvatarNetwork(
        radius: 30,
        backgroundImage: isMe ? userAccount.avatar : avatar
      ),
      Expanded(
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start, children: [
                Text(isMe ? 'Me' : name, style: const TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(width: 8),
                Text(date, style: ThemeText.caption),
              ]),
              SizedBox(height: 4,),
              Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  gradient: !isMe && isAdmin ? ThemePalette.gradientMixedAllMain : null,
                  borderRadius: BorderRadius.only(
                    topLeft: isMe ? const Radius.circular(20) : const Radius.circular(0),
                    topRight: isMe ? const Radius.circular(0) : const Radius.circular(20),
                    bottomLeft: const Radius.circular(24),
                    bottomRight: const Radius.circular(24),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: !isMe ? lighten(colorScheme(context).primaryContainer, isAdmin && !isDark ? 1 : 0.1) : null,
                    borderRadius: BorderRadius.only(
                      topLeft: isMe ? const Radius.circular(24) : const Radius.circular(0),
                      topRight: isMe ? const Radius.circular(0) : const Radius.circular(20),
                      bottomLeft: const Radius.circular(24),
                      bottomRight: const Radius.circular(24),
                    ),
                    border: Border.all(
                      width: 2,
                      color: isMe ? colorScheme(context).onInverseSurface : Colors.transparent
                    )
                  ),
                  child: Text(message, style: ThemeText.paragraph,)
                ),
              )
            ]
          )
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: isMe ?
        _bubleList(isMe, message, date, context).reversed.toList()
        : _bubleList(isMe, message, date, context),
    );
  }
}