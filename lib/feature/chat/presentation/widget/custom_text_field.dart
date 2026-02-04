import 'package:chat_bot/core/style/app_styles.dart';
import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.onPressed,
    required this.controller,
  });

  final void Function() onPressed;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        // left: 30,
        // right: 30,
        bottom: MediaQuery.of(context).viewInsets.bottom + 12,
        top: 8,
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.multiline,
        style: AppStyles.styleBold13,
        decoration: InputDecoration(
          //keyboardType: TextInputType.multiline,
          hintStyle: AppStyles.styleBold13.copyWith(color: Color(0xffA1A1A1)),

          hintText: "Type your message ...",
          suffixIcon: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(icon: const Icon(Icons.mic), onPressed: () {}),
              IconButton(icon: Icon(Icons.send), onPressed: onPressed),
            ],
          ),
          fillColor: Colors.white,
          filled: true,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
        ),
      ),
    );
  }
}
