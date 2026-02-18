import 'package:chat_bot/core/style/app_styles.dart';
import 'package:chat_bot/feature/chat/data/model/chat_model/gemini_chat_response.dart';
import 'package:chat_bot/feature/chat/presentation/manager/chat_message_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({super.key, required this.conversation});
  final List<ChatMessageModel> conversation;

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
  Widget build(BuildContext context) {
    // final sendMessageCubit = context.read<SendMessageCubit>();
    return Padding(
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
            hintStyle: AppStyles.styleBold13.copyWith(color: Color(0xffA1A1A1)),

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
                    if (controller.text.isNotEmpty) {
                      var message = ChatMessageModel.fromUserMessage(
                        controller.text,
                      );
                      widget.conversation.add(message);
                      context.read<SendMessageCubit>().sendMessage(
                        messages: widget.conversation,
                      );
                      controller.clear();
                    }
                    ;
                  },
                ),
              ],
            ),
            fillColor: Colors.white,
            filled: true,

            border: BiuldOutLineBorder(),
            focusedBorder: BiuldOutLineBorder(),
            enabledBorder: BiuldOutLineBorder(),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder BiuldOutLineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: Colors.white),
    );
  }
}
