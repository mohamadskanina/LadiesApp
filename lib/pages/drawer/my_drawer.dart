import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping/pages/information/about.dart';
import 'package:shopping/pages/information/about_me.dart';
import 'package:shopping/theme/colors.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: black,
        child: Column(
          children: [
            SizedBox(
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: black,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: accent,
                      width: 0.5,
                    ),
                  ),
                  height: MediaQuery.of(context).size.width / 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/logs.png",
                        height: 80,
                        width: 80,
                      ),
                      const Text(
                        "Ladies App",
                        style: TextStyle(
                          color: grey,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "سر الأناقة و الجمال",
                        style: TextStyle(
                          color: white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      "أهدافنا",
                      style: TextStyle(
                        color: white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.check_circle_outline_outlined,
                          size: 20,
                          color: accent,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "تأمين كل ما تحتاجينه",
                          style: TextStyle(
                            color: grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15, top: 4),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.check_circle_outline_outlined,
                          color: accent,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "بضائع متجددة بأستمرار",
                          style: TextStyle(
                            color: grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15, top: 4),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.check_circle_outline_outlined,
                          size: 20,
                          color: accent,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "أسعار تنافس الأسواق",
                          style: TextStyle(
                            color: grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    endIndent: 10,
                    indent: 10,
                    color: grey,
                  ),
                  ListTile(
                    dense: true,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AboutPage()));
                    },
                    leading: const Icon(
                      Icons.info_outlined,
                      color: accent,
                    ),
                    title: const Text(
                      "عن التطبيق",
                      style: TextStyle(
                        color: white,
                        fontSize: 14,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_back_ios_new,
                      color: grey,
                      size: 15,
                    ),
                  ),
                  ListTile(
                    dense: true,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AboutMe()));
                    },
                    leading: const Icon(
                      Icons.engineering,
                      color: accent,
                    ),
                    title: const Text(
                      "عن المطور  ",
                      style: TextStyle(
                        color: white,
                        fontSize: 14,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_back_ios_new,
                      color: grey,
                      size: 15,
                    ),
                  ),
                ],
              ),
            ),
            Container(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: const Text(
                  "تابعنا على مواقع التواصل الأجتماعي بالضغط على الايقونات ادناه",
                  style: TextStyle(fontSize: 12, color: grey),
                  textAlign: TextAlign.center,
                )),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: black,
              ),
              margin: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      openurl("https://t.me/mohamadskanina");
                    },
                    icon: const Icon(
                      FontAwesomeIcons.facebook,
                      color: accent,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      openurl("https://www.instagram.com/");
                    },
                    icon: const Icon(
                      FontAwesomeIcons.instagram,
                      color: accent,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FontAwesomeIcons.whatsapp,
                      color: accent,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FontAwesomeIcons.telegram,
                      color: accent,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
