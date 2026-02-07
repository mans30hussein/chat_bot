import 'package:chat_bot/core/style/app_styles.dart';
import 'package:chat_bot/feature/chat/presentation/manager/chat_message_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/chat_message_cubit.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return 
         Padding(
          padding: EdgeInsets.only(
            // left: 30,
            // right: 30,
            bottom: MediaQuery.of(context).viewInsets.bottom + 12,
            top: 8,
          ),
          child: Card(
            color: Colors.white,
            elevation: 04,
            //shadowColor: Colors.transparent,
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.multiline,
              style: AppStyles.styleBold13,
              decoration: InputDecoration(
                //keyboardType: TextInputType.multiline,
                hintStyle: AppStyles.styleBold13.copyWith(
                  color: Color(0xffA1A1A1),
                ),

                hintText: "Type your message ...",
                suffixIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.mic, color: Color(0xffCECECE)),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.send, color: Color(0xff3369FF)),
                      onPressed: () {
                        final text = controller.text.trim();
                        if (text.isEmpty) return;
                        context.read<ChatCubit>().sendMessage(text);
                        controller.clear();
                      },
                    ),
                  ],
                ),
                fillColor: Colors.white,
                filled: true,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
        );
     
  }
}
