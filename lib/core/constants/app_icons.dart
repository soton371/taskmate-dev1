import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import 'app_values.dart';

class AppIcons{
  static const IconData session = HugeIcons.strokeRoundedUserMultiple;
  static const IconData project = HugeIcons.strokeRoundedLayers01;
  static const IconData communication = HugeIcons.strokeRoundedBubbleChatNotification;
  static const IconData task = HugeIcons.strokeRoundedTick03;
  static const IconData search = HugeIcons.strokeRoundedSearch01;
  static const IconData filter = HugeIcons.strokeRoundedFilterHorizontal;
  static const IconData smile = HugeIcons.strokeRoundedSmile;
  static const IconData notificationOff = HugeIcons.strokeRoundedNotificationOff03;
  static const IconData userInactive = HugeIcons.strokeRoundedUserBlock01;
  static const IconData logout = HugeIcons.strokeRoundedLogout01;
  static const IconData reminder = HugeIcons.strokeRoundedAlarmClock;
  static const IconData user = HugeIcons.strokeRoundedUser;
  static const IconData connect = HugeIcons.strokeRoundedShareKnowledge;
  static const IconData tick = HugeIcons.strokeRoundedTick02;
  static const IconData send = HugeIcons.strokeRoundedNavigation03;
  static const IconData delete = HugeIcons.strokeRoundedDelete03;
  static const IconData edit = HugeIcons.strokeRoundedEdit02;
  static const IconData cancel = HugeIcons.strokeRoundedCancel01;
  static const IconData upDown = HugeIcons.strokeRoundedArrowUpDown;
  static const IconData calculator = HugeIcons.strokeRoundedCalculator01;
  static const IconData create = HugeIcons.strokeRoundedPencilEdit02;
  static const IconData taskAdd = HugeIcons.strokeRoundedTaskAdd01;
  static const IconData add = HugeIcons.strokeRoundedAdd02;
  static const IconData list = HugeIcons.strokeRoundedLeftToRightListBullet;


  static IconData findIcon(CategoryType category){
    switch(category){
      case CategoryType.session:
        return session;
      case CategoryType.communication:
        return communication;
      default:
        return project;
    }
  }

  static IconData timeIcon({required DateTime? createdAt, required DateTime? remainedAt,required DateTime? completedAt}){
    if(completedAt != null){
      return Icons.check;
    }else if(remainedAt != null){
      return Icons.alarm;
    }else{
      return Icons.access_time;
    }
  }
}