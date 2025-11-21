import 'package:ewallet_app/constants/img_api.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/utils/no_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ewallet_app/models/chat.dart';
import 'package:ewallet_app/screens/messages/chat.dart';
import 'package:ewallet_app/widgets/chat/chat_item.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key, required this.data});

  final List<Chat> data;

  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty ? ListView.builder(
      itemCount: data.length,
      padding: EdgeInsets.only(bottom: spacingUnit(3)),
      itemBuilder: ((BuildContext context, int index) {
        Chat item = data[index];
        return ChatItem(
          avatar: item.avatar,
          name: item.name,
          message: item.messages[0].message,
          date: item.messages[0].date,
          isLast: true,
          onTap: () {
            Get.to(() => ChatPage(
              messageData: item.messages,
              name: item.name,
              avatar: item.avatar
            ));
          },
        );
      })
    ) : _emptyList(context);
  }

  Widget _emptyList(BuildContext context) {
    return NoData(
      image: ImgApi.nodataMessage,
      title: 'No Message Yet',
      desc: 'Nulla condimentum pulvinar arcu a pellentesque.',
    );
  }
}