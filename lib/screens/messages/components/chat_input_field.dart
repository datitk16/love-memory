import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants.dart';

class ChatInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 32,
              color: Color(0xFF087949).withOpacity(0.08),
            )
          ]),
      child: SafeArea(
          child: Container(
        child: Row(
          children: [
            Icon(
              FontAwesomeIcons.microphone,
              color: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .color!
                  .withOpacity(0.64),
            ),
            SizedBox(width: kDefaultPadding / 4),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Type message",
                  border: InputBorder.none,
                ),
              ),
            ),
            Icon(
              FontAwesomeIcons.paperclip,
              color: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .color!
                  .withOpacity(0.64),
            ),
            SizedBox(width: kDefaultPadding / 4),
            Icon(
              FontAwesomeIcons.camera,
              color: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .color!
                  .withOpacity(0.64),
            ),
          ],
        ),
      )),
    );
  }
}
