class SqlQueryBuilder {
  final List<String> _withClauses = [];
  final List<String> _selectColumns = [];
  String? _fromTable;
  final List<String> _joins = [];
  final List<String> _whereConditions = [];
  final List<String> _groupBy = [];
  String? _orderBy;
  int? _limit;
  int? _offset;

  SqlQueryBuilder withClause(String name, String query) {
    _withClauses.add('$name AS ($query)');
    return this;
  }

  SqlQueryBuilder select(List<String> columns) {
    _selectColumns.addAll(columns);
    return this;
  }

  SqlQueryBuilder from(String table) {
    _fromTable = table;
    return this;
  }

  SqlQueryBuilder join(String joinSql) {
    _joins.add(joinSql);
    return this;
  }

  SqlQueryBuilder where(String condition) {
    _whereConditions.add(condition);
    return this;
  }

  SqlQueryBuilder groupBy(List<String> columns) {
    _groupBy.addAll(columns);
    return this;
  }

  SqlQueryBuilder orderBy(String order) {
    _orderBy = order;
    return this;
  }

  SqlQueryBuilder limit(int limit) {
    _limit = limit;
    return this;
  }

  SqlQueryBuilder offset(int offset) {
    _offset = offset;
    return this;
  }

  String build() {
    final buffer = StringBuffer();

    if (_withClauses.isNotEmpty) {
      buffer.writeln('WITH ${_withClauses.join(",\n")}');
    }

    buffer.write(
      'SELECT ${_selectColumns.isNotEmpty ? _selectColumns.join(", ") : "*"}\n',
    );
    if (_fromTable != null) buffer.write('FROM $_fromTable\n');

    if (_joins.isNotEmpty) {
      buffer.writeln(_joins.join("\n"));
    }

    if (_whereConditions.isNotEmpty) {
      buffer.writeln('WHERE ${_whereConditions.join(' AND ')}');
    }

    if (_groupBy.isNotEmpty) {
      buffer.writeln('GROUP BY ${_groupBy.join(", ")}');
    }

    if (_orderBy != null) {
      buffer.writeln('ORDER BY $_orderBy');
    }

    if (_limit != null) {
      buffer.writeln('LIMIT $_limit');
    }

    if (_offset != null) {
      buffer.writeln('OFFSET $_offset');
    }

    return buffer.toString();
  }
}

class QueryBuilder {
  final List<String> _selectColumns = [];
  String? _fromTable;
  final List<String> _joins = [];
  final List<String> _whereConditions = [];
  final List<dynamic> _args = [];
  final List<String> _groupBy = [];
  String? _orderBy;
  int? _limit;
  int? _offset;

  QueryBuilder select(List<String> columns) {
    _selectColumns.addAll(columns);
    return this;
  }

  QueryBuilder from(String table) {
    _fromTable = table;
    return this;
  }

  QueryBuilder join(String joinSql, [List<dynamic>? args]) {
    _joins.add(joinSql);
    if (args != null) {
      _args.addAll(args);
    }
    return this;
  }

  QueryBuilder where(String condition, [List<dynamic>? args]) {
    _whereConditions.add(condition);
    if (args != null) {
      _args.addAll(args);
    }
    return this;
  }

  QueryBuilder orderBy(String order) {
    _orderBy = order;
    return this;
  }

  QueryBuilder limit(int limit) {
    _limit = limit;
    return this;
  }

  QueryBuilder offset(int offset) {
    _offset = offset;
    return this;
  }

  (String, List<dynamic>) build() {
    final buffer = StringBuffer();

    buffer.write(
      'SELECT ${_selectColumns.isNotEmpty ? _selectColumns.join(", ") : "*"}\n',
    );

    if (_fromTable != null) buffer.write('FROM $_fromTable\n');

    if (_joins.isNotEmpty) {
      buffer.writeln(_joins.join("\n"));
    }

    if (_whereConditions.isNotEmpty) {
      buffer.writeln('WHERE ${_whereConditions.join(' AND ')}');
    }

    if (_groupBy.isNotEmpty) {
      buffer.writeln('GROUP BY ${_groupBy.join(", ")}');
    }

    if (_orderBy != null) {
      buffer.writeln('ORDER BY $_orderBy');
    }

    if (_limit != null) {
      buffer.writeln('LIMIT $_limit');
    }

    if (_offset != null) {
      buffer.writeln('OFFSET $_offset');
    }

    return (buffer.toString(), _args);
  }
}
