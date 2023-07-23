import 'package:flutter/material.dart';
import 'package:shopping/pages/approved_persons.dart';
import 'package:shopping/pages/drawer/my_drawer.dart';
import 'package:shopping/pages/store_page.dart';
import 'package:shopping/theme/colors.dart';
import 'cart_page.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> with SingleTickerProviderStateMixin {
  late TabController controller;
  int activeTab = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 3, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        drawer: MyDrawer(),
        backgroundColor: white,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: grey),
          elevation: 0.8,
          shadowColor: accent,
          backgroundColor: black,
          actions: [
            Container(
              height: 50,
              alignment: Alignment.center,
              child: const Text(
                "LadiesApp",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: grey),
              ),
            ),
            Hero(
              tag: '10',
              child: Image.asset(
                "assets/logs.png",
                height: 40,
                width: 40,
              ),
            ),
          ],
          bottom: TabBar(
              isScrollable: false,
              labelColor: accent,
              unselectedLabelColor: grey,
              controller: controller,
              indicatorColor: accent,
              tabs: [
                Tab(
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 4,
                    child: const Text(
                      "الاقسام",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      // style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 4,
                    child: const Text(
                      "الحقيبة",
                      // style: TextStyle(color: Colors.white),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 4,
                    child: const Text(
                      "المعتمدين",
                      style: TextStyle(fontWeight: FontWeight.bold),

                      // style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ]),
        ),
        body: TabBarView(
          controller: controller,
          children: [StorePage(), CartPage(), const ApprovedPersons()],
        ),
      ),
    );
  }
}
