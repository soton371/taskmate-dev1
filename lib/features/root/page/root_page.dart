import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:taskmate/features/more/page/more_page.dart';

import '../../../core/constants/app_colors.dart';
import '../../chat/pages/assistant_page.dart';
import '../../direct_message/page/direct_message_page.dart';
import '../../home/pages/home_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final List<Widget> _pages = [HomePage(), AssistantPage(), DirectMessagePage(), MorePage()];
  final ValueNotifier<int> indexNotifier = ValueNotifier<int>(0);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    indexNotifier.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: indexNotifier,
        builder: (context, value, child) => _pages[value],
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: indexNotifier,
        builder:
            (context, value, child) => Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.black12, width: 0.5),
                ),
              ),
              child: NavigationBar(
                selectedIndex: value,
                onDestinationSelected: (index) {
                  indexNotifier.value = index;
                },
                backgroundColor: AppColors.scaffoldBg,
                destinations: <Widget>[
                  NavigationDestination(
                    selectedIcon: Icon(
                      HugeIcons.strokeRoundedHome01,
                      color: AppColors.selected,
                    ),
                    icon: Icon(HugeIcons.strokeRoundedHome01),
                    label: 'Home',
                  ),
                  NavigationDestination(
                    selectedIcon: Icon(
                      HugeIcons.strokeRoundedChatBot,
                      color: AppColors.selected,
                    ),
                    icon: Icon(HugeIcons.strokeRoundedChatBot),
                    label: 'Assistant',
                  ),
                  NavigationDestination(
                    selectedIcon: Icon(
                      HugeIcons.strokeRoundedChatting01,
                      color: AppColors.selected,
                    ),
                    icon: Icon(HugeIcons.strokeRoundedChatting01),
                    label: 'Chat',
                  ),
                  NavigationDestination(
                    selectedIcon: Icon(
                      HugeIcons.strokeRoundedMoreHorizontal,
                      color: AppColors.selected,
                    ),
                    icon: Icon(HugeIcons.strokeRoundedMoreHorizontal),
                    label: 'More',
                  ),
                  /*NavigationDestination(
                    selectedIcon: Icon(
                      HugeIcons.strokeRoundedNotification01,
                      color: AppColors.selected,
                    ),
                    icon: Icon(HugeIcons.strokeRoundedNotification01),
                    label: 'Activity',
                  ),*/
                ],
              ),
            ),
      ),
    );
  }
}
