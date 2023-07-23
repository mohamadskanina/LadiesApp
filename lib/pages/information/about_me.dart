import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping/theme/colors.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (() => Navigator.of(context).pop()),
            icon: Icon(Icons.arrow_back_ios),
          ),
          centerTitle: true,
          backgroundColor: black,
        ),
        body: Container(
          color: black,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/code.png",
                    width: 70,
                    height: 70,
                  ),
                  const Text(
                    "MSK",
                    style: TextStyle(
                        color: grey, fontSize: 45, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Divider(
                indent: 10,
                endIndent: 10,
                color: grey,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Card(
                      color: black,
                      shadowColor: accent.withOpacity(0.5),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: const Text(
                          "محمد  قنينه",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: grey,
                          ),
                        ),
                        leading: Icon(
                          Icons.person,
                          color: accent.withOpacity(0.5),
                        ),
                      ),
                    ),
                    Card(
                      color: black,
                      shadowColor: accent.withOpacity(0.5),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: const Text(
                          "مهندس معلوماتية",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: grey,
                          ),
                        ),
                        leading: Icon(
                          Icons.work,
                          color: accent.withOpacity(0.5),
                        ),
                      ),
                    ),
                    Card(
                      color: black,
                      shadowColor: accent.withOpacity(0.5),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: const Text(
                          "خبير في تطوير تطبيقات سطح المكتب و تطبيقات الهواتف المحمولة ",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: grey,
                          ),
                        ),
                        leading: FaIcon(
                          FontAwesomeIcons.infoCircle,
                          color: accent.withOpacity(0.5),
                        ),
                      ),
                    ),
                    Card(
                      color: black,
                      shadowColor: accent.withOpacity(0.5),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: const Text(
                          "في حال لديك فكرى تريد تنفيذها لا تتردد في التواصل معي على معرفاتي الموجودة أدناه",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: grey,
                          ),
                        ),
                        leading: FaIcon(
                          FontAwesomeIcons.smileBeam,
                          color: accent.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
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
                      icon: Icon(
                        FontAwesomeIcons.facebook,
                        color: accent.withOpacity(0.5),
                        size: 35,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    IconButton(
                      onPressed: () {
                        openurl("https://www.instagram.com/");
                      },
                      icon: Icon(
                        FontAwesomeIcons.instagram,
                        size: 35,
                        color: accent.withOpacity(0.5),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    IconButton(
                      onPressed: () {
                        openurl("whatsapp://send?phone=+352681594938");
                      },
                      icon: Icon(
                        FontAwesomeIcons.whatsapp,
                        size: 35,
                        color: accent.withOpacity(0.5),
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
