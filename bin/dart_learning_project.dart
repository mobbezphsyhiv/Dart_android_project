import 'package:http/http.dart' as http;
import 'dart:convert';
//import 'package:json_serializable/json_serializable.dart';
//import 'package:sqlite3/sqlite3.dart';
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
 GetJSON();

}

 void GetJSON() async{
  http.Response response = await http.get(Uri.parse('https://api.genderize.io?name=danilo'));
  Map<String, dynamic> persona = jsonDecode(response.body);
  var user = Person.fromJson(persona);
  print(user.probability);
  print(user.gender);
  print(user.name);
  print(user.count);

}

