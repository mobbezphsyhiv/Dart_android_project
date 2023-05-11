import 'package:http/http.dart' as http;
import 'dart:convert';
//import 'package:sqlite3/sqlite3.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
class Person {
  int count;
  String gender;
  String name;
  double probability;
  Person(this.count, this.gender, this.name, this.probability);

  Person.fromJson(Map<String, dynamic> json)
      : count = json['count'],
        gender = json['gender'],
        probability = json['probability'],
        name = json['name'];


}
void main() async{
  //GetJSON();

 D();
 Dreturn();
}

 //void GetJSON() async{
  //http.Response response = await http.get(Uri.parse('https://api.genderize.io?name=anya'));
 // Map<String, dynamic> persona = jsonDecode(response.body);
  //var user = Person.fromJson(persona);
  //print(user.probability);
 // print(user.gender);
 // print(user.name);
 // print(user.count);

//}
Future D() async {

  sqfliteFfiInit();

  var databaseFactory = databaseFactoryFfi;
  var db = await databaseFactory.openDatabase(
      'E:/Програмування/Віжуал фігня/Курси/dart_attempt/dat.db');
  await db.execute(
      "CREATE TABLE IF NOT EXISTS Names (count INT, gender VARCHAR(20), name VARCHAR(20) PRIMARY KEY ON CONFLICT REPLACE, probability REAL)");
http.Response response = await http.get(Uri.parse('https://api.genderize.io?name=sasha'));
Map<String, dynamic> persona = jsonDecode(response.body);
var user = Person.fromJson(persona);
var name = user.name;
var probability = user.probability;
var count = user.count;
var gender = user.gender;
  await db.execute ("INSERT INTO Names (count, gender, name, probability) VALUES($count, '$gender', '$name', $probability )");
  await db.close();
}
void Dreturn() async{
  sqfliteFfiInit();

  var databaseFactory = databaseFactoryFfi;
  var db = await databaseFactory.openDatabase(
      'E:/Програмування/Віжуал фігня/Курси/dart_attempt/dat.db');
  var result = await db.query('Names');
  print(result);
  await db.close();
}
