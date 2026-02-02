import 'package:chat_bot/core/style/app_styles.dart';
import 'package:chat_bot/feature/chat/presentation/widget/custom_item_container.dart';
import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
    required this.typeList,
    required this.image,
    required this.title,
  });
  final String image;
  final String title;
  final List<String> typeList;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Image.asset(
            image,
            width: 28,
            height: 28,
            fit: BoxFit.cover,
            color: Color(0xff292D32),
          ),
        ),
        SizedBox(height: 8),
        Text(title, style: AppStyles.styleBold14),
        //  SizedBox(height: 8),
        Wrap(
          children: typeList
              .map((item) => CustomItemContainer(text: item))
              .toList(),
        ),
      ],
    );
  }
}
