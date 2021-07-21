
import '../../../../ressources/errors/failures.dart';
import '../entities/maps_data.dart';
import 'package:dartz/dartz.dart';


abstract class MapsRepository {
 

  /// Return The List of all the data maps 
  ///
  /// Return a [Failure] in case of any error .
  Future<Either<Failure, List<MapsDataEntity>>> getMapsData();

  
}
