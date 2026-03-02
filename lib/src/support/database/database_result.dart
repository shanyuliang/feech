sealed class DatabaseResult {}

class DatabaseResultOpen extends DatabaseResult {
  DatabaseResultOpen({required this.databaseName, required this.previousVersion, required this.version, required this.elapsed});

  final String databaseName;
  final int previousVersion;
  final int version;
  final Duration elapsed;

  @override
  String toString() => 'DatabaseResultOpen [databaseName=$databaseName,previousVersion=$previousVersion,version=$version,elapsed=$elapsed]';
}

class DatabaseResultClose extends DatabaseResult {
  DatabaseResultClose({required this.databaseName, required this.version, required this.elapsed});

  final String databaseName;
  final int version;
  final Duration elapsed;

  @override
  String toString() => 'DatabaseResultClose [databaseName=$databaseName,version=$version,elapsed=$elapsed]';
}

class DatabaseResultBegin extends DatabaseResult {
  DatabaseResultBegin({required this.databaseName, required this.version, required this.elapsed});

  final String databaseName;
  final int version;
  final Duration elapsed;

  @override
  String toString() => 'DatabaseResultBegin [databaseName=$databaseName,version=$version,elapsed=$elapsed]';
}

class DatabaseResultCommit extends DatabaseResult {
  DatabaseResultCommit({required this.databaseName, required this.version, required this.elapsed});

  final String databaseName;
  final int version;
  final Duration elapsed;

  @override
  String toString() => 'DatabaseResultCommit [databaseName=$databaseName,version=$version,elapsed=$elapsed]';
}

class DatabaseResultRollback extends DatabaseResult {
  DatabaseResultRollback({required this.databaseName, required this.version, required this.elapsed});

  final String databaseName;
  final int version;
  final Duration elapsed;

  @override
  String toString() => 'DatabaseResultRollback [databaseName=$databaseName,version=$version,elapsed=$elapsed]';
}

class DatabaseResultExecute extends DatabaseResult {
  DatabaseResultExecute({required this.databaseName, required this.version, required this.elapsed, required this.sql, this.parameters = const []});

  final String databaseName;
  final int version;
  final Duration elapsed;
  final String sql;
  final List<Object?> parameters;

  @override
  String toString() => 'DatabaseResultExecute [databaseName=$databaseName,version=$version,elapsed=$elapsed,sql=$sql,parameters=$parameters]';
}

class DatabaseResultSelect<G> extends DatabaseResult {
  DatabaseResultSelect({
    required this.databaseName,
    required this.version,
    required this.elapsed,
    required this.sql,
    this.parameters = const [],
    this.values = const [],
  });

  final String databaseName;
  final int version;
  final Duration elapsed;
  final String sql;
  final List<Object?> parameters;
  final List<G> values;

  @override
  String toString() =>
      'DatabaseResultSelect [databaseName=$databaseName,version=$version,elapsed=$elapsed,sql=$sql,parameters=$parameters,values=$values]';
}

class DatabaseResultInsertUpdateDelete extends DatabaseResult {
  DatabaseResultInsertUpdateDelete({
    required this.databaseName,
    required this.version,
    required this.elapsed,
    required this.sql,
    this.parameters = const [],
    this.value = 0,
  });

  final String databaseName;
  final int version;
  final Duration elapsed;
  final String sql;
  final List<Object?> parameters;
  final int value;

  @override
  String toString() =>
      'DatabaseResultInsertUpdateDelete [databaseName=$databaseName,version=$version,elapsed=$elapsed,sql=$sql,parameters=$parameters,value=$value]';
}

class DatabaseResultError extends DatabaseResult {
  DatabaseResultError({required this.databaseName, required this.version, required this.elapsed, this.error});

  final String databaseName;
  final int version;
  final Duration elapsed;
  final Object? error;

  @override
  String toString() => 'DatabaseResultError [databaseName=$databaseName,version=$version,elapsed=$elapsed,error=$error]';
}
