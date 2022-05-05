import 'package:flutter/material.dart';
import 'package:love_memory/constants.dart';
import 'package:love_memory/screens/messages/components/chat_input_field.dart';
import 'package:love_memory/screens/messages/components/message.dart';

import '../../../models/ChatMessage.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: ListView.builder(
            itemCount: demeChatMessages.length,
            itemBuilder: (context, index) =>
                Message(message: demeChatMessages[index]),
          ),
        )),
        ChatInputField()
      ],
    );
  }
}
