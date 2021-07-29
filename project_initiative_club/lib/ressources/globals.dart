import 'package:flutter/material.dart';
import 'package:project_initiative_club_app/features/Maps/domain/entities/maps_data.dart';

List<MapsDataEntity> listMapData = [];
String currentTitle = "Project Initiative";
Map<String, dynamic> jsonData = {};
List<dynamic> scolarityData = [
  [
    "Math&Info",
    "Math & Informatique",
    "Genie Logiciel .....",
    "Faculté d'Informatiques"
  ],
  ["ST", "Science Technologique", "GM , GC , GP", "Faculté ..."],
  ["Biologie", "Bilogie", "Genetique .....", "Faculté de Biologie FSB"],
  ["SM", "Science De la Matiere", "Genetique .....", "Faculté de SM"],
];

String mapsStyle = "";

String googleApiKey = "AIzaSyD_jwnF83AaA_BhdxboBHAfm6xair87iaI";

Map<int, String> mapFilter = {
  0: "Buvettes",
  1: "Entrées",
  2: "Facultés",
  3: "Administration",
  4: "Autre"
};

Color mainColor = Colors.orange.shade800;

var iconAdminsitration;
var iconEntry;
var iconFood;
var iconFaculty;
var iconOther;
var mapStyle;
