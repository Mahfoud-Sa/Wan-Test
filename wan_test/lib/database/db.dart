import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wan_test/person.dart';
import 'package:wan_test/database/db.dart';

class SqlDb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDb();
      return _db;
    } else {
      return _db;
    }
  }

  intialDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'persons.db');
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldversion, int newversion) {}

  _onCreate(Database db, int version) async {
    await db.execute('''
  CREATE TABLE $tableName ( 
    "id" INTEGER  PRIMARY KEY  AUTOINCREMENT, 
    "fullName" TEXT NOT NULL,
    "idNum" INTEGER ,
    "phoneNum" INTEGER,
    "e_mail" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "usrName" TEXT NOT NULL,
    "password" TEXT ,
    "gender" TEXT NOT NULL
   )
 ''');
  }

  Future<Map> getCurrentPerson() async {
    SharedPreferences personShrpre = await SharedPreferences.getInstance();
    int id = int.parse(personShrpre.get('id').toString());

    Database? mydb = await db;
    List<Map> response =
        await mydb!.rawQuery("SELECT * FROM persons where id=$id");
    return response.first;
  }

  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);

    return response;
  }

  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deleteData(int id) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete("delete from students where id=$id");
    return response;
  }

  Future<bool> LogIn(String useName, String password) async {
    Database? mydb = await db;

    bool state = false;

    var response = await mydb!.rawQuery('select * from persons ');
    for (var usr in response.toList()) {
      if (usr['usrName'] == useName && usr['password'] == password) {
        state = true;
        SharedPreferences personShrpre = await SharedPreferences.getInstance();
        personShrpre.setString('personName', usr['fullName'].toString());
        personShrpre.setString('personEmail', usr['e_mail'].toString());
        personShrpre.setInt('id', int.parse(usr['id'].toString()));

        break;
      }
    }

    return state;
  }
}

class AppProbider with ChangeNotifier {
  int userIndex = -1;
  ThemeMode themMode = ThemeMode.light;
  //List<String> account = getAcount();
  void changeTheme() {
    if (themMode == ThemeMode.dark) {
      themMode = ThemeMode.light;
    } else {
      themMode = ThemeMode.dark;
    }
    // darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }
}



//Future<Person> getCurrentUser(int index) {}
