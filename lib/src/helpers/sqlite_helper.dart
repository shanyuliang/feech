import 'dart:async';
import 'dart:developer' as developer;

import 'package:sqflite/sqflite.dart';

import '../constants.dart';

sealed class DatabaseResult<G> {}

class DatabaseResultOpenGood<G> extends DatabaseResult<G> {
  final String databaseName;
  final Database database;

  DatabaseResultOpenGood(this.databaseName, this.database);

  @override
  String toString() => "DatabaseResultOpenGood [databaseName=$databaseName,database=$database]";
}

class DatabaseResultCloseGood<G> extends DatabaseResult<G> {
  final String databaseName;

  DatabaseResultCloseGood(this.databaseName);

  @override
  String toString() => "DatabaseResultCloseGood [databaseName=$databaseName]";
}

class DatabaseResultQueryGood<G> extends DatabaseResult<G> {
  final List<G> values;

  DatabaseResultQueryGood(this.values);

  @override
  String toString() => "DatabaseResultQueryGood [values=$values]";
}

class DatabaseResultInsertGood<G> extends DatabaseResult<G> {
  final G value;

  DatabaseResultInsertGood(this.value);

  @override
  String toString() => "DatabaseResultInsertGood [value=$value]";
}

class DatabaseResultUpdateGood<G> extends DatabaseResult<G> {
  final int updatedCount;
  final G value;

  DatabaseResultUpdateGood(this.updatedCount, this.value);

  @override
  String toString() => "DatabaseResultUpdateGood [updatedCount=$updatedCount,value=$value]";
}

class DatabaseResultDeleteGood<G> extends DatabaseResult<G> {
  final int deletedCount;

  DatabaseResultDeleteGood(this.deletedCount);

  @override
  String toString() => "DatabaseResultDeleteGood [deletedCount=$deletedCount]";
}

class DatabaseResultBadInputData<G> extends DatabaseResult<G> {
  final G data;
  final Exception exception;

  DatabaseResultBadInputData(this.data, this.exception);

  @override
  String toString() => "DatabaseResultBadInputData [data=$data,exception=$exception]";
}

class DatabaseResultBadOutputData<G> extends DatabaseResult<G> {
  final List<Map<String, dynamic>> output;
  final Exception exception;

  DatabaseResultBadOutputData(this.output, this.exception);

  @override
  String toString() => "DatabaseResultBadOutputData [output=$output,exception=$exception]";
}

class DatabaseResultError<G> extends DatabaseResult<G> {
  final Exception exception;

  DatabaseResultError(this.exception);

  @override
  String toString() => "DatabaseResultError [exception=$exception]";
}

typedef FromMap<G> = G Function(Map<String, dynamic> map);
typedef ToMap<G> = Map<String, dynamic> Function(G data);

class SqliteHelper {
  SqliteHelper._({this.debugLogDiagnostics = false});

  factory SqliteHelper({bool debugLogDiagnostics = false}) => SqliteHelper._(debugLogDiagnostics: debugLogDiagnostics);

  Database? _database;

  final bool debugLogDiagnostics;

  bool isDatabaseOpened() {
    return _database?.isOpen ?? false;
  }

  Future<DatabaseResult> open(String databaseName, List<String> onCreateCommandList, List<String> onUpgradeCommandList, int version) async {
    DatabaseResult databaseResult;
    try {
      _database = await openDatabase(
        databaseName,
        onCreate: (db, version) async {
          if (debugLogDiagnostics) {
            developer.log("SqliteHelper $databaseName onCreate called", name: debugTag);
          }
          for (final command in onCreateCommandList) {
            await db.execute(command);
          }
        },
        onUpgrade: (db, oldVersion, newVersion) async {
          if (debugLogDiagnostics) {
            developer.log("SqliteHelper $databaseName onUpgrade called", name: debugTag);
          }
          for (final command in onUpgradeCommandList) {
            await db.execute(command);
          }
        },
        version: version,
      );
      databaseResult = DatabaseResultOpenGood(databaseName, _database!);
    } catch (e) {
      databaseResult = DatabaseResultError(e as Exception);
    }
    if (debugLogDiagnostics) {
      developer.log("SqliteHelper $databaseResult", name: debugTag);
    }
    return databaseResult;
  }

  Future<DatabaseResult> close() async {
    DatabaseResult databaseResult;
    try {
      String databaseName = _database?.path ?? "";
      await _database?.close();
      _database = null;
      databaseResult = DatabaseResultCloseGood(databaseName);
    } catch (e) {
      databaseResult = DatabaseResultError(e as Exception);
    }
    if (debugLogDiagnostics) {
      developer.log("SqliteHelper $databaseResult", name: debugTag);
    }
    return databaseResult;
  }

  Future<DatabaseResult<G>> query<G>(String tableName, FromMap<G> fromMap, {String? where, List<String>? whereValueList, String? orderBy}) async {
    DatabaseResult<G> databaseResult;
    try {
      List<Map<String, dynamic>> dataList = await _database!.query(tableName, where: where, whereArgs: whereValueList, orderBy: orderBy);
      try {
        List<G> values = dataList.map((map) => fromMap(map)).toList();
        databaseResult = DatabaseResultQueryGood(values);
      } on Error catch (err) {
        databaseResult = DatabaseResultBadOutputData(dataList, Exception(err.toString()));
      } catch (e) {
        databaseResult = DatabaseResultError(e as Exception);
      }
    } catch (e) {
      databaseResult = DatabaseResultError(e as Exception);
    }
    if (debugLogDiagnostics) {
      developer.log("SqliteHelper $databaseResult", name: debugTag);
    }
    return databaseResult;
  }

  Future<DatabaseResult<G>> insert<G>(String tableName, G data, ToMap<G> toMap) async {
    DatabaseResult<G> databaseResult;
    try {
      Map<String, dynamic> map = toMap(data);
      try {
        await _database!.insert(tableName, map, conflictAlgorithm: ConflictAlgorithm.replace);
        databaseResult = DatabaseResultInsertGood(data);
      } catch (e) {
        databaseResult = DatabaseResultError(e as Exception);
      }
    } on Error catch (err) {
      databaseResult = DatabaseResultBadInputData(data, Exception(err.toString()));
    } catch (e) {
      databaseResult = DatabaseResultError(e as Exception);
    }
    if (debugLogDiagnostics) {
      developer.log("SqliteHelper $databaseResult", name: debugTag);
    }
    return databaseResult;
  }

  Future<DatabaseResult<G>> update<G>(String tableName, G data, ToMap<G> toMap, String where, List<String> whereValueList) async {
    DatabaseResult<G> databaseResult;
    try {
      Map<String, dynamic> map = toMap(data);
      try {
        final result = await _database!.update(tableName, map, where: where, whereArgs: whereValueList, conflictAlgorithm: ConflictAlgorithm.replace);
        databaseResult = DatabaseResultUpdateGood(result, data);
      } catch (e) {
        databaseResult = DatabaseResultError(e as Exception);
      }
    } on Error catch (err) {
      databaseResult = DatabaseResultBadInputData(data, Exception(err.toString()));
    } catch (e) {
      databaseResult = DatabaseResultError(e as Exception);
    }
    if (debugLogDiagnostics) {
      developer.log("SqliteHelper $databaseResult", name: debugTag);
    }
    return databaseResult;
  }

  Future<DatabaseResult> delete(String tableName, String where, List<String> whereValueList) async {
    DatabaseResult databaseResult;
    try {
      final result = await _database!.delete(tableName, where: where, whereArgs: whereValueList);
      databaseResult = DatabaseResultDeleteGood(result);
    } catch (e) {
      databaseResult = DatabaseResultError(e as Exception);
    }
    if (debugLogDiagnostics) {
      developer.log("SqliteHelper $databaseResult", name: debugTag);
    }
    return databaseResult;
  }
}

SqliteHelper databaseHelper = SqliteHelper(debugLogDiagnostics: false);
