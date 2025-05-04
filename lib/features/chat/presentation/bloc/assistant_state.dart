part of 'assistant_bloc.dart';

@immutable
sealed class AssistantState {}

final class AssistantInitial extends AssistantState {}

final class AssistantLocalDataLoading extends AssistantState {}

final class AssistantLocalDataSuccess extends AssistantState {
  final String localData;
  AssistantLocalDataSuccess(this.localData);
}

final class AssistantLocalDataFailed extends AssistantState {}
