import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:surf_wallet/db/sql_table_data.dart';

class ProviderSql {
  static Database db;

  Future<List> getTables() async {
    if (db == null) {
      return Future.value([]);
    }

    List tables = await db.rawQuery('SELECT name FROM sqlite_master WHERE type = "table"');
    List<String> targetList = [];
    tables.forEach((element) {
      targetList.add(element['name']);
    });
    return targetList;
  }

  Future checkTableIsRight() async {
    List<String> expectTables = ['tokens', 'wallet', 'trade', 'transfer', 'book'];

    List<String> tables = await getTables();

    for (int i = 0; i < expectTables.length; i++) {
      if (!tables.contains(expectTables[i])) {
        return false;
      }
      return true;
    }
  }

  Future init() async {
    String databasesPath = await getDatabasesPath();
    String path = [databasesPath, 'wallet.db'].join();
    print(path);
    try {
      db = await openDatabase(path);
    } catch (e) {
      print("Error $e");
    }

    bool tableIsRight = await this.checkTableIsRight();

    if (!tableIsRight) {
      print('there is no DB Table, new db');

      await deleteDatabase(path);
      db = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
        await db.execute(SqlTable.sql_createTable_token);
        await db.execute(SqlTable.sql_createTable_wallet);
        // await db.execute(SqlTable.sql_createTable_approve);
        await db.execute(SqlTable.sql_createTable_trade);
        await db.execute(SqlTable.sql_createTable_transfer);
        await db.execute(SqlTable.sql_createTable_book);
        print('db created version is $version');
      }, onOpen: (Database db) async {
        print('new db opened');
      });
    } else {
      print("Opening existing database");
    }
  }

  Future createCache() async {
    String databasesPath = await getDatabasesPath();
    String path = [databasesPath, 'wallet.db'].join();
    await deleteDatabase(path);
    print("Database deletion done");
  }

  Future clearTrade() async {
    String databasesPath = await getDatabasesPath();
    await deleteDatabase('trade');
    await db.execute(SqlTable.sql_createTable_trade);
  }
}
