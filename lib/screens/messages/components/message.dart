import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:love_memory/screens/messages/components/text_message.dart';

import '../../../constants.dart';
import '../../../models/ChatMessage.dart';

class Message extends StatelessWidget {
  final ChatMessage message;

  const Message({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    Widget messageContaint(ChatMessage message) {
      switch (message.messageType) {
        case ChatMessageType.text:
          return TextMessage(message: message);
        default:
          return SizedBox();
      }
    }

    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        mainAxisAlignment:
            message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isSender) ...[
            CircleAvatar(
              radius: 12,
              backgroundImage: AssetImage("assets/images/user_2.png"),
            ),
            SizedBox(width: kDefaultPadding / 2),
          ],
          messageContaint(message),
          if (message.isSender) MessageStatusDot(status: message.messageStatus)
        ],
      ),
    );
  }
}

class MessageStatusDot extends StatelessWidget {
  final MessageStatus? status;

  const MessageStatusDot({Key? key, this.status}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color dotColor(MessageStatus status) {
      switch (status) {
        case MessageStatus.not_sent:
          return kErrorColor;
        case MessageStatus.not_view:
          return Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.1);
        case MessageStatus.viewed:
          return kPrimaryColor;
        default:
          return Colors.transparent;
      }
    }

    return Container(
      margin: EdgeInsets.only(left: kDefaultPadding / 2),
      height: 12,
      width: 12,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: dotColor(status!),
        shape: BoxShape.circle,
      ),
      child: FaIcon(
        status == MessageStatus.not_sent
            ? FontAwesomeIcons.xmark
            : FontAwesomeIcons.check,
        size: 10,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}
