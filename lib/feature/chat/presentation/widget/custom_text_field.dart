import 'package:chat_bot/core/style/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 30,
        right: 30,
        bottom: MediaQuery.of(context).viewInsets.bottom + 12,
        top: 8,
      ),
      child: TextField(
        
        decoration: InputDecoration(
          hintStyle: AppStyles.styleBold13,
          hintText: "Type your message ...",
          suffixIcon: Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.mic
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.send
                ),
                onPressed: () {},
              ),
            ],
          ),
          //   fillColor: Colors.white,
          filled: true,
          
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            //  borderSide: BorderSide(color: Colors.grey.shade300),
          ),
        ),
      ),
    );
  }
}
