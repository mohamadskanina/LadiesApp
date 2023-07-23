import 'package:shopping/database/database_conect.dart';

class Person {
  int? id;
  String? name, location;
  Person({
    this.id,
    this.name,
    this.location,
  });

  factory Person.fromjeson(Map<String?, dynamic> map) {
    return Person(
      id: map['id'],
      name: map['name'],
      location: map['location'],
    );
  }
}

Future<List<Person>?> getPerson() async {
  final response = await clinet.from('persones').select().execute();
  if (response.data != null) {
    List res;
    res = response.data as List;
    return res.map((map) => Person.fromjeson(map)).toList();
  }
}
