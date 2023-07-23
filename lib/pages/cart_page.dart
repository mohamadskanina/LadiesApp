import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping/database/localdb.dart';

import 'package:shopping/theme/colors.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  SqlDb db = SqlDb();
  List<Map> price = [
    {'SUM(price)': 0}
  ];
  Future<List<Map>> getData() async {
    price = await db.readData('SELECT SUM(price) FROM cart');

    List<Map> data = await db.readData('SELECT * FROM cart ');

    return data;
  }

  void ref() async {
    price = await db.readData('SELECT SUM(price) FROM cart');

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    int money = price[0]['SUM(price)'] ?? 0;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: black,
        body: Column(
          children: [
            getBody(() {
              ref();
            }),
          ],
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(bottom: 10),
          height: MediaQuery.of(context).size.height / 3.8,
          child: Column(
            children: [
              const Divider(
                indent: 8,
                endIndent: 8,
                color: grey,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                alignment: Alignment.centerRight,
                child: Text(
                  "السعر الإجمالي : $money ليرة تركي ",
                  style: const TextStyle(
                    color: grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Divider(
                indent: 8,
                endIndent: 8,
                color: grey,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text(
                  "لتاكيد طلبك في المشتريات كل ما عليك هو الذهاب الى المعتمد الخاص في بلدك ودفع  ${money * 0.75} ليرة تركي",
                  style: const TextStyle(
                    color: grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              InkWell(
                onTap: () async {
                  await db.deleteData('DELETE  FROM cart');
                  ref();
                },
                child: const Text(
                  "إفراغ الحقيبة ؟ إضغط هنا لاإفراغها",
                  style: TextStyle(
                    color: accent,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getBody(VoidCallback callback) {
    return Expanded(
      flex: 2,
      child: FutureBuilder<List<Map>>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<List<Map>> snapshot) {
          if (snapshot.hasData == false) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: accent,
                valueColor: AlwaysStoppedAnimation(white),
              ),
            );
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
              return const Center(
                  child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(accent),
              ));

              // ignore: dead_code
              break;

            default:
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, i) {
                  return SinglePro(
                      id: snapshot.data![i]['id'],
                      title: snapshot.data![i]['title'],
                      price: snapshot.data![i]['price'],
                      code: snapshot.data![i]['code'],
                      img: snapshot.data![i]['img'],
                      size: snapshot.data![i]['size'],
                      callback: callback);
                },
              );
              // ignore: dead_code
              break;
          }
        },
      ),
    );
  }
}

/*


*/
class SinglePro extends StatelessWidget {
  int? id;
  String? img, size, title, code, price;
  VoidCallback? callback;
  SinglePro({
    Key? key,
    this.id,
    this.code,
    this.img,
    this.size,
    this.title,
    this.price,
    this.callback,
  }) : super(key: key);
  SqlDb db = SqlDb();
  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      isThreeLine: true,
      leading: Container(
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(img!),
          ),
        ),
      ),
      title: Text(
        "كود القطعة : $code ",
        style: const TextStyle(fontSize: 16, color: white),
      ),
      subtitle: Text(
        "المقاس : ${size!.toUpperCase()}",
        style: const TextStyle(fontSize: 14, color: white),
      ),
      trailing: IconButton(
        onPressed: () async {
          await db.deleteData('DELETE FROM cart WHERE id = $id');
          callback!.call();
        },
        icon: const Icon(
          Icons.delete_rounded,
          color: accent,
        ),
      ),
    );
    // return Column(
    //   children: [
    //     Padding(
    //       padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
    //       child: Row(
    //         children: [
    //           Container(
    //             width: MediaQuery.of(context).size.width / 4,
    //             height: MediaQuery.of(context).size.width / 4,
    //             decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(10),
    //                 image: DecorationImage(
    //                     image: NetworkImage(img!), fit: BoxFit.cover)),
    //           ),
    //           const SizedBox(
    //             width: 20,
    //           ),
    //           SizedBox(
    //             height: MediaQuery.of(context).size.width / 4,
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 // Text(
    //                 //   title!,
    //                 //   style: const TextStyle(fontSize: 20, color: white),
    //                 // ),
    //                 Text(
    //                   "كود القطعة : $code ",
    //                   style: const TextStyle(fontSize: 16, color: white),
    //                 ),
    //                 Text(
    //                   "المقاس : ${size!.toUpperCase()}",
    //                   style: const TextStyle(fontSize: 14, color: white),
    //                 ),
    //                 Text("السعر : ${price!}",
    //                     style: const TextStyle(fontSize: 14, color: white)),
    //               ],
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //     const SizedBox(
    //       height: 20,
    //     ),
    //   ],
    // );
  }
}

/*

ListView(
      children: [
        Column(
          children: List.generate(
            cartList.length,
            (index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                    child: Row(
                      children: [
                        Container(
                          width: 140,
                          height: 180,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(cartList[index]['img']),
                                  fit: BoxFit.cover)),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartList[index]['name'],
                              style:
                                  const TextStyle(fontSize: 20, color: white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "ref " + cartList[index]['ref'],
                              style:
                                  const TextStyle(fontSize: 13, color: white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              cartList[index]['size'],
                              style:
                                  const TextStyle(fontSize: 18, color: white),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(cartList[index]['price'],
                                    style: const TextStyle(
                                        fontSize: 18, color: white)),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              );
            },
          ),
        ),
        const Divider(
          indent: 10,
          endIndent: 10,
          color: grey,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerRight,
          child: const Text(
            "السعر الإجمالي :",
            style: TextStyle(
              color: grey,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const Divider(
          indent: 10,
          endIndent: 10,
          color: grey,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: const Text(
            "لتاكيد طلبك في المشتريات إضغط على أيقونة المراسلة التي على اليسار",
            style: TextStyle(
              color: grey,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 50,
        )
      ],
    );
 

 */