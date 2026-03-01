sealed class DatabaseResult {}

class DatabaseResultOpen extends DatabaseResult {
  DatabaseResultOpen({required this.databaseName, required this.previousVersion, required this.currentVersion, required this.elapsedMilliseconds});

  final String databaseName;
  final int previousVersion;
  final int currentVersion;
  final int elapsedMilliseconds;

  @override
  String toString() =>
      'DatabaseResultOpen [databaseName=$databaseName,previousVersion=$previousVersion,currentVersion=$currentVersion,elapsedMilliseconds=$elapsedMilliseconds]';
}

class DatabaseResultClose extends DatabaseResult {
  DatabaseResultClose({required this.databaseName, required this.previousVersion, required this.currentVersion, required this.elapsedMilliseconds});

  final String databaseName;
  final int previousVersion;
  final int currentVersion;
  final int elapsedMilliseconds;

  @override
  String toString() =>
      'DatabaseResultClose [databaseName=$databaseName,previousVersion=$previousVersion,currentVersion=$currentVersion,elapsedMilliseconds=$elapsedMilliseconds]';
}

class DatabaseResultBegin extends DatabaseResult {
  DatabaseResultBegin();

  @override
  String toString() => 'DatabaseResultBegin';
}

class DatabaseResultCommit extends DatabaseResult {
  DatabaseResultCommit();

  @override
  String toString() => 'DatabaseResultCommit';
}

class DatabaseResultRollback extends DatabaseResult {
  DatabaseResultRollback();

  @override
  String toString() => 'DatabaseResultRollback';
}

class DatabaseResultExecute extends DatabaseResult {
  DatabaseResultExecute({required this.sql, this.parameters = const []});

  final String sql;
  final List<Object?> parameters;

  @override
  String toString() => 'DatabaseResultExecute [sql=$sql,parameters=$parameters]';
}

class DatabaseResultSelect<G> extends DatabaseResult {
  DatabaseResultSelect({required this.sql, this.parameters = const [], this.values = const []});

  final String sql;
  final List<Object?> parameters;
  final List<G> values;

  @override
  String toString() => 'DatabaseResultSelect [sql=$sql,parameters=$parameters,values=$values]';
}

class DatabaseResultInsertUpdateDelete extends DatabaseResult {
  DatabaseResultInsertUpdateDelete({required this.sql, this.parameters = const [], this.value = 0});

  final String sql;
  final List<Object?> parameters;
  final int value;

  @override
  String toString() => 'DatabaseResultInsertUpdateDelete [sql=$sql,parameters=$parameters,value=$value]';
}

class DatabaseResultError extends DatabaseResult {
  DatabaseResultError(this.error);

  final Object? error;

  @override
  String toString() => 'DatabaseResultError [error=$error]';
}
