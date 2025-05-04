part of 'assistant_bloc.dart';

@immutable
sealed class AssistantEvent {}

final class FetchLocalDataForAssistant extends AssistantEvent{}
