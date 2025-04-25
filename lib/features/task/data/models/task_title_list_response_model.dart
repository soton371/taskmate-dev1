// To parse this JSON data, do
//
//     final taskTitleListResponseModel = taskTitleListResponseModelFromJson(jsonString);

import 'dart:convert';

List<TaskTitleListResponseModel> taskTitleListResponseModelFromJson(String str) => List<TaskTitleListResponseModel>.from(json.decode(str).map((x) => TaskTitleListResponseModel.fromJson(x)));

String taskTitleListResponseModelToJson(List<TaskTitleListResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TaskTitleListResponseModel {
  final int? id;
  final String? taskTitle;
  final List<Task>? tasks;
  final int? todayRemainsTaskCount;
  final int? todayTotalTaskCount;

  TaskTitleListResponseModel({
    this.id,
    this.taskTitle,
    this.tasks,
    this.todayRemainsTaskCount,
    this.todayTotalTaskCount,
  });

  factory TaskTitleListResponseModel.fromJson(Map<String, dynamic> json) => TaskTitleListResponseModel(
    id: json["id"],
    taskTitle: json["task_title"],
    tasks: json["tasks"] == null ? [] : List<Task>.from(json["tasks"]!.map((x) => Task.fromJson(x))),
    todayRemainsTaskCount: json["today_remains_task_count"],
    todayTotalTaskCount: json["today_total_task_count"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "task_title": taskTitle,
    "tasks": tasks == null ? [] : List<dynamic>.from(tasks!.map((x) => x.toJson())),
    "today_remains_task_count": todayRemainsTaskCount,
    "today_total_task_count": todayTotalTaskCount,
  };
}

class Task {
  final int? id;
  final String? name;
  final String? details;
  final dynamic taskDateTime;
  final String? createdAt;
  final dynamic completedAt;

  Task({
    this.id,
    this.name,
    this.details,
    this.taskDateTime,
    this.createdAt,
    this.completedAt,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    id: json["id"],
    name: json["name"],
    details: json["details"],
    taskDateTime: json["task_date_time"],
    createdAt: json["created_at"],
    completedAt: json["completed_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "details": details,
    "task_date_time": taskDateTime,
    "created_at": createdAt,
    "completed_at": completedAt,
  };
}

