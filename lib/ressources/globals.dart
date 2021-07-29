import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_initiative_club_app/features/Maps/domain/entities/maps_data.dart';

List<MapsDataEntity> listMapData = [];
String currentTitle = "Project Initiative";
Map<String, dynamic> jsonData = {};

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
