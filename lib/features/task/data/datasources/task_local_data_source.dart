import 'package:isar/isar.dart';
import 'package:taskmate/features/task/data/models/task_title_list_isar_model.dart';

import '../../../../core/services/db_services.dart';

class TaskLocalDataSource{
  final db = DBServices.db;
  Future<void> saveTaskTitle(TaskTitleListIsarModel model) async {
    await db.writeTxn(() async {
      await db.taskTitleListIsarModels.put(model);
      await model.tasks.save();
    });
  }

  Future<void> deleteTaskTitle(int id) async {
    await db.writeTxn(() async {
      await db.taskTitleListIsarModels.delete(id);
    });
  }

  Future<List<TaskTitleListIsarModel>> getAllTaskTitles() async {
    return await db.taskTitleListIsarModels.where().findAll();
  }

  Future<void> updateTaskTitle(TaskTitleListIsarModel model) async {
    await db.writeTxn(() async {
      await db.taskTitleListIsarModels.put(model);
      await model.tasks.save();
    });
  }
}