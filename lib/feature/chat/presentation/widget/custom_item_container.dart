import 'package:chat_bot/feature/chat/data/const_models/prompot_item_model.dart';
import 'package:flutter/material.dart';

class CustomItemContainer extends StatelessWidget {
  const CustomItemContainer({super.key, required this.text});
  final String text ;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      //height: 40,
      margin: EdgeInsets.only(top: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffF4F4F4),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(text, textAlign: TextAlign.center),
    );
  }
}
