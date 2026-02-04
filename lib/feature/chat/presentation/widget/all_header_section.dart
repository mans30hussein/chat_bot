import 'package:chat_bot/core/utils/assets.dart';
import 'package:chat_bot/feature/chat/presentation/widget/header_section.dart';
import 'package:flutter/material.dart';

import '../../data/model/list_prompot/list_prompot_item_model.dart';

class AllHeaderSection extends StatelessWidget {
  const AllHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderSection(
          typeList: sectionExplainPrompotItemModel,
          image: Assets.explain,
          title: 'Explain',
        ),
        HeaderSection(
          typeList: sectionEditPrompotItemModel,
          image: Assets.edit,
          title: 'Edit',
        ),
        HeaderSection(
          typeList: sectionTranslatePrompotItemModel,
          image:Assets.translate,
          title: 'Translate',
        ),
      ],
    );
  }
}
