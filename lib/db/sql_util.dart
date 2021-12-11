import 'package:sqflite/sqlite_api.dart';
import 'package:surf_wallet/db/provider.dart';
import 'dart:async';

class BaseModel {
  Database db;
  final String table = '';
  var querys;

  BaseModel(this.db) {
    querys = db.query;
  }
}

class SqlUtil extends BaseModel {
  final String tableName;

  SqlUtil.setTable(String name)
      : tableName = name,
        super(ProviderSql.db);

  Future<List> get() async {
    return await this.querys(tableName);
  }

  Future<int> rawInsert(String sql, List arguments) async {
    return await this.db.rawInsert(sql, arguments);
  }

  Future<int> insert(Map<String, dynamic> params) async {
    return await this.db.insert(tableName, params);
  }

  Future<int> rawDelete(String sql, List arguments) async {
    return await this.db.rawDelete(sql, arguments);
  }

  // Delete one or more based on single condition
  Future<int> delete(String key, dynamic value) async {
    return await this.db.delete(tableName, where: '$key = ?', whereArgs: [value]);
  }

  // Deletes one or more based on multiple conditions
  Future<int> deletes(Map<String, dynamic> conditions, String ao) async {
    String stringConditions = '';

    int index = 0;
    if (ao == '') ao = 'and';
    conditions.forEach((key, value) {
      if (value == null) {
        return;
      }
      if (value.runtimeType == String) {
        stringConditions = '$stringConditions $key = "$value"';
      }
      if (value.runtimeType == int) {
        stringConditions = '$stringConditions $key = $value';
      }
      if (index >= 0 && index < conditions.length - 1) {
        stringConditions = '$stringConditions $ao';
      }
      index++;
    });
    return await this.db.delete(tableName, where: stringConditions);
  }

  //Modify the data into the SQL statement and parameters
  Future<int> rawUpdate(String sql, List arguments) async {
    return await this.db.rawUpdate(sql, arguments);
  }

  //Modify one or more data single conditions
  Future<int> update(Map<String, dynamic> params, String key, dynamic value) async {
    return await this.db.update(tableName, params, where: '$key = ?', whereArgs: [value]);
  }

  //Modify one or more data multiple conditions
  Future<int> updates(
      Map<String, dynamic> params, Map<String, dynamic> conditions, String ao) async {
    String stringConditions = '';

    int index = 0;
    if (ao == '') ao = 'and';
    conditions.forEach((key, value) {
      if (value == null) {
        return;
      }
      if (value.runtimeType == String) {
        stringConditions = '$stringConditions $key = "$value"';
      }
      if (value.runtimeType == int) {
        stringConditions = '$stringConditions $key = $value';
      }

      if (index >= 0 && index < conditions.length - 1) {
        stringConditions = '$stringConditions $ao';
      }
      index++;
    });
    return await this.db.update(tableName, params, where: stringConditions);
  }

  //Query data is incorporated into SQL statements and parameters
  Future<List> rawQuery(String sql, List arguments) async {
    return await this.db.rawQuery(sql, arguments);
  }

  //Through the conditional query, the table name can be passed as a parameter. As a public method, it is a collection of collections.
  Future<List> query({Map<dynamic, dynamic> conditions}) async {
    // If the incoming condition is empty, check all the data of the table.
    if (conditions == null || conditions.isEmpty) {
      return this.get();
    }
    String stringConditions = '';

    int index = 0;
    conditions.forEach((key, value) {
      if (value == null) {
        return;
      }
      if (value.runtimeType == String) {
        stringConditions = '$stringConditions $key = "$value"';
      }
      if (value.runtimeType == int) {
        stringConditions = '$stringConditions $key = $value';
      }

      if (index >= 0 && index < conditions.length - 1) {
        stringConditions = '$stringConditions and';
      }
      index++;
    });
    // print("this is string condition for sql > $stringConditions");
    return await this.querys(tableName, where: stringConditions);
  }
}
