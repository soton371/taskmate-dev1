part of 'task_bloc.dart';

@immutable
sealed class TaskState {}

final class TaskInitial extends TaskState {}

//for add task
final class AddTaskLoading extends TaskState {}

final class AddTaskSuccess extends TaskState {}

final class AddTaskFailure extends TaskState {
  final String message;
  AddTaskFailure(this.message);
}
//end for add task

//for remaining task view
final class RemainingTaskLoading extends TaskState {
  final Map<String, List<TaskIsarModel>> groupedTask;
  RemainingTaskLoading(this.groupedTask);
}

final class RemainingTaskSuccess extends TaskState {
  final Map<String, List<TaskIsarModel>> groupedTask;
  RemainingTaskSuccess(this.groupedTask);
}
//for end  remaining task view