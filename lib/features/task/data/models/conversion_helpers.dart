

import 'package:isar/isar.dart';
import 'package:taskmate/features/task/data/models/task_title_list_isar_model.dart';

import 'task_title_list_response_model.dart';

TaskTitleListIsarModel fromResponseModel(TaskTitleListResponseModel model) {
  final isarModel = TaskTitleListIsarModel()
    ..id = model.id ?? Isar.autoIncrement
    ..taskTitle = model.taskTitle
    ..totalRemainsTaskCount = model.totalRemainsTaskCount
    ..totalCompletedTaskCount = model.totalCompletedTaskCount;

  final tasks = model.tasks?.map(fromTaskModel).toList() ?? [];

  isarModel.tasks.addAll(tasks);
  return isarModel;
}

TaskIsarModel fromTaskModel(Task task) {
  return TaskIsarModel()
    ..id = task.id ?? Isar.autoIncrement
    ..name = task.name
    ..details = task.details
    ..taskDateTime = task.taskDateTime
    ..createdAt = task.createdAt
    ..completedAt = task.completedAt;
}

