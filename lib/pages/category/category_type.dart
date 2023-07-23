import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopping/classes/product.dart';
import 'package:shopping/pages/product_deyail.dart';
import 'package:shopping/theme/colors.dart';

// class CategoryType extends StatefulWidget {

//   @override
//   State<CategoryType> createState() => _CategoryTypeState();
// }

class CategoryType extends StatelessWidget {
  late String gender, type, title;
  CategoryType({required this.gender, required this.type, required this.title});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            title,
            style: const TextStyle(color: accent, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: black,
          elevation: 0,
        ),
        body: Container(
          color: black,
          child: FutureBuilder<List<Product>?>(
            future: getProduct(
              type,
              gender,
            ),
            builder:
                (BuildContext context, AsyncSnapshot<List<Product>?> snapshot) {
              if (snapshot.hasData == false) {
                return loderList();
              }
              if (snapshot.data!.isEmpty == true) {
                return Center(
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "لا يوجد بيانات لعرضها",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: accent, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              }
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return loderList();

                  // ignore: dead_code
                  break;

                default:
                  return ListView(
                      children: snapshot.data!.map((category) {
                    return SingleProduct(
                      id: category.id,
                      title: category.title!,
                      img: category.img!,
                      price: category.price!,
                      mkas: category.mkas,
                      gender: category.gender!,
                      type: category.type!,
                      offer: category.offer!,
                      images: category.images!,
                      code: category.code,
                    );
                  }).toList());
                  // ignore: deadcode
                  // ignore: dead_code
                  break;
              }
            },
          ),
        ),
      ),
    );
  }
}

class SingleProduct extends StatelessWidget {
  int? id;
  String? title, price;
  String? img, gender, type, images, code;
  late String mkas;
  bool? offer;
  SingleProduct({
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
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetail(
              id: id!,
              title: title!,
              imgurl: img!,
              price: price!,
              psize: mkas.split(' '),
              images: images!.split('#-'),
              offer: offer!,
              code: code!,
            ),
          ),
        );
      },
      child: Hero(
        transitionOnUserGestures: true,
        tag: '${id}',
        child: Container(
          alignment: Alignment.topRight,
          margin: const EdgeInsets.all(8),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
                image: NetworkImage(img.toString()), fit: BoxFit.cover),
          ),
          child: offer!
              ? Container(
                  margin: const EdgeInsets.all(8),
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: accent.withOpacity(0.5),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "حسم",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: white,
                    ),
                  ))
              : const Text(" "),
        ),
      ),
    );
  }
}

Widget loderList() {
  return Shimmer.fromColors(
    baseColor: black,
    direction: ShimmerDirection.rtl,
    highlightColor: accent,
    child: ListView.builder(
        itemCount: 4,
        itemBuilder: ((context, index) {
          return Card(
            color: black,
            shadowColor: grey,
            elevation: 1,
            margin: const EdgeInsets.all(8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              height: MediaQuery.of(context).size.width,
            ),
          );
        })),
  );
}
