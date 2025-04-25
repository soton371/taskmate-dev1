import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../features/task/data/models/task_title_list_isar_model.dart';


class DBServices{
  static late final Isar db;

  static Future<void> setup()async{
    final dir = await getApplicationDocumentsDirectory();
    db = await Isar.open(
      [TaskTitleListIsarModelSchema, TaskIsarModelSchema],
      directory: dir.path,
    );
  }
}

