import 'package:sqlite3/common.dart';
import 'package:sqlite3/sqlite3.dart' as sqlite3;

Future<CommonDatabase> openSqliteDatabase({
  required String databaseName,
  required String fullDatabasePath,
}) async {
  return sqlite3.sqlite3.open(fullDatabasePath);
}
