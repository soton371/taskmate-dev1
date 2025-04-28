import 'package:isar/isar.dart';

part 'task_title_list_isar_model.g.dart';

@collection
class TaskTitleListIsarModel {
  Id id = Isar.autoIncrement;

  String? taskTitle;

  final tasks = IsarLinks<TaskIsarModel>();

  int? totalRemainsTaskCount;
  int? totalCompletedTaskCount;
}

@collection
class TaskIsarModel {
  Id id = Isar.autoIncrement;

  String? name;
  String? details;

  String? taskDateTime;
  String? createdAt;
  String? completedAt;
}
