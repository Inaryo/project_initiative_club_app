import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'package:project_initiative_club_app/ressources/errors/exceptions.dart';
import 'package:project_initiative_club_app/ressources/globals.dart';

abstract class MapsLocalDataSource {
  /// VReturn the JSON Format .
  ///
  /// Throws a [ClientException] in any error case .
  Future<Map<String, dynamic>> getJsonData();

  Future<Map<PolylineId, Polyline>> getRoutes(List<LatLng> positions);
}

class MapsLocalDataSourceImpl implements MapsLocalDataSource {
  @override
  Future<Map<String, dynamic>> getJsonData() async {
    try {
      mapsStyle = await rootBundle.loadString('json/styles.json');
      dynamic result =
          await jsonDecode(await rootBundle.loadString('json/info_map.json'));
      return result;
    } catch (e) {
      throw ClientException(e.toString());
    }
  }

  Future<Map<PolylineId, Polyline>> getRoutes(List<LatLng> positions) async {
    PolylinePoints polylinePoints = PolylinePoints();
    Map<PolylineId, Polyline> polylines = {};
    List<LatLng> polylineCoordinates = [];

    try {
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
          googleApiKey,
          PointLatLng(positions[0].latitude, positions[0].longitude),
          PointLatLng(positions[1].latitude, positions[1].longitude));
      if (result.points.isNotEmpty) {
        result.points.forEach((PointLatLng point) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        });
      }

      PolylineId id = PolylineId("poly");
      Polyline polyline = Polyline(
          polylineId: id, points: polylineCoordinates, color: mainColor);

      polylines[id] = polyline;

      return polylines;
    } catch (e) {
      throw ClientException(e.toString());
    }
  }
}
