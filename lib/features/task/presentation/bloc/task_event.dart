part of 'task_bloc.dart';

@immutable
sealed class TaskEvent {}

final class AddTaskEvent extends TaskEvent{
  final String name;
  final TaskTitleListIsarModel taskTitleListIsarModel;
  final String? details;
  final String? taskDateTime;
  AddTaskEvent({required this.name, required this.taskTitleListIsarModel, this.details, this.taskDateTime});
}

final class GetRemainingTaskEvent extends TaskEvent{
  final TaskTitleListIsarModel taskTitleListIsarModel;
  GetRemainingTaskEvent(this.taskTitleListIsarModel);
}


final class CompletedTaskActionEvent extends TaskEvent{
  final TaskTitleListIsarModel taskTitleListIsarModel;
  final TaskIsarModel task;
  CompletedTaskActionEvent({required this.taskTitleListIsarModel, required this.task});
}


final class DeleteTaskActionEvent extends TaskEvent{
  final TaskTitleListIsarModel taskTitleListIsarModel;
  final TaskIsarModel task;
  DeleteTaskActionEvent({required this.taskTitleListIsarModel, required this.task});
}


final class UpdateTaskEvent extends TaskEvent{
  final TaskTitleListIsarModel taskTitleListIsarModel;
  final TaskIsarModel task;

  UpdateTaskEvent({required this.taskTitleListIsarModel, required this.task});
}

