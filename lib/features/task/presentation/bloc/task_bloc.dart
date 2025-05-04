import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/services/db_services.dart';
import '../../../../core/utilities/app_date_time.dart';
import '../../data/models/task_title_list_isar_model.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final today = DateTime.now();

  TaskBloc() : super(TaskInitial()) {
    on<AddTaskEvent>(_addTask);
    on<GetRemainingTaskEvent>(_getRemainingTask);
    on<CompletedTaskActionEvent>(_completedTaskAction);
    on<DeleteTaskActionEvent>(_deleteTaskAction);
    on<UpdateTaskEvent>(_updateTask);
  }

  //for add task
  Future<void> _addTask(AddTaskEvent event, Emitter<TaskState> emit) async {
    final newTask =
        TaskIsarModel()
          ..name = event.name
          ..details = (event.details ?? '').isEmpty ? null : event.details
          ..taskDateTime = event.taskDateTime
          ..createdAt = DateTime.now().toIso8601String();

    int? totalRemainsTaskCount;
    totalRemainsTaskCount = event.taskTitleListIsarModel.totalRemainsTaskCount;
    if (totalRemainsTaskCount != null) {
      totalRemainsTaskCount++;
    } else {
      totalRemainsTaskCount = 1;
    }

    final db = DBServices.db;
    await db.writeTxn(() async {
      await db.taskIsarModels.put(newTask);
      event.taskTitleListIsarModel.totalRemainsTaskCount =
          totalRemainsTaskCount;
      event.taskTitleListIsarModel.tasks.add(newTask);
      await event.taskTitleListIsarModel.tasks.save();
      await db.taskTitleListIsarModels.put(event.taskTitleListIsarModel);
    });
    add(GetRemainingTaskEvent(event.taskTitleListIsarModel));
    if (kDebugMode) {
      print("New task created");
    }
  }

  //for end add task

  //for remaining task
  Future<void> _getRemainingTask(
    GetRemainingTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    await event.taskTitleListIsarModel.tasks.load();
    final taskList = event.taskTitleListIsarModel.tasks.toList();
    Map<String, List<TaskIsarModel>> grouped = {};
    for (var newTask in taskList) {
      if (newTask.completedAt == null) {
        String key = 'No date';
        if (newTask.taskDateTime == null) {
          key = 'No date';
          if (!grouped.containsKey(key)) {
            grouped[key] = [];
          }
          grouped[key]!.add(newTask);
        } else {
          DateTime taskDate = DateTime.parse(newTask.taskDateTime!);
          final taskDateOnly = DateTime(
            taskDate.year,
            taskDate.month,
            taskDate.day,
          );
          final todayOnly = DateTime(today.year, today.month, today.day);

          if (taskDateOnly == todayOnly) {
            key = 'Today';
          } else if (taskDateOnly.isBefore(todayOnly)) {
            key = 'Past';
          } else {
            key =
                formatDateTime(dateTime: taskDateOnly, format: 'E, d MMMM') ??
                'No date';
          }
          if (!grouped.containsKey(key)) {
            grouped[key] = [];
          }
          grouped[key]!.add(newTask);
        }
      }
    }
    emit(RemainingTaskSuccess(grouped));
    if (kDebugMode) {
      print("object _getRemainingTask");
    }
  }

  //for end remaining task

  //for completed task
  Future<void> _completedTaskAction(
    CompletedTaskActionEvent event,
    Emitter<TaskState> emit,
  ) async {
    int? totalCompletedTaskCount;
    int? totalRemainsTaskCount;
    totalCompletedTaskCount =
        event.taskTitleListIsarModel.totalCompletedTaskCount;
    totalRemainsTaskCount = event.taskTitleListIsarModel.totalRemainsTaskCount;
    if (totalCompletedTaskCount != null) {
      totalCompletedTaskCount++;
    } else {
      totalCompletedTaskCount = 1;
    }
    if (totalRemainsTaskCount != null && totalRemainsTaskCount > 0) {
      totalRemainsTaskCount--;
    } else {
      totalRemainsTaskCount = 0;
    }

    final db = DBServices.db;
    await db.writeTxn(() async {
      event.task.completedAt = DateTime.now().toIso8601String();
      await db.taskIsarModels.put(event.task);
      event.taskTitleListIsarModel.totalCompletedTaskCount =
          totalCompletedTaskCount;
      event.taskTitleListIsarModel.totalRemainsTaskCount =
          totalRemainsTaskCount;
      await db.taskTitleListIsarModels.put(event.taskTitleListIsarModel);
    });
    add(GetRemainingTaskEvent(event.taskTitleListIsarModel));
  }

  //for end completed task

  //for delete task
  Future<void> _deleteTaskAction(
    DeleteTaskActionEvent event,
    Emitter<TaskState> emit,
  ) async {
    int? totalCompletedTaskCount;
    int? totalRemainsTaskCount;
    totalCompletedTaskCount =
        event.taskTitleListIsarModel.totalCompletedTaskCount;
    totalRemainsTaskCount = event.taskTitleListIsarModel.totalRemainsTaskCount;
    if (totalCompletedTaskCount != null && totalCompletedTaskCount > 0) {
      totalCompletedTaskCount--;
    } else {
      totalCompletedTaskCount = 0;
    }
    if (totalRemainsTaskCount != null && totalRemainsTaskCount > 0) {
      totalRemainsTaskCount--;
    } else {
      totalRemainsTaskCount = 0;
    }
    final db = DBServices.db;
    await db.writeTxn(() async {
      await db.taskIsarModels.delete(event.task.id);
      event.taskTitleListIsarModel.totalCompletedTaskCount =
          totalCompletedTaskCount;
      event.taskTitleListIsarModel.totalRemainsTaskCount =
          totalRemainsTaskCount;
      await db.taskTitleListIsarModels.put(event.taskTitleListIsarModel);
    });
    add(GetRemainingTaskEvent(event.taskTitleListIsarModel));
  }
  //for end delete task

  //for update
  Future<void> _updateTask(UpdateTaskEvent event, Emitter<TaskState> emit)async{
    final db = DBServices.db;
    await db.writeTxn(() async {
      await db.taskIsarModels.put(event.task);
    });
    add(GetRemainingTaskEvent(event.taskTitleListIsarModel));
  }
  //for end update
}
