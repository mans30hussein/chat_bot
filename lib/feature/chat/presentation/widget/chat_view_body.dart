import 'package:chat_bot/core/style/app_styles.dart';
import 'package:chat_bot/feature/chat/data/const_models/prompot_item_model.dart';
import 'package:chat_bot/feature/chat/presentation/widget/custom_item_container.dart';
import 'package:chat_bot/feature/chat/presentation/widget/header_section.dart';
import 'package:flutter/material.dart';

import '../../data/const_models/list_prompot_item_model.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            child: Column(
              children: [
                HeaderSection(
                  typeList: sectionExplainPrompotItemModel,
                  image: 'assets/images/explain.png',
                  title: 'Explain',
                ),
                HeaderSection(
                  typeList: sectionEditPrompotItemModel,
                  image: 'assets/images/edit-2.png',
                  title: 'Edit',
                ),
                HeaderSection(
                  typeList: sectionTranslatePrompotItemModel,
                  image: 'assets/images/translate.png',
                  title: 'Translate',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
