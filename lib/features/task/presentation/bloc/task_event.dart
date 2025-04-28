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

final class GetRemainingTask extends TaskEvent{
  final TaskTitleListIsarModel taskTitleListIsarModel;
  GetRemainingTask(this.taskTitleListIsarModel);
}


final class CompletedTaskAction extends TaskEvent{
  final TaskTitleListIsarModel taskTitleListIsarModel;
  final TaskIsarModel task;
  CompletedTaskAction({required this.taskTitleListIsarModel, required this.task});
}
