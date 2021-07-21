import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:project_initiative_club_app/ressources/errors/exceptions.dart';
import 'package:project_initiative_club_app/ressources/globals.dart';

abstract class MapsLocalDataSource {
  /// VReturn the JSON Format .
  ///
  /// Throws a [ClientException] in any error case .
  Future<Map<String,dynamic>> getJsonData();
}

class MapsLocalDataSourceImpl implements MapsLocalDataSource {

  
  @override
  Future<Map<String,dynamic>> getJsonData() async {

      
      try {
      
      dynamic result = await jsonDecode(await rootBundle.loadString('json/info_map.json'));
      return result;
      
      } catch (e) {
          throw ClientException(e.toString());
      }
  }

}