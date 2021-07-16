import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_initiative_club_app/features/Maps/domain/entities/maps_data.dart';
import 'package:project_initiative_club_app/features/Maps/presentation/widgets/button_change.dart';
import 'package:project_initiative_club_app/features/Maps/presentation/widgets/info_widget.dart';
import 'package:project_initiative_club_app/features/Maps/presentation/widgets/maps_widget.dart';
import 'package:project_initiative_club_app/ressources/globals.dart';

class MapsPage extends StatefulWidget {
  MapsPage({Key? key}) : super(key: key) {
    currentTitle = "USTHB MAPS";
  }

  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  bool state_perso_map = true;
  bool initialized = false;

  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  void createInfoClasse() async {
    Map<String, dynamic> data =
        await jsonDecode(await rootBundle.loadString('json/info_map.json'));
    jsonData = data;

    jsonData.forEach((key, value) {
      listMapData.add(new MapsDataEntity(
          images: value["images"],
          title: value["title"],
          description: value["description"]));
    });

    setState(() {
      initialized = true;
    });
  }

  @override
  void initState() {
    createInfoClasse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenW = MediaQuery.of(context).size.width;
    double screenH = MediaQuery.of(context).size.height;
    double heightImage = screenH / 2.5;
    listMapData = [
      MapsDataEntity(
          images: ["images/pi/image_1.png"],
          title: "Faculté Informatique",
          description:
              "La faculté d'informatique est situé entre celle de la FSTGAT et ......"),
      MapsDataEntity(
          images: ["images/pi/image_1.png"],
          title: "Faculté Informatique",
          description:
              "La faculté d'informatique est situé entre celle de la FSTGAT et ......"),
      MapsDataEntity(
          images: ["images/pi/image_1.png"],
          title: "Faculté Informatique",
          description:
              "La faculté d'informatique est situé entre celle de la FSTGAT et ......"),
      MapsDataEntity(
          images: ["images/pi/image_1.png"],
          title: "Faculté Informatique",
          description:
              "La faculté d'informatique est situé entre celle de la FSTGAT et ......"),
    ];

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          //* Maps
          MapsWidget(
              screenW: screenW / 1.05,
              heightImage: heightImage,
              state_perso_map: state_perso_map),
          //* Button For Changing Verions
          ButtonMapVersionChange(
            screenH: screenH,
            screenW: screenW,
            function: () {
              setState(() => state_perso_map = !state_perso_map);
            },
          ),
          SizedBox(
            height: 25,
          ),
          Expanded(
            child: InfoListWidget(
              list: listMapData,
              context: context,
              screenW: screenW,
              screenH: screenH,
            ),
          ),
        ],
      ),
    );
  }
}
