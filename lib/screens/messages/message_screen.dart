import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:love_memory/constants.dart';
import 'package:love_memory/screens/messages/components/body.dart';

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: appBar(), body: Body());
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.purpleAccent,
      leading: IconButton(
        icon: FaIcon(FontAwesomeIcons.angleLeft),
        iconSize: 20.0,
        onPressed: () {},
      ),
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/user_2.png"),
          ),
          SizedBox(
            width: kDefaultPadding * 0.75,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nguyen Dinh Dat',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Active 3m ago',
                style: TextStyle(
                  fontSize: 13,
                ),
              )
            ],
          )
        ],
      ),
      actions: [
        Row(
          children: [
            FaIcon(FontAwesomeIcons.phone),
            SizedBox(
              width: kDefaultPadding * 0.75,
            ),
            SizedBox(
              width: kDefaultPadding * 0.75,
            )
          ],
        )
      ],
    );
  }
}
