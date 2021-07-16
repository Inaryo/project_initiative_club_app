import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:project_initiative_club_app/features/News/domain/entities/newsEntity.dart';
import 'package:project_initiative_club_app/ressources/errors/failures.dart';

abstract class NewsRepository {
  /// Return Either the like for the news has been registered
  ///
  /// Return a [Failure] in case of any error .
  Future<Either<Failure, bool>> addLike({NewsEntity news});

  /// Return A List of the USTHB News 
  ///
  /// Return a [Failure] in case of any error .
  Future<Either<Failure, List<NewsEntity>>> getUsthbNews();


  /// Return A List of the Club News 
  ///
  /// Return a [Failure] in case of any error .
  Future<Either<Failure, List<NewsEntity>>> getClubNews();

  /// Return The Register UserObject
  ///
  /// Return a [Failure] in case of any error .
  Future<Either<Failure, UserObject>> register(
      {@required String email,
      @required String password,
      @required String displayName});
}
