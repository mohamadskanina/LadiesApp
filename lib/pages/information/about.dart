import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping/theme/colors.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (() => Navigator.of(context).pop()),
            icon: const Icon(Icons.arrow_back_ios),
          ),
          centerTitle: true,
          backgroundColor: black,
        ),
        body: Container(
          color: black,
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/logs.png",
                        height: 125,
                        width: 125,
                      ),
                    ),
                    const Center(
                      child: Text(
                        "Ladies App",
                        style: TextStyle(
                          color: grey,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Divider(
                      indent: 10,
                      endIndent: 10,
                      color: grey,
                    ),
                    const Text(
                      "تطبيق يتيح لكِ التسوق من ضمن منزلكِ  و  يأمن لك أفضل الأسعار و أحدث المنتجات المتوفرة ضمن الأسواق التركية ",
                      style: TextStyle(
                        color: grey,
                        fontSize: 16,
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "في حال واجهت مشكلة في التطبيق او تريد الاستفسار عن أي شيء يمكنك مراسلتنا على مواقع التواصل الاجتماعي الموجودة اداناه بالضغط عليها فقط",
                  style: TextStyle(
                    color: grey,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
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
                        openurl("https://www.facebook.com/MohamadSamerKanina");
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
      ),
    );
  }
}
