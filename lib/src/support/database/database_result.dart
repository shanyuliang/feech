sealed class DatabaseResult<G> {}

class DatabaseResultOpenGood<G> extends DatabaseResult<G> {
  final String databaseName;

  DatabaseResultOpenGood(this.databaseName);

  @override
  String toString() => "DatabaseResultOpenGood [databaseName=$databaseName]";
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
