import 'dart:async';

import 'package:sqlite3/wasm.dart';

WasmSqlite3? _sqlite3Instance;
Completer<WasmSqlite3>? _sqlite3Completer;

Future<CommonDatabase> openSqliteDatabase({
  required String databaseName,
  required String fullDatabasePath,
}) async {
  final _ = fullDatabasePath;
  final sqlite = await _loadSqlite3();
  final webDatabasePath = databaseName.startsWith('/')
      ? databaseName
      : '/$databaseName';
  return sqlite.open(webDatabasePath);
}

Future<WasmSqlite3> _loadSqlite3() async {
  if (_sqlite3Instance != null) {
    return _sqlite3Instance!;
  }
  if (_sqlite3Completer != null) {
    return _sqlite3Completer!.future;
  }
  final completer = Completer<WasmSqlite3>();
  _sqlite3Completer = completer;
  try {
    final sqlite = await WasmSqlite3.loadFromUrlString('sqlite3.wasm');
    final fileSystem = await IndexedDbFileSystem.open(dbName: 'feech');
    sqlite.registerVirtualFileSystem(fileSystem, makeDefault: true);
    _sqlite3Instance = sqlite;
    completer.complete(sqlite);
  } catch (error, stackTrace) {
    completer.completeError(error, stackTrace);
    rethrow;
  } finally {
    _sqlite3Completer = null;
  }
  return completer.future;
}
