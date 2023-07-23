// import 'package:flutter/material.dart';
// import 'package:shopping/pages/category/category_type.dart';
// import 'package:shopping/theme/colors.dart';

// class ProCategory extends StatefulWidget {
//   String? title, type;
//   ProCategory({
//     this.title,
//     this.type,
//   });

//   @override
//   State<ProCategory> createState() => _ProCategoryState();
// }

// class _ProCategoryState extends State<ProCategory>
//     with SingleTickerProviderStateMixin {
//   late TabController controller;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     controller = TabController(length: 6, vsync: this);
//     controller.addListener(() {
//       setState(() {});
//     });
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         appBar: AppBar(
//           elevation: 0.8,
//           shadowColor: accent,
//           backgroundColor: Colors.black,
//           title: Text(widget.title!),
//           centerTitle: true,
//           bottom: TabBar(
//               isScrollable: true,
//               labelColor: accent,
//               unselectedLabelColor: grey,
//               controller: controller,
//               indicatorColor: accent,
//               tabs: const [
//                 Tab(
//                   child: Text(
//                     "كنزات",
//                     // style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//                 Tab(
//                   child: Text(
//                     "قمصان",
//                     // style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//                 Tab(
//                   child: Text(
//                     "بناطيل",
//                     // style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//                 Tab(
//                   child: Text(
//                     "بيجاما",
//                     // style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//                 Tab(
//                   child: Text(
//                     "احذية",
//                     // style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//                 Tab(
//                   child: Text(
//                     "إكسسوار",
//                     // style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ]),
//         ),
//         body: TabBarView(
//           controller: controller,
//           children: [
//             CategoryType(
//               gender: "${widget.type}",
//               type: "sweater",
//             ),
//             CategoryType(
//               gender: "${widget.type}",
//               type: "shirt",
//             ),
//             CategoryType(
//               gender: "${widget.type}",
//               type: "trousers",
//             ),
//             CategoryType(
//               gender: "${widget.type}",
//               type: "pajamas",
//             ),
//             CategoryType(
//               gender: "${widget.type}",
//               type: "shoes",
//             ),
//             CategoryType(
//               gender: "${widget.type}",
//               type: "accessories",
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
