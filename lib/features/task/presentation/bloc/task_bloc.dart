import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import '../../../../core/services/db_services.dart';
import '../../../../core/utilities/app_date_time.dart';
import '../../data/models/task_title_list_isar_model.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final today = DateTime.now();
  TaskBloc() : super(TaskInitial()) {
    on<AddTaskEvent>(_addTask);
    on<GetRemainingTask>(_getRemainingTask);
    on<CompletedTaskAction>(_completedTaskAction);
  }

  //for add task
  Future<void> _addTask(AddTaskEvent event, Emitter<TaskState> emit)async{
    final newTask =
    TaskIsarModel()
      ..name = event.name
      ..details = (event.details??'').isEmpty ? null : event.details
      ..taskDateTime = event.taskDateTime
      ..createdAt = DateTime.now().toIso8601String();

    int? todayRemainsTaskCount;
      todayRemainsTaskCount = event.taskTitleListIsarModel.totalRemainsTaskCount;
      if(todayRemainsTaskCount != null){
        todayRemainsTaskCount ++;
      }else{
        todayRemainsTaskCount = 1;
      }


    final db = DBServices.db;
    await db.writeTxn(() async {
      await db.taskIsarModels.put(newTask);
      event.taskTitleListIsarModel.totalRemainsTaskCount = todayRemainsTaskCount;
      event.taskTitleListIsarModel.tasks.add(newTask);
      await event.taskTitleListIsarModel.tasks.save();
      await db.taskTitleListIsarModels.put(event.taskTitleListIsarModel);
    });
    add(GetRemainingTask(event.taskTitleListIsarModel));
    if (kDebugMode) {
      print("New task created");
    }
  }
  //for end add task

  //for remaining task
  Future<void> _getRemainingTask(GetRemainingTask event, Emitter<TaskState> emit)async{
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
  Future<void> _completedTaskAction(CompletedTaskAction event, Emitter<TaskState> emit)async{
    int? todayCompletedTaskCount;
    int? todayRemainsTaskCount;
    todayCompletedTaskCount =
        event
            .taskTitleListIsarModel
            .totalCompletedTaskCount;
    todayRemainsTaskCount =
        event
            .taskTitleListIsarModel
            .totalRemainsTaskCount;
    if (todayCompletedTaskCount != null) {
      todayCompletedTaskCount++;
    } else {
      todayCompletedTaskCount = 1;
    }
    if (todayRemainsTaskCount != null) {
      todayRemainsTaskCount--;
    } else {
      todayRemainsTaskCount = 0;
    }

    final db = DBServices.db;
    await db.writeTxn(() async {
      event.task.completedAt =
          DateTime.now().toIso8601String();
      await db.taskIsarModels.put(event.task);
      event
          .taskTitleListIsarModel
          .totalCompletedTaskCount =
          todayCompletedTaskCount;
      event
          .taskTitleListIsarModel
          .totalRemainsTaskCount =
          todayRemainsTaskCount;
      await db.taskTitleListIsarModels.put(
        event.taskTitleListIsarModel,
      );
    });
    add(GetRemainingTask(event.taskTitleListIsarModel));
  }
  //for end completed task
}
