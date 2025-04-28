// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_title_list_isar_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTaskTitleListIsarModelCollection on Isar {
  IsarCollection<TaskTitleListIsarModel> get taskTitleListIsarModels =>
      this.collection();
}

const TaskTitleListIsarModelSchema = CollectionSchema(
  name: r'TaskTitleListIsarModel',
  id: -5120928808794908616,
  properties: {
    r'taskTitle': PropertySchema(
      id: 0,
      name: r'taskTitle',
      type: IsarType.string,
    ),
    r'todayCompletedTaskCount': PropertySchema(
      id: 1,
      name: r'todayCompletedTaskCount',
      type: IsarType.long,
    ),
    r'todayRemainsTaskCount': PropertySchema(
      id: 2,
      name: r'todayRemainsTaskCount',
      type: IsarType.long,
    )
  },
  estimateSize: _taskTitleListIsarModelEstimateSize,
  serialize: _taskTitleListIsarModelSerialize,
  deserialize: _taskTitleListIsarModelDeserialize,
  deserializeProp: _taskTitleListIsarModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'tasks': LinkSchema(
      id: -1681521340189900939,
      name: r'tasks',
      target: r'TaskIsarModel',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _taskTitleListIsarModelGetId,
  getLinks: _taskTitleListIsarModelGetLinks,
  attach: _taskTitleListIsarModelAttach,
  version: '3.1.0+1',
);

int _taskTitleListIsarModelEstimateSize(
  TaskTitleListIsarModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.taskTitle;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _taskTitleListIsarModelSerialize(
  TaskTitleListIsarModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.taskTitle);
  writer.writeLong(offsets[1], object.totalCompletedTaskCount);
  writer.writeLong(offsets[2], object.totalRemainsTaskCount);
}

TaskTitleListIsarModel _taskTitleListIsarModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TaskTitleListIsarModel();
  object.id = id;
  object.taskTitle = reader.readStringOrNull(offsets[0]);
  object.totalCompletedTaskCount = reader.readLongOrNull(offsets[1]);
  object.totalRemainsTaskCount = reader.readLongOrNull(offsets[2]);
  return object;
}

P _taskTitleListIsarModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _taskTitleListIsarModelGetId(TaskTitleListIsarModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _taskTitleListIsarModelGetLinks(
    TaskTitleListIsarModel object) {
  return [object.tasks];
}

void _taskTitleListIsarModelAttach(
    IsarCollection<dynamic> col, Id id, TaskTitleListIsarModel object) {
  object.id = id;
  object.tasks.attach(col, col.isar.collection<TaskIsarModel>(), r'tasks', id);
}

extension TaskTitleListIsarModelQueryWhereSort
    on QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel, QWhere> {
  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TaskTitleListIsarModelQueryWhere on QueryBuilder<
    TaskTitleListIsarModel, TaskTitleListIsarModel, QWhereClause> {
  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel,
      QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel,
      QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TaskTitleListIsarModelQueryFilter on QueryBuilder<
    TaskTitleListIsarModel, TaskTitleListIsarModel, QFilterCondition> {
  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel,
      QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel,
      QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel,
      QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel,
      QAfterFilterCondition> taskTitleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'taskTitle',
      ));
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel,
      QAfterFilterCondition> taskTitleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'taskTitle',
      ));
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel,
      QAfterFilterCondition> taskTitleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taskTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel,
      QAfterFilterCondition> taskTitleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taskTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel,
      QAfterFilterCondition> taskTitleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taskTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel,
      QAfterFilterCondition> taskTitleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taskTitle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel,
      QAfterFilterCondition> taskTitleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'taskTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel,
      QAfterFilterCondition> taskTitleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'taskTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel,
          QAfterFilterCondition>
      taskTitleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'taskTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel,
          QAfterFilterCondition>
      taskTitleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'taskTitle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel,
      QAfterFilterCondition> taskTitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taskTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel,
      QAfterFilterCondition> taskTitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'taskTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel,
      QAfterFilterCondition> todayCompletedTaskCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'todayCompletedTaskCount',
      ));
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel,
      QAfterFilterCondition> todayCompletedTaskCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'todayCompletedTaskCount',
      ));
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel,
      QAfterFilterCondition> todayCompletedTaskCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'todayCompletedTaskCount',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel,
      QAfterFilterCondition> todayCompletedTaskCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'todayCompletedTaskCount',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel,
      QAfterFilterCondition> todayCompletedTaskCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'todayCompletedTaskCount',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel,
      QAfterFilterCondition> todayCompletedTaskCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'todayCompletedTaskCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel,
      QAfterFilterCondition> todayRemainsTaskCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'todayRemainsTaskCount',
      ));
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel,
      QAfterFilterCondition> todayRemainsTaskCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'todayRemainsTaskCount',
      ));
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel,
      QAfterFilterCondition> todayRemainsTaskCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'todayRemainsTaskCount',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel,
      QAfterFilterCondition> todayRemainsTaskCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'todayRemainsTaskCount',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel,
      QAfterFilterCondition> todayRemainsTaskCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'todayRemainsTaskCount',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel,
      QAfterFilterCondition> todayRemainsTaskCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'todayRemainsTaskCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TaskTitleListIsarModelQueryObject on QueryBuilder<
    TaskTitleListIsarModel, TaskTitleListIsarModel, QFilterCondition> {}

extension TaskTitleListIsarModelQueryLinks on QueryBuilder<
    TaskTitleListIsarModel, TaskTitleListIsarModel, QFilterCondition> {
  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel,
      QAfterFilterCondition> tasks(FilterQuery<TaskIsarModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'tasks');
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel,
      QAfterFilterCondition> tasksLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tasks', length, true, length, true);
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel,
      QAfterFilterCondition> tasksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tasks', 0, true, 0, true);
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel,
      QAfterFilterCondition> tasksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tasks', 0, false, 999999, true);
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel,
      QAfterFilterCondition> tasksLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tasks', 0, true, length, include);
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel,
      QAfterFilterCondition> tasksLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tasks', length, include, 999999, true);
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel,
      QAfterFilterCondition> tasksLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'tasks', lower, includeLower, upper, includeUpper);
    });
  }
}

extension TaskTitleListIsarModelQuerySortBy
    on QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel, QSortBy> {
  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel, QAfterSortBy>
      sortByTaskTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskTitle', Sort.asc);
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel, QAfterSortBy>
      sortByTaskTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskTitle', Sort.desc);
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel, QAfterSortBy>
      sortByTodayCompletedTaskCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'todayCompletedTaskCount', Sort.asc);
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel, QAfterSortBy>
      sortByTodayCompletedTaskCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'todayCompletedTaskCount', Sort.desc);
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel, QAfterSortBy>
      sortByTodayRemainsTaskCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'todayRemainsTaskCount', Sort.asc);
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel, QAfterSortBy>
      sortByTodayRemainsTaskCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'todayRemainsTaskCount', Sort.desc);
    });
  }
}

extension TaskTitleListIsarModelQuerySortThenBy on QueryBuilder<
    TaskTitleListIsarModel, TaskTitleListIsarModel, QSortThenBy> {
  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel, QAfterSortBy>
      thenByTaskTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskTitle', Sort.asc);
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel, QAfterSortBy>
      thenByTaskTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskTitle', Sort.desc);
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel, QAfterSortBy>
      thenByTodayCompletedTaskCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'todayCompletedTaskCount', Sort.asc);
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel, QAfterSortBy>
      thenByTodayCompletedTaskCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'todayCompletedTaskCount', Sort.desc);
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel, QAfterSortBy>
      thenByTodayRemainsTaskCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'todayRemainsTaskCount', Sort.asc);
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel, QAfterSortBy>
      thenByTodayRemainsTaskCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'todayRemainsTaskCount', Sort.desc);
    });
  }
}

extension TaskTitleListIsarModelQueryWhereDistinct
    on QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel, QDistinct> {
  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel, QDistinct>
      distinctByTaskTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taskTitle', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel, QDistinct>
      distinctByTodayCompletedTaskCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'todayCompletedTaskCount');
    });
  }

  QueryBuilder<TaskTitleListIsarModel, TaskTitleListIsarModel, QDistinct>
      distinctByTodayRemainsTaskCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'todayRemainsTaskCount');
    });
  }
}

extension TaskTitleListIsarModelQueryProperty on QueryBuilder<
    TaskTitleListIsarModel, TaskTitleListIsarModel, QQueryProperty> {
  QueryBuilder<TaskTitleListIsarModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TaskTitleListIsarModel, String?, QQueryOperations>
      taskTitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taskTitle');
    });
  }

  QueryBuilder<TaskTitleListIsarModel, int?, QQueryOperations>
      todayCompletedTaskCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'todayCompletedTaskCount');
    });
  }

  QueryBuilder<TaskTitleListIsarModel, int?, QQueryOperations>
      todayRemainsTaskCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'todayRemainsTaskCount');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTaskIsarModelCollection on Isar {
  IsarCollection<TaskIsarModel> get taskIsarModels => this.collection();
}

const TaskIsarModelSchema = CollectionSchema(
  name: r'TaskIsarModel',
  id: -1287797016350681309,
  properties: {
    r'completedAt': PropertySchema(
      id: 0,
      name: r'completedAt',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.string,
    ),
    r'details': PropertySchema(
      id: 2,
      name: r'details',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'taskDateTime': PropertySchema(
      id: 4,
      name: r'taskDateTime',
      type: IsarType.string,
    )
  },
  estimateSize: _taskIsarModelEstimateSize,
  serialize: _taskIsarModelSerialize,
  deserialize: _taskIsarModelDeserialize,
  deserializeProp: _taskIsarModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _taskIsarModelGetId,
  getLinks: _taskIsarModelGetLinks,
  attach: _taskIsarModelAttach,
  version: '3.1.0+1',
);

int _taskIsarModelEstimateSize(
  TaskIsarModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.completedAt;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.createdAt;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.details;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.taskDateTime;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _taskIsarModelSerialize(
  TaskIsarModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.completedAt);
  writer.writeString(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.details);
  writer.writeString(offsets[3], object.name);
  writer.writeString(offsets[4], object.taskDateTime);
}

TaskIsarModel _taskIsarModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TaskIsarModel();
  object.completedAt = reader.readStringOrNull(offsets[0]);
  object.createdAt = reader.readStringOrNull(offsets[1]);
  object.details = reader.readStringOrNull(offsets[2]);
  object.id = id;
  object.name = reader.readStringOrNull(offsets[3]);
  object.taskDateTime = reader.readStringOrNull(offsets[4]);
  return object;
}

P _taskIsarModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _taskIsarModelGetId(TaskIsarModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _taskIsarModelGetLinks(TaskIsarModel object) {
  return [];
}

void _taskIsarModelAttach(
    IsarCollection<dynamic> col, Id id, TaskIsarModel object) {
  object.id = id;
}

extension TaskIsarModelQueryWhereSort
    on QueryBuilder<TaskIsarModel, TaskIsarModel, QWhere> {
  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TaskIsarModelQueryWhere
    on QueryBuilder<TaskIsarModel, TaskIsarModel, QWhereClause> {
  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TaskIsarModelQueryFilter
    on QueryBuilder<TaskIsarModel, TaskIsarModel, QFilterCondition> {
  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      completedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'completedAt',
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      completedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'completedAt',
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      completedAtEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      completedAtGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'completedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      completedAtLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'completedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      completedAtBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'completedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      completedAtStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'completedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      completedAtEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'completedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      completedAtContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'completedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      completedAtMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'completedAt',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      completedAtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedAt',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      completedAtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'completedAt',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      createdAtEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      createdAtGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      createdAtLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      createdAtBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      createdAtStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      createdAtEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      createdAtContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'createdAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      createdAtMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'createdAt',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      createdAtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      createdAtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'createdAt',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      detailsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'details',
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      detailsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'details',
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      detailsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'details',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      detailsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'details',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      detailsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'details',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      detailsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'details',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      detailsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'details',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      detailsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'details',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      detailsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'details',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      detailsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'details',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      detailsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'details',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      detailsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'details',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      taskDateTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'taskDateTime',
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      taskDateTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'taskDateTime',
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      taskDateTimeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taskDateTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      taskDateTimeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taskDateTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      taskDateTimeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taskDateTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      taskDateTimeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taskDateTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      taskDateTimeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'taskDateTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      taskDateTimeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'taskDateTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      taskDateTimeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'taskDateTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      taskDateTimeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'taskDateTime',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      taskDateTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taskDateTime',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterFilterCondition>
      taskDateTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'taskDateTime',
        value: '',
      ));
    });
  }
}

extension TaskIsarModelQueryObject
    on QueryBuilder<TaskIsarModel, TaskIsarModel, QFilterCondition> {}

extension TaskIsarModelQueryLinks
    on QueryBuilder<TaskIsarModel, TaskIsarModel, QFilterCondition> {}

extension TaskIsarModelQuerySortBy
    on QueryBuilder<TaskIsarModel, TaskIsarModel, QSortBy> {
  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterSortBy> sortByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterSortBy>
      sortByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterSortBy> sortByDetails() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'details', Sort.asc);
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterSortBy> sortByDetailsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'details', Sort.desc);
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterSortBy>
      sortByTaskDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskDateTime', Sort.asc);
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterSortBy>
      sortByTaskDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskDateTime', Sort.desc);
    });
  }
}

extension TaskIsarModelQuerySortThenBy
    on QueryBuilder<TaskIsarModel, TaskIsarModel, QSortThenBy> {
  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterSortBy> thenByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterSortBy>
      thenByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterSortBy> thenByDetails() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'details', Sort.asc);
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterSortBy> thenByDetailsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'details', Sort.desc);
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterSortBy>
      thenByTaskDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskDateTime', Sort.asc);
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QAfterSortBy>
      thenByTaskDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskDateTime', Sort.desc);
    });
  }
}

extension TaskIsarModelQueryWhereDistinct
    on QueryBuilder<TaskIsarModel, TaskIsarModel, QDistinct> {
  QueryBuilder<TaskIsarModel, TaskIsarModel, QDistinct> distinctByCompletedAt(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedAt', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QDistinct> distinctByCreatedAt(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QDistinct> distinctByDetails(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'details', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskIsarModel, TaskIsarModel, QDistinct> distinctByTaskDateTime(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taskDateTime', caseSensitive: caseSensitive);
    });
  }
}

extension TaskIsarModelQueryProperty
    on QueryBuilder<TaskIsarModel, TaskIsarModel, QQueryProperty> {
  QueryBuilder<TaskIsarModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TaskIsarModel, String?, QQueryOperations> completedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedAt');
    });
  }

  QueryBuilder<TaskIsarModel, String?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<TaskIsarModel, String?, QQueryOperations> detailsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'details');
    });
  }

  QueryBuilder<TaskIsarModel, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<TaskIsarModel, String?, QQueryOperations>
      taskDateTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taskDateTime');
    });
  }
}
