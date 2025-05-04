import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:taskmate/core/constants/app_colors.dart';
import 'package:taskmate/core/constants/app_images.dart';
import 'package:taskmate/core/constants/app_sizes.dart';
import 'package:taskmate/features/chat/presentation/bloc/assistant_bloc.dart';

import '../../../../core/network/ask_me.dart';

class AssistantPage extends StatefulWidget {
  const AssistantPage({super.key});

  @override
  State<AssistantPage> createState() => _AssistantPageState();
}

class _AssistantPageState extends State<AssistantPage> {
  TextEditingController askMeCon = TextEditingController();
  final ValueNotifier<bool> isTextNotEmpty = ValueNotifier(false);
  final ValueNotifier<List<ChatMessage>> messages = ValueNotifier([]);
  String localData = "";

  @override
  void initState() {
    super.initState();
    askMeCon.addListener(() {
      isTextNotEmpty.value = askMeCon.text.trim().isNotEmpty;
    });
    context.read<AssistantBloc>().add(FetchLocalDataForAssistant());

    messages.value = [
      ChatMessage(
        text: "Hello! I'm your TaskMate assistant. How can I help you today?",
        isUser: false,
        timestamp: DateTime.now(),
      )
    ];
  }

  @override
  void dispose() {
    askMeCon.dispose();
    isTextNotEmpty.dispose();
    messages.dispose();
    super.dispose();
  }

  Future<void> _sendMessage() async {
    final message = askMeCon.text.trim();
    if (message.isEmpty) return;

    final userMessage = ChatMessage(
      text: message,
      isUser: true,
      timestamp: DateTime.now(),
    );
    messages.value = [...messages.value, userMessage];
    askMeCon.clear();

    final loadingMessage = ChatMessage(
      text: "Typing...",
      isUser: false,
      timestamp: DateTime.now(),
      isLoading: true,
    );
    messages.value = [...messages.value, loadingMessage];
    final loadingIndex = messages.value.length - 1; // last index

    try {
      final answer = await askMe(
        question: message,
        localData: localData,
      );

      final newMessages = List<ChatMessage>.from(messages.value);
      // replace loading message with actual answer
      newMessages[loadingIndex] = ChatMessage(
        text: answer,
        isUser: false,
        timestamp: DateTime.now(),
      );
      messages.value = newMessages;

      localData += answer;
    } catch (e) {
      // replace loading message with error message
      final newMessages = List<ChatMessage>.from(messages.value);
      newMessages[loadingIndex] = ChatMessage(
        text: "Sorry, I couldn't process your request. Please try again.",
        isUser: false,
        timestamp: DateTime.now(),
      );
      messages.value = newMessages;
      if (kDebugMode) print('Error: $e');
    }
  }

  void _handleQuickQuestion(String question) {
    askMeCon.text = question;
    _sendMessage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Assistant")),
      body: BlocListener<AssistantBloc, AssistantState>(
        listener: (context, state) {
          if(state is AssistantLocalDataSuccess){
            localData = state.localData;
          }
        },
        child: Column(
          children: [
            Expanded(
              child: ValueListenableBuilder<List<ChatMessage>>(
                valueListenable: messages,
                builder: (context, chatMessages, child) {
                  if (chatMessages.length == 1) {
                    return initialChatScreen();
                  }
                  return ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.paddingBody,
                      vertical: AppSizes.paddingBody,
                    ),
                    itemCount: chatMessages.length,
                    itemBuilder: (context, index) {
                      final message =
                          chatMessages[chatMessages.length - 1 - index];
                      return messageContainer(message);
                    },
                  );
                },
              ),
            ),
            inputField(),
          ],
        ),
      ),
    );
  }

  Widget initialChatScreen() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GradientText(
            'Hello!',
            style: TextStyle(
              fontSize: AppSizes.fontSizeMaxLarge,
            ),
            colors: [Color(0xff5f33e1), Color(0xff1488cc)],
          ),
          const SizedBox(height: AppSizes.paddingBody),
          GradientText(
            'I\'m your TaskMate assistant.\nHow can I help you today?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: AppSizes.fontSizeDefault,
            ),
            colors: [Color(0xff5f33e1), Color(0xff1488cc)],
          ),
          SizedBox(height: AppSizes.paddingBody * 2),
          InkWell(
            onTap: () => _handleQuickQuestion("Do I have a meeting tomorrow?"),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.paddingInside,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: AppColors.randomPastelColor().withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text("🤝 Do I have a meeting tomorrow?"),
            ),
          ),
          SizedBox(height: AppSizes.paddingInside),
          InkWell(
            onTap: () =>
                _handleQuickQuestion("What task do I have to do today?"),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.paddingInside,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: AppColors.randomPastelColor().withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text("📅 What task do I have to do today?"),
            ),
          ),
          SizedBox(height: AppSizes.paddingInside),
          InkWell(
            onTap: () =>
                _handleQuickQuestion("Do I have anything left to buy?"),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.paddingInside,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: AppColors.randomPastelColor().withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text("🛍️ Do I have anything left to buy?"),
            ),
          ),
        ],
      ),
    );
  }

  Widget messageContainer(ChatMessage message) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Align(
        alignment:
            message.isUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!message.isUser) ...[
              Column(
                children: [
                  SizedBox(
                    height: AppSizes.paddingInside,
                  ),
                  Icon(HugeIcons.strokeRoundedChatBot),
                ],
              ),
              const SizedBox(width: AppSizes.paddingInside),
            ],
            Flexible(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                padding: const EdgeInsets.all(AppSizes.paddingInside),
                decoration: BoxDecoration(
                  color: message.isUser ? null : AppColors.scaffoldBg,
                  gradient: message.isUser ? AppColors.gradient() : null,
                  boxShadow: [
                    if (!message.isUser)
                      BoxShadow(
                        color: const Color.fromRGBO(0, 0, 0, 0.16),
                        blurRadius: 2,
                        spreadRadius: 0,
                        offset: const Offset(0, 1),
                      ),
                  ],
                  borderRadius: BorderRadius.circular(AppSizes.cardRadius),
                ),
                child: message.isLoading
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                message.isUser ? Colors.white : Colors.grey,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            message.text,
                            style: TextStyle(
                              color: message.isUser ? Colors.white : null,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                    : message.isUser
                        ? Text(
                            message.text,
                            softWrap: true,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        : HtmlWidget(message.text,
                            textStyle: TextStyle(fontWeight: FontWeight.w500)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget inputField() {
    return Container(
      color: AppColors.scaffoldBg,
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.paddingBody,
        vertical: AppSizes.paddingInside,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: askMeCon,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                hintText: 'Ask me...',
                filled: true,
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(HugeIcons.strokeRoundedAiMic),
                    ),
                    ValueListenableBuilder<bool>(
                      valueListenable: isTextNotEmpty,
                      builder: (context, value, _) {
                        return value
                            ? IconButton(
                                onPressed: (){
                                  FocusScope.of(context).unfocus();
                                  _sendMessage();
                                },
                                icon: const Icon(Icons.send),
                              )
                            : const SizedBox.shrink();
                      },
                    ),
                  ],
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(style: BorderStyle.none),
                  borderRadius: BorderRadius.circular(100),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(style: BorderStyle.none),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              onFieldSubmitted: (value) => _sendMessage(),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isUser;
  final DateTime timestamp;
  final bool isLoading;

  ChatMessage({
    required this.text,
    required this.isUser,
    required this.timestamp,
    this.isLoading = false,
  });
}
