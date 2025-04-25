import 'package:flutter/material.dart';
import 'package:taskmate/core/constants/app_colors.dart';
import 'package:taskmate/features/direct_message/widget/message_input_field.dart';

import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_sizes.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final List<Map<String, dynamic>> messages = [
    {'text': 'I\'m good, thanks.', 'isMe': true},
    {'text': 'How are you?', 'isMe': false},
    {'text': 'Hello!', 'isMe': true},
    {'text': 'Hey!', 'isMe': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                AppSizes.cardRadius,
              ),
              child: Image.asset(
                AppImages.user,
                height: 30,
                width: 30,
              ),
            ),
            SizedBox(width: AppSizes.paddingInside,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Soton Ahmed"),
                Text("Active 3m ago",style: TextStyle(fontSize: AppSizes.fontSizeSmall, color: AppColors.subtitle, fontWeight: FontWeight.normal),),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              reverse: true, // latest message at bottom
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isMe = message['isMe'] as bool;
                return Align(
                  alignment:
                  isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if(!isMe)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                            3,
                          ),
                          child: Image.asset(
                            AppImages.user,
                            height: 15,
                            width: 15,
                          ),
                        ),
                      if(!isMe)
                        SizedBox(width: 8,),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 14),
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.scaffoldBg,
                              gradient: isMe ? AppColors.gradient() : null,
                              boxShadow: isMe ? null : [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.16),
                                  blurRadius: 2,
                                  spreadRadius: 0,
                                  offset: Offset(0, 1),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(
                                AppSizes.cardRadius,
                              ),
                            ),
                            child: Text(
                              message['text'],
                              style: TextStyle(
                                color: isMe ? Colors.white : Colors.black87,
                              ),
                            ),
                          ),
                          if(isMe && index == 0)
                            Text("Seen",style: TextStyle(color: AppColors.subtitle, fontSize: AppSizes.fontSizeExtraSmall),)
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          MessageInputField(),
        ],
      ),
    );
  }
}
