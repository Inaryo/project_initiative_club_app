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
