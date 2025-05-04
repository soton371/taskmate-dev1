import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:isar/isar.dart';
import 'package:meta/meta.dart';
import 'package:taskmate/features/task/data/models/task_title_list_isar_model.dart';

import '../../../../core/services/db_services.dart';

part 'assistant_event.dart';
part 'assistant_state.dart';

class AssistantBloc extends Bloc<AssistantEvent, AssistantState> {
  AssistantBloc() : super(AssistantInitial()) {
    on<AssistantEvent>(_fetchLocalDataForAssistant);
  }

  Future<void> _fetchLocalDataForAssistant(AssistantEvent event, Emitter<AssistantState> emit) async {
    emit(AssistantLocalDataLoading());
    try {
      String localData = '';
      final db = DBServices.db;
      final tasks = await db.taskIsarModels.where().findAll();

      print("Tasks found: ${tasks.length}");
      for (var taskName in tasks) {
        print("Task name: ${taskName.name}");
      }

      if (tasks.isNotEmpty) {
        // Manually map to JSON
        final localDataList = tasks.map((task) {
          return {
            'id': task.id,
            'name': task.name,
            'details': task.details,
            'taskDateTime': task.taskDateTime,
            'createdAt': task.createdAt,
            'completedAt': task.completedAt,
          };
        }).toList();

        localData = jsonEncode(localDataList);
      }

      print("Serialized JSON: $localData");
      emit(AssistantLocalDataSuccess(localData));
    } catch (e, l) {
      print("Error: $e\nStacktrace: $l");
      emit(AssistantLocalDataFailed());
    }
  }

}
