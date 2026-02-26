import 'dart:async';
import 'dart:developer' as developer;

import 'package:collection/collection.dart';
import 'package:sqlite3/sqlite3.dart';

import '../constants.dart';
import '../support/database/database_result.dart';

typedef MapToObject<G> = G Function(Map<String, dynamic> map);
typedef ObjectToMap<G> = Map<String, dynamic> Function(G object);

class SqliteHelper2 {
  /*
    final dbHelper = SqliteHelper2(
      databaseName: 'databaseName',
      version: 2,
      onUpgradeCommandListMap: {
        1: [
          '''
            CREATE TABLE product(
            stockcode INTEGER PRIMARY KEY,
            barcode TEXT NULL,
            price REAL NULL,
            is_half_price BOOL NULL);
          ''',
          '''
            BEGIN;
          ''',
          '''
            INSERT INTO product (stockcode,barcode) VALUES (123,'B123');
          ''',
          '''
            COMMIT;
          ''',
        ],
      },
      debugLogDiagnostics: true,
    );
   */
  SqliteHelper2({
    required this.databaseName,
    required this.version,
    Map<int, List<String>> onUpgradeCommandListMap = const {},
    this.debugLogDiagnostics = false,
  }) {
    try {
      if (debugLogDiagnostics) {
        developer.log('$logPrefix opening $databaseName target version $version', name: debugTag);
      }
      _database = sqlite3.open(databaseName);
      final currentVersion = _database.userVersion;
      if (debugLogDiagnostics) {
        developer.log('$logPrefix opened $databaseName current version $currentVersion', name: debugTag);
      }
      if (version > currentVersion) {
        if (debugLogDiagnostics) {
          developer.log('$logPrefix upgrading $databaseName from $currentVersion to $version', name: debugTag);
        }
        for (var v = currentVersion + 1; v <= version; v++) {
          if (debugLogDiagnostics) {
            developer.log('$logPrefix upgrading $databaseName from ${v - 1} to $v', name: debugTag);
          }
          final commands = onUpgradeCommandListMap[v] ?? [];
          for (final command in commands) {
            if (debugLogDiagnostics) {
              developer.log('$logPrefix executing [$command] on $databaseName', name: debugTag);
            }
            _database.execute(command);
            if (debugLogDiagnostics) {
              developer.log('$logPrefix executed [$command] on $databaseName', name: debugTag);
            }
          }
          if (debugLogDiagnostics) {
            developer.log('$logPrefix upgraded $databaseName from ${v - 1} to $v', name: debugTag);
          }
        }
        _database.userVersion = version;
        if (debugLogDiagnostics) {
          developer.log('$logPrefix upgraded $databaseName from $currentVersion to $version', name: debugTag);
        }
      }
    } catch (e) {
      if (debugLogDiagnostics) {
        developer.log('$logPrefix open $databaseName error $e', name: debugTag);
      }
    }
  }

  static const logPrefix = 'SqliteHelper';

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
      developer.log('$logPrefix close $databaseResult', name: debugTag);
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
      developer.log('$logPrefix begin $databaseResult', name: debugTag);
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
      developer.log('$logPrefix commit $databaseResult', name: debugTag);
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
      developer.log('$logPrefix rollback $databaseResult', name: debugTag);
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
      developer.log('$logPrefix execute $databaseResult', name: debugTag);
    }
    return databaseResult;
  }

  /*
    final result = await dbHelper.select<Product>(
      sql: 'SELECT * FROM product WHERE barcode = ?;',
      mapToObject: (map) => Product(
        stockcode: map['stockcode'] as int?,
        barcode: map['barcode'] as String?,
      ),
      parameters: ["B123"],
    );
   */
  Future<DatabaseResult> select<G>({required String sql, required MapToObject<G> mapToObject, List<Object?> parameters = const []}) async {
    DatabaseResult databaseResult;
    try {
      final resultSet = _database.select(sql, parameters);
      final values = resultSet.map((row) => mapToObject(row)).toList();
      databaseResult = DatabaseResultSelect<G>(sql: sql, parameters: parameters, values: values);
    } catch (e) {
      databaseResult = DatabaseResultError(e);
    }
    if (debugLogDiagnostics) {
      developer.log('$logPrefix select $databaseResult', name: debugTag);
    }
    return databaseResult;
  }

  /*
    final result = await dbHelper.insertUpdateDelete(
      sql: 'INSERT INTO product (stockcode,barcode) VALUES (?,?),(?,?),(?,?);',
      parameters: [456, 'B456', 789, 'B789', 1, 'B1'],
    );
   */
  Future<DatabaseResult> insertUpdateDelete({required String sql, List<Object?> parameters = const []}) async {
    DatabaseResult databaseResult;
    try {
      final cleanedSql = sql.trim().replaceFirst(RegExp(r';$'), '');
      final resultSet = _database.select('$cleanedSql RETURNING ROWID;', parameters);
      if (debugLogDiagnostics) {
        developer.log('$logPrefix insertUpdateDelete resultSet $resultSet', name: debugTag);
        developer.log('$logPrefix insertUpdateDelete resultSet.length ${resultSet.length}', name: debugTag);
      }
      final value = resultSet.length;
      databaseResult = DatabaseResultInsertUpdateDelete(sql: sql, parameters: parameters, value: value);
    } catch (e) {
      databaseResult = DatabaseResultError(e);
    }
    if (debugLogDiagnostics) {
      developer.log('$logPrefix insertUpdateDelete $databaseResult', name: debugTag);
    }
    return databaseResult;
  }

  /*
    final result = await dbHelper.prepareAndInsertUpdateDelete(
      sql: 'INSERT INTO product (stockcode,barcode) VALUES (?,?);',
      parameters: [
        [456, 'B456'],
        [789, 'B789'],
        [1, 'B1'],
      ],
    );
   */
  Future<DatabaseResult> prepareAndInsertUpdateDelete({required String sql, List<List<Object?>> parameters = const []}) async {
    DatabaseResult databaseResult;
    try {
      final cleanedSql = sql.trim().replaceFirst(RegExp(r';$'), '');
      final preparedStatement = _database.prepare('$cleanedSql RETURNING ROWID;');
      var value = 0;
      parameters.forEachIndexed((index, item) {
        final resultSet = preparedStatement.select(item);
        value += resultSet.length;
        if (debugLogDiagnostics) {
          developer.log('$logPrefix prepareAndInsertUpdateDelete [$index] resultSet $resultSet', name: debugTag);
          developer.log('$logPrefix prepareAndInsertUpdateDelete [$index] resultSet.length ${resultSet.length}', name: debugTag);
        }
      });
      databaseResult = DatabaseResultInsertUpdateDelete(sql: sql, parameters: parameters, value: value);
    } catch (e) {
      databaseResult = DatabaseResultError(e);
    }
    if (debugLogDiagnostics) {
      developer.log('$logPrefix prepareAndInsertUpdateDelete $databaseResult', name: debugTag);
    }
    return databaseResult;
  }
}
