import 'package:shopping/database/database_conect.dart';

class Product {
  int? id;
  String? title, price;
  String? img, gender, type, images;
  late String mkas;
  bool? offer;
  String? code;
  Product({
    this.id,
    this.title,
    this.price,
    this.gender,
    this.img,
    this.images,
    required this.mkas,
    this.type,
    this.offer,
    this.code,
  });

  factory Product.fromjeson(Map<String?, dynamic> map) {
    return Product(
      id: map['id'],
      title: map['title'],
      img: map['img'],
      price: map['price'],
      type: map['type'],
      gender: map['gender'],
      mkas: map['mkas'],
      images: map['images'],
      offer: map['offer'],
      code: map['code'],
    );
  }
}

Future<List<Product>?> getall() async {
  final response = await clinet.from('product').select().execute();
  if (response.data != null) {
    List res;
    res = response.data as List;
    return res.map((map) => Product.fromjeson(map)).toList();
  }
}

Future<List<Product>?> getProduct(String? type, String? g) async {
  final response = await clinet
      .from('product')
      .select()
      .eq(
        "gender",
        g!,
      )
      .eq("type", type)
      .execute();

  if (response.data != null) {
    List res;
    res = response.data as List;
    return res.map((map) => Product.fromjeson(map)).toList();
  }
}
