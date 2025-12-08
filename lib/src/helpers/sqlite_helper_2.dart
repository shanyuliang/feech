import 'dart:async';
import 'dart:developer' as developer;

import 'package:sqlite3/sqlite3.dart';

import '../constants.dart';
import '../support/database/database_result.dart';

typedef MapToObject<G> = G Function(Map<String, dynamic> map);
typedef ObjectToMap<G> = Map<String, dynamic> Function(G object);

class SqliteHelper2 {
  SqliteHelper2({
    required this.databaseName,
    required this.version,
    Map<int, List<String>> onUpgradeCommandListMap = const {},
    this.debugLogDiagnostics = false,
  }) {
    try {
      if (debugLogDiagnostics) {
        developer.log('SqliteHelper opening $databaseName target version $version', name: debugTag);
      }
      _database = sqlite3.open(databaseName);
      final currentVersion = _database.userVersion;
      if (debugLogDiagnostics) {
        developer.log('SqliteHelper opened $databaseName current version $currentVersion', name: debugTag);
      }
      if (version > currentVersion) {
        if (debugLogDiagnostics) {
          developer.log('SqliteHelper upgrading $databaseName from $currentVersion to $version', name: debugTag);
        }
        for (var v = currentVersion + 1; v <= version; v++) {
          final commands = onUpgradeCommandListMap[v] ?? [];
          for (final command in commands) {
            if (debugLogDiagnostics) {
              developer.log('SqliteHelper executing [$command] on $databaseName', name: debugTag);
            }
            _database.execute(command);
            if (debugLogDiagnostics) {
              developer.log('SqliteHelper executed [$command] on $databaseName', name: debugTag);
            }
          }
        }
        _database.userVersion = version;
        if (debugLogDiagnostics) {
          developer.log('SqliteHelper upgraded $databaseName from $currentVersion to $version', name: debugTag);
        }
      }
    } catch (e) {
      if (debugLogDiagnostics) {
        developer.log('SqliteHelper open $databaseName error $e', name: debugTag);
      }
    }
  }

  late final Database _database;
  final String databaseName;
  final int version;
  final bool debugLogDiagnostics;

  Future<DatabaseResult> close() async {
    DatabaseResult databaseResult;
    try {
      _database.close();
      databaseResult = DatabaseResultClose(databaseName);
    } catch (e) {
      databaseResult = DatabaseResultError(e);
    }
    if (debugLogDiagnostics) {
      developer.log('SqliteHelper close $databaseResult', name: debugTag);
    }
    return databaseResult;
  }

  Future<DatabaseResult> begin() async {
    DatabaseResult databaseResult;
    try {
      _database.execute('BEGIN;');
      databaseResult = DatabaseResultBegin();
    } catch (e) {
      databaseResult = DatabaseResultError(e);
    }
    if (debugLogDiagnostics) {
      developer.log('SqliteHelper begin $databaseResult', name: debugTag);
    }
    return databaseResult;
  }

  Future<DatabaseResult> commit() async {
    DatabaseResult databaseResult;
    try {
      _database.execute('COMMIT;');
      databaseResult = DatabaseResultCommit();
    } catch (e) {
      databaseResult = DatabaseResultError(e);
    }
    if (debugLogDiagnostics) {
      developer.log('SqliteHelper commit $databaseResult', name: debugTag);
    }
    return databaseResult;
  }

  Future<DatabaseResult> rollback() async {
    DatabaseResult databaseResult;
    try {
      _database.execute('ROLLBACK;');
      databaseResult = DatabaseResultRollback();
    } catch (e) {
      databaseResult = DatabaseResultError(e);
    }
    if (debugLogDiagnostics) {
      developer.log('SqliteHelper rollback $databaseResult', name: debugTag);
    }
    return databaseResult;
  }

  Future<DatabaseResult> execute({required String sql, List<Object?> parameters = const []}) async {
    DatabaseResult databaseResult;
    try {
      _database.execute(sql, parameters);
      databaseResult = DatabaseResultExecute(sql: sql, parameters: parameters);
    } catch (e) {
      databaseResult = DatabaseResultError(e);
    }
    if (debugLogDiagnostics) {
      developer.log('SqliteHelper execute $databaseResult', name: debugTag);
    }
    return databaseResult;
  }

  Future<DatabaseResult> select<G>({required String sql, required MapToObject<G> mapToObject, List<Object?> parameters = const []}) async {
    DatabaseResult databaseResult;
    try {
      final resultSet = _database.select(sql, parameters);
      final values = resultSet.map((row) => mapToObject(row)).toList();
      databaseResult = DatabaseResultSelect(sql: sql, parameters: parameters, values: values);
    } catch (e) {
      databaseResult = DatabaseResultError(e);
    }
    if (debugLogDiagnostics) {
      developer.log('SqliteHelper select $databaseResult', name: debugTag);
    }
    return databaseResult;
  }

  Future<DatabaseResult> insertUpdateDelete({required String sql, List<Object?> parameters = const []}) async {
    DatabaseResult databaseResult;
    try {
      final cleanedSql = sql.trim().replaceFirst(RegExp(r';$'), '');
      final resultSet = _database.select('$cleanedSql RETURNING ROWID;', parameters);
      if (debugLogDiagnostics) {
        developer.log('SqliteHelper insertUpdateDelete resultSet $resultSet', name: debugTag);
        developer.log('SqliteHelper insertUpdateDelete resultSet.length ${resultSet.length}', name: debugTag);
      }
      final value = resultSet.length;
      databaseResult = DatabaseResultInsertUpdateDelete(sql: sql, parameters: parameters, value: value);
    } catch (e) {
      databaseResult = DatabaseResultError(e);
    }
    if (debugLogDiagnostics) {
      developer.log('SqliteHelper insertUpdateDelete $databaseResult', name: debugTag);
    }
    return databaseResult;
  }
}
