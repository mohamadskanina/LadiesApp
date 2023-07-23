import 'package:shopping/database/database_conect.dart';

class Categor {
  int? id;
  String? title, type, img, gender;
  Categor({
    this.id,
    this.title,
    this.type,
    this.img,
    this.gender,
  });

  factory Categor.fromjeson(Map<String?, dynamic> map) {
    return Categor(
      id: map['id'],
      title: map['title'],
      img: map['img'],
      type: map['type'],
      gender: map['gender'],
    );
  }
}

Future<List<Categor>?> getCategor() async {
  final response = await clinet.from('category').select().execute();
  if (response.data != null) {
    List res;
    res = response.data as List;
    return res.map((map) => Categor.fromjeson(map)).toList();
  }
}
