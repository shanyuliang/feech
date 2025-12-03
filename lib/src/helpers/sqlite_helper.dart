import 'dart:async';
import 'dart:developer' as developer;

import 'package:sqflite/sqflite.dart';

import '../constants.dart';
import '../support/database/database_result.dart';

typedef FromMap<G> = G Function(Map<String, dynamic> map);
typedef ToMap<G> = Map<String, dynamic> Function(G data);

class SqliteHelper {
  late final Database _database;
  final String databaseName;
  final int version;
  final bool debugLogDiagnostics;

  SqliteHelper({
    required this.databaseName,
    required this.version,
    Map<int, List<String>> onUpgradeCommandListMap = const {},
    this.debugLogDiagnostics = false,
  }) {
    try {
      openDatabase(
        databaseName,
        version: version,
        onUpgrade: (db, oldVersion, newVersion) async {
          if (debugLogDiagnostics) {
            developer.log("SqliteHelper opening $databaseName onUpgrade ($oldVersion -> $newVersion) called", name: debugTag);
          }
          for (int v = oldVersion + 1; v <= newVersion; v++) {
            final commands = onUpgradeCommandListMap[v] ?? [];
            for (final command in commands) {
              await db.execute(command);
            }
          }
        },
      ).then((value) {
        _database = value;
        if (debugLogDiagnostics) {
          developer.log("SqliteHelper opened $databaseName", name: debugTag);
        }
      });
    } catch (e) {
      if (debugLogDiagnostics) {
        developer.log("SqliteHelper open $databaseName error ${e.toString()}", name: debugTag);
      }
    }
  }

  Future<DatabaseResult> closeDatabase() async {
    DatabaseResult databaseResult;
    try {
      await _database.close();
      databaseResult = DatabaseResultCloseGood(databaseName);
    } catch (e) {
      databaseResult = DatabaseResultError(e as Exception);
    }
    if (debugLogDiagnostics) {
      developer.log("SqliteHelper $databaseResult", name: debugTag);
    }
    return databaseResult;
  }

  Future<DatabaseResult<G>> query<G>({required String sql, required FromMap<G> fromMap, List<Object?>? arguments}) async {
    DatabaseResult<G> databaseResult;
    try {
      final dataList = await _database.rawQuery(sql, arguments);
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
        await _database.insert(tableName, map, conflictAlgorithm: ConflictAlgorithm.replace);
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
        final result = await _database.update(tableName, map, where: where, whereArgs: whereValueList, conflictAlgorithm: ConflictAlgorithm.replace);
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
      final result = await _database.delete(tableName, where: where, whereArgs: whereValueList);
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
