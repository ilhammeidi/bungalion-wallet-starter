import 'package:ewallet_app/app/app_link.dart';
import 'package:ewallet_app/widgets/app_button/back_icon_button.dart';
import 'package:ewallet_app/widgets/header/top_decoration.dart';
import 'package:ewallet_app/widgets/user/avatar_network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ewallet_app/models/chat.dart';
import 'package:ewallet_app/ui/layouts/general_layout.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:ewallet_app/widgets/action_header/other_btn.dart';
import 'package:ewallet_app/widgets/chat/chat_input.dart';
import 'package:ewallet_app/widgets/chat/chat_message.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.messageData, required this.name, required this.avatar});

  final List<MessageItem> messageData;
  final String name;
  final String avatar;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<MessageItem> initMsg = [];
  final _scrollController = ScrollController();

  void _sendMessage(MessageItem message){
    setState(() {
      initMsg.add(message);
    });

    /// Scroll to bottom
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent + kToolbarHeight + kBottomNavigationBarHeight + 32,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn
    );
  }

  @override
  void initState() {
    initMsg = widget.messageData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralLayout(
      content: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          titleSpacing: 0,
          leading: BackIconButton(
            onTap: () {
              Get.back();
            },
          ),
          centerTitle: true,
          title: GestureDetector(
            onTap: () {
              Get.toNamed(AppLink.profile);
            },
            child: Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
              AvatarNetwork(
                radius: 12,
                backgroundImage: widget.avatar
              ),
              SizedBox(width: 4),
              Text(widget.name, style: ThemeText.subtitle),
            ]),
          ),
          flexibleSpace: TopDecoration(),
          actions: const [
            OtherBtn()
          ],
        ),
        body: Column(children: [
          Expanded(
            child: ChatMessage(
              avatar: widget.avatar,
              name: widget.name,
              chatMessages: initMsg,
              scrollCtrl: _scrollController
            )
          ),
          ChatInput(sendMsg: _sendMessage),
        ]),
      ),
    );
  }
}