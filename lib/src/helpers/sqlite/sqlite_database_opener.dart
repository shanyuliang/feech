library;

import 'package:sqlite3/common.dart';

import 'sqlite_database_opener_native.dart'
    if (dart.library.js_interop) 'sqlite_database_opener_web.dart'
    as sqlite_database_opener;

Future<CommonDatabase> openSqliteDatabase({
  required String databaseName,
  required String fullDatabasePath,
}) {
  return sqlite_database_opener.openSqliteDatabase(
    databaseName: databaseName,
    fullDatabasePath: fullDatabasePath,
  );
}
