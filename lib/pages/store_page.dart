import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopping/classes/category.dart';
import 'package:shopping/pages/category/category_type.dart';

import 'package:shopping/theme/colors.dart';

class StorePage extends StatefulWidget {
  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
      child: FutureBuilder<List<Categor>?>(
        future: getCategor(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Categor>?> snapshot) {
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
                  style: TextStyle(color: accent, fontWeight: FontWeight.bold),
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
                  children: snapshot.data!.map((categor) {
                return SingleCategory(
                  id: categor.id,
                  title: categor.title!,
                  img: categor.img!,
                  type: categor.type!,
                  gender: categor.gender!,
                );
              }).toList());

              // ignore: dead_code
              break;
          }
        },
      ),
    );
  }
}

class SingleCategory extends StatelessWidget {
  int? id;
  String? title, type, img, gender;
  SingleCategory({
    this.id,
    this.title,
    this.type,
    this.img,
    this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 20),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryType(
                title: title!,
                gender: gender!,
                type: type!,
              ),
            ),
          );
        },
        child: Container(
          height: MediaQuery.of(context).size.height / 5,
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 5,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(img!), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10)),
              ),
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height / 5,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    title!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* 

 InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryType(
              title: title!,
              gender: gender!,
              type: type!,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
        height: MediaQuery.of(context).size.height / 5,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(img!),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          title!,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: white,
          ),
        ),
      ),
    );

 */
Widget loderList() {
  return Shimmer.fromColors(
    direction: ShimmerDirection.rtl,
    baseColor: black,
    highlightColor: accent,
    child: ListView.builder(
        itemCount: 8,
        itemBuilder: ((context, index) {
          return Container(
            margin: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
            height: MediaQuery.of(context).size.height / 5,
            width: double.infinity,
            decoration: BoxDecoration(
              // image: DecorationImage(
              //   image: NetworkImage(img!),
              //   fit: BoxFit.cover,
              // ),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: const Text(
              "يتم التحميل ... ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                // color: white,
              ),
            ),
          );
        })),
  );
}
/*

Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProCategory(
                                    title: storeList[index]['name'],
                                    id: storeList[index]['id'],
                                  )));
                    },
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        NetworkImage(storeList[index]['img']),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: black.withOpacity(0.35),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                storeList[index]['name'],
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );

*/