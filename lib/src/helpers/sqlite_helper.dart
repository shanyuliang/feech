import 'dart:async';
import 'dart:developer' as developer;

import 'package:sqflite/sqflite.dart';

import '../constants.dart';

abstract class DatabaseResult<G> {
  DatabaseResult._();

  factory DatabaseResult._openGood(String databaseName, Database database) => DatabaseResultOpenGood<G>(databaseName, database);

  factory DatabaseResult._closeGood(String databaseName) => DatabaseResultCloseGood<G>(databaseName);

  factory DatabaseResult._queryGood(List<G> values) => DatabaseResultQueryGood<G>(values);

  factory DatabaseResult._insertGood(G value) => DatabaseResultInsertGood<G>(value);

  factory DatabaseResult._updateGood(G value) => DatabaseResultUpdateGood<G>(value);

  factory DatabaseResult._deleteGood() => DatabaseResultDeleteGood<G>();

  factory DatabaseResult._badInputData(G data, Exception exception) => DatabaseResultBadInputData<G>(data, exception);

  factory DatabaseResult._badOutputData(List<Map<String, dynamic>> output, Exception exception) =>
      DatabaseResultBadOutputData<G>(output, exception);

  factory DatabaseResult._error(Exception exception) => DatabaseResultError<G>(exception);
}

class DatabaseResultOpenGood<_> extends DatabaseResult<_> {
  final String databaseName;
  final Database database;

  DatabaseResultOpenGood(this.databaseName, this.database) : super._();

  @override
  String toString() => "{DatabaseResultOpenGood={databaseName=$databaseName,database=$database}}";
}

class DatabaseResultCloseGood<_> extends DatabaseResult<_> {
  final String databaseName;

  DatabaseResultCloseGood(this.databaseName) : super._();

  @override
  String toString() => "{DatabaseResultCloseGood={databaseName=$databaseName}}";
}

class DatabaseResultQueryGood<G> extends DatabaseResult<G> {
  final List<G> values;

  DatabaseResultQueryGood(this.values) : super._();

  @override
  String toString() => "{DatabaseResultQueryGood={values=$values}}";
}

class DatabaseResultInsertGood<G> extends DatabaseResult<G> {
  final G value;

  DatabaseResultInsertGood(this.value) : super._();

  @override
  String toString() => "{DatabaseResultInsertGood={value=$value}}";
}

class DatabaseResultUpdateGood<G> extends DatabaseResult<G> {
  final G value;

  DatabaseResultUpdateGood(this.value) : super._();

  @override
  String toString() => "{DatabaseResultUpdateGood={value=$value}}";
}

class DatabaseResultDeleteGood<_> extends DatabaseResult<_> {
  DatabaseResultDeleteGood() : super._();

  @override
  String toString() => "{DatabaseResultDeleteGood}";
}

class DatabaseResultBadInputData<G> extends DatabaseResult<G> {
  final G data;
  final Exception exception;

  DatabaseResultBadInputData(this.data, this.exception) : super._();

  @override
  String toString() => "{DatabaseResultBadInputData={exception=$exception}}";
}

class DatabaseResultBadOutputData<_> extends DatabaseResult<_> {
  final List<Map<String, dynamic>> output;
  final Exception exception;

  DatabaseResultBadOutputData(this.output, this.exception) : super._();

  @override
  String toString() => "{DatabaseResultBadOutputData={output=$output,exception=$exception}}";
}

class DatabaseResultError<_> extends DatabaseResult<_> {
  final Exception exception;

  DatabaseResultError(this.exception) : super._();

  @override
  String toString() => "{DatabaseResultError={exception=$exception}";
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

  Future<DatabaseResult> open(
      String databaseName, List<String> onCreateCommandList, List<String> onUpgradeCommandList, int version) async {
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
      databaseResult = DatabaseResult._openGood(databaseName, _database!);
    } catch (e) {
      databaseResult = DatabaseResult._error(e as Exception);
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
      databaseResult = DatabaseResult._closeGood(databaseName);
    } catch (e) {
      databaseResult = DatabaseResult._error(e as Exception);
    }
    if (debugLogDiagnostics) {
      developer.log("SqliteHelper $databaseResult", name: debugTag);
    }
    return databaseResult;
  }

  Future<DatabaseResult<G>> query<G>(String tableName, FromMap<G> fromMap,
      {String? where, List<String>? whereValueList, String? orderBy}) async {
    DatabaseResult<G> databaseResult;
    try {
      List<Map<String, dynamic>> dataList =
          await _database!.query(tableName, where: where, whereArgs: whereValueList, orderBy: orderBy);
      try {
        List<G> values = dataList.map((map) => fromMap(map)).toList();
        databaseResult = DatabaseResult._queryGood(values);
      } on Error catch (err) {
        databaseResult = DatabaseResult._badOutputData(dataList, Exception(err.toString()));
      } catch (e) {
        databaseResult = DatabaseResult._error(e as Exception);
      }
    } catch (e) {
      databaseResult = DatabaseResult._error(e as Exception);
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
        databaseResult = DatabaseResult._insertGood(data);
      } catch (e) {
        databaseResult = DatabaseResult._error(e as Exception);
      }
    } on Error catch (err) {
      databaseResult = DatabaseResult._badInputData(data, Exception(err.toString()));
    } catch (e) {
      databaseResult = DatabaseResult._error(e as Exception);
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
        await _database!
            .update(tableName, map, where: where, whereArgs: whereValueList, conflictAlgorithm: ConflictAlgorithm.replace);
        databaseResult = DatabaseResult._updateGood(data);
      } catch (e) {
        databaseResult = DatabaseResult._error(e as Exception);
      }
    } on Error catch (err) {
      databaseResult = DatabaseResult._badInputData(data, Exception(err.toString()));
    } catch (e) {
      databaseResult = DatabaseResult._error(e as Exception);
    }
    if (debugLogDiagnostics) {
      developer.log("SqliteHelper $databaseResult", name: debugTag);
    }
    return databaseResult;
  }

  Future<DatabaseResult> delete(String tableName, String where, List<String> whereValueList) async {
    DatabaseResult databaseResult;
    try {
      await _database!.delete(tableName, where: where, whereArgs: whereValueList);
      databaseResult = DatabaseResult._deleteGood();
    } catch (e) {
      databaseResult = DatabaseResult._error(e as Exception);
    }
    if (debugLogDiagnostics) {
      developer.log("SqliteHelper $databaseResult", name: debugTag);
    }
    return databaseResult;
  }
}

SqliteHelper databaseHelper = SqliteHelper(debugLogDiagnostics: false);
