import 'package:chat_bot/core/style/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back, color: Colors.black, size: 24),
      ),
      title: Row(
        children: [
          Image.asset(
            'assets/images/icon.png',
            width: 24,
            height: 36,
            color: Color(0xff3369FF),
          ),
          SizedBox(width: 24),
          Column(
            children: [
              Text(
                "ChatGPT",
                style: AppStyles.styleBold20.copyWith(color: Color(0xff3369FF)),
              ),
              Text(
                "Online",
                style: AppStyles.styleMedium15.copyWith(
                  color: Color(0xff3ABF38),
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ],
      ),

      actions: [
        IconButton(
          onPressed: () {},
          icon: FaIcon(
            FontAwesomeIcons.volumeHigh,
            color: Colors.black,

            size: 20,
          ),
        ),
        SizedBox(width: 8),
        Image.asset(
          'assets/images/export.jpg',
          width: 24,
          height: 24,
          //  color: Colors.black,
        ),
      ],
    );
  }
}
