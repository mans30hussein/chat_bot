import 'package:chat_bot/feature/chat/presentation/widget/all_header_section.dart';
import 'package:chat_bot/feature/chat/presentation/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 12,
                  ),
                  child: AllHeaderSection(),
                ),
              ),
            ],
          ),
        ),

        CustomTextField(),
      ],
    );
  }
}
