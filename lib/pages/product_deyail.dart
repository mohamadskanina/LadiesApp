import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping/database/localdb.dart';
import 'package:shopping/theme/colors.dart';

class ProductDetail extends StatefulWidget {
  String? imgurl, title, price, gender, type, code;
  List<String>? psize;
  int? id;
  bool? offer;
  List<String>? images;
  ProductDetail({
    this.id,
    this.imgurl,
    this.title,
    this.price,
    this.psize,
    this.gender,
    this.type,
    this.offer,
    this.images,
    this.code,
  });

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  SqlDb db = SqlDb();
  String selectedimages = " ";
  String? sizeof = 'لم يتم الإختيار';

  void showModel(context) {
    showModalBottomSheet(
        backgroundColor: black,
        context: context,
        builder: (BuildContext cb) {
          return Container(
            decoration: const BoxDecoration(
              // border: Border.all(color: accent),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: black,
            ),
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: const Icon(
                    Icons.done,
                    color: accent,
                    size: 100,
                  ),
                ),
                const Center(
                  child: Text(
                    'تمت  الإضافة الى الحقيبة',
                    style: TextStyle(
                        fontSize: 20,
                        color: white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Center(
                  child: Text(
                    'شكراً لثقتك بنا و الطلب من عندنا',
                    style: TextStyle(
                      fontSize: 16,
                      color: grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: MaterialButton(
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: black,
                          border: Border.all(color: accent)),
                      child: const Text(
                        "إغلاق",
                        style: TextStyle(
                            fontSize: 18,
                            color: accent,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                )
              ],
            ),
          );
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    selectedimages = widget.imgurl!;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: black,
        body: Container(
          padding: const EdgeInsets.all(1),
          height: size.height,
          child: ListView(
            children: [
              Hero(
                  tag: '${widget.id}',
                  child: Card(
                    elevation: 0,
                    child: Image.network(
                      selectedimages,
                      fit: BoxFit.cover,
                    ),
                  )),
              SizedBox(
                height: size.width / 4,
                width: size.width,
                child: ListView.builder(
                    itemCount: widget.images!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          selectedimages = widget.images![index];
                          setState(() {});
                        },
                        child: Container(
                          margin: const EdgeInsets.all(2),
                          height: size.width / 4,
                          width: size.width / 4,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: selectedimages == widget.images![index]
                                    ? accent
                                    : black,
                              ),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    widget.images![index],
                                  ),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      );
                    }),
              ),
              widget.psize![0] == "null"
                  ? const SizedBox(
                      height: 0,
                    )
                  : Container(
                      padding: const EdgeInsets.only(right: 4),
                      // alignment: Alignment.centerRight,
                      height: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 30,
                              width: double.infinity,
                              child: const Text(
                                "ِإخترِ المقاس المناسب لك : ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: grey,
                                ),
                              )),
                          SizedBox(
                            height: 40,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.psize!.length,
                              itemBuilder: ((context, index) {
                                return InkWell(
                                  onTap: () {
                                    sizeof = widget.psize![index];
                                    setState(() {});
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(4),
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        color: sizeof == widget.psize![index]
                                            ? accent
                                            : grey.withOpacity(0.7),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text(
                                      widget.psize![index].toUpperCase(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.title!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: grey,
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
              ),
              const Divider(
                color: grey,
                endIndent: 8,
                indent: 8,
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Text(
                      "السعر:  ",
                      style: TextStyle(
                          color: grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Text(
                      widget.price!.toString(),
                      style: const TextStyle(
                          color: accent,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )
                  ],
                ),
              ),
              const Divider(
                color: grey,
                endIndent: 8,
                indent: 8,
              ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            int x = await db.insertData(
                "INSERT INTO cart(title,size,code,img,price) VALUES ('${widget.title}','$sizeof','${widget.code}','${widget.imgurl}','${widget.price}')");
            print(x);
            showModel(context);
          },
          backgroundColor: accent,
          child: const Icon(
            Icons.add_shopping_cart_rounded,
            color: white,
          ),
        ),
      ),
    );
  }
}
