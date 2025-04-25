import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:taskmate/core/constants/app_colors.dart';
import 'package:taskmate/core/constants/app_images.dart';
import 'package:taskmate/core/constants/app_sizes.dart';

class AssistantPage extends StatefulWidget {
  const AssistantPage({super.key});

  @override
  State<AssistantPage> createState() => _AssistantPageState();
}

class _AssistantPageState extends State<AssistantPage> {
  TextEditingController askMeCon = TextEditingController();
  final ValueNotifier<bool> isTextNotEmpty = ValueNotifier(false);
  final ValueNotifier<bool> sentNotifier = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    askMeCon.addListener(() {
      isTextNotEmpty.value = askMeCon.text.trim().isNotEmpty;
    });
  }

  @override
  void dispose() {
    askMeCon.dispose();
    isTextNotEmpty.dispose();
    sentNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Assistant")),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: sentNotifier,
              builder: (_, value, child) {
                return value
                    ? ListView(
                      reverse: true,
                      padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingBody),
                      children: [
                        SizedBox(height: 100),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(AppImages.geminiAi, height: 20,width: 20,),
                              SizedBox(width: AppSizes.paddingInside,),
                              IntrinsicWidth(
                                child: Container(
                                  constraints: BoxConstraints(
                                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                                  ),
                                  padding: EdgeInsets.all(AppSizes.paddingInside),
                                  decoration: BoxDecoration(
                                    color: AppColors.scaffoldBg,
                                    boxShadow: [
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
                                    "You have a meeting with your team at 5:00 pm\n\nThere is no next open time slot",
                                    softWrap: true,
                                    style: TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: AppSizes.paddingBody),
                        Align(
                          alignment: Alignment.centerRight,
                          child: IntrinsicWidth(
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width * 0.7,
                              ),
                              padding: EdgeInsets.all(AppSizes.paddingInside),
                              decoration: BoxDecoration(
                                gradient: AppColors.gradient(),
                                borderRadius: BorderRadius.circular(
                                  AppSizes.cardRadius,
                                ),
                              ),
                              child: Text(
                                "Am i busy Monday at 5 pm",
                                softWrap: true,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                    : Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GradientText(
                                'Hello, Soton',
                                style: TextStyle(fontSize: AppSizes.fontSizeMaxLarge),
                                colors: [Color(0xff5f33e1), Color(0xff1488cc)],
                              ),
                              SvgPicture.asset(AppImages.geminiAi, height: 30,width: 30,),
                            ],
                          ),
                          SizedBox(height: AppSizes.paddingBody,),
                          InkWell(
                            onTap: (){
                              askMeCon.clear();
                              sentNotifier.value = true;
                              FocusScope.of(context).unfocus();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingInside, vertical: 5),
                                decoration: BoxDecoration(
                                  color: AppColors.randomPastelColor().withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(8)
                                ),
                                child: Text("🤝 Do I have a meeting tomorrow?",)),
                          ),
                          SizedBox(height: AppSizes.paddingInside,),
                          InkWell(
                            onTap: (){
                              askMeCon.clear();
                              sentNotifier.value = true;
                              FocusScope.of(context).unfocus();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingInside, vertical: 5),
                                decoration: BoxDecoration(
                                  color: AppColors.randomPastelColor().withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(8)
                                ),
                                child: Text("📅 What task do I have to do today?",)),
                          ),
                          SizedBox(height: AppSizes.paddingInside,),
                          InkWell(
                            onTap: (){
                              askMeCon.clear();
                              sentNotifier.value = true;
                              FocusScope.of(context).unfocus();
                            },
                            child: Container(
                                padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingInside, vertical: 5),
                                decoration: BoxDecoration(
                                    color: AppColors.randomPastelColor().withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: Text("🛍️ Do I have anything left to buy?",)),
                          ),
                        ],
                      ),
                    );
              },
            ),
          ),
          Container(
            color: AppColors.scaffoldBg,
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.paddingBody,
              vertical: AppSizes.paddingInside,
            ),
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
                          onPressed: () {
                            askMeCon.clear();
                            sentNotifier.value = true;
                            FocusScope.of(context).unfocus();
                          },
                          icon: Icon(Icons.send),
                        )
                            : SizedBox.shrink();
                      },
                    ),
                  ],
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.none),
                  borderRadius: BorderRadius.circular(100),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.none),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
