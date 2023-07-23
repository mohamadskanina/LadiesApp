import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopping/classes/person.dart';
import 'package:shopping/theme/colors.dart';

class ApprovedPersons extends StatelessWidget {
  const ApprovedPersons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: black,
      child: getBody(context),
    );
  }
}

Widget getBody(BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height,
    child: FutureBuilder<List<Person>?>(
      future: getPerson(),
      builder: (BuildContext context, AsyncSnapshot<List<Person>?> snapshot) {
        if (snapshot.hasData == false) {
          return Text("Loding .....");
        }
        if (snapshot.data!.isEmpty == true) {
          return Center(
            child: Container(
              alignment: Alignment.center,
              child: const Text(
              "No Data",
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
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, i) {
                return SinglePerson(
                  id: snapshot.data![i].id!,
                  name: snapshot.data![i].name,
                  location: snapshot.data![i].location,
                );
              },
            );
            // ignore: dead_code
            break;
        }
      },
    ),
  );
}

class SinglePerson extends StatelessWidget {
  int? id;
  String? name, location;
  SinglePerson({this.id, this.name, this.location});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: black,
      shadowColor: grey,
      elevation: 1,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        isThreeLine: true,
        dense: true,
        title: Text(
          name!,
          style: const TextStyle(
              color: white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(
          location!,
          style: const TextStyle(
              color: grey, fontWeight: FontWeight.bold, fontSize: 14),
        ),
        leading: const Icon(
          Icons.location_on_sharp,
          color: accent,
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
        itemCount: 10,
        itemBuilder: ((context, index) {
          return Card(
            color: black,
            shadowColor: grey,
            elevation: 1,
            margin: const EdgeInsets.all(8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: const ListTile(
              title: Text(
                "يتم التحميل",
                style: TextStyle(
                    color: white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text(
                "يرجى الإنتظار .......",
                style: TextStyle(
                    color: grey, fontWeight: FontWeight.bold, fontSize: 14),
              ),
              leading: Icon(
                Icons.location_on_sharp,
                color: accent,
              ),
            ),
          );
        })),
  );
}
