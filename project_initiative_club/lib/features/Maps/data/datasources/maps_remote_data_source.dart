import 'package:meta/meta.dart';

abstract class MapsRemoteDataSource {}

class MapsRemoteDataSourceImpl implements MapsRemoteDataSource {
  MapsRemoteDataSourceImpl();

  /*@override
  UserObjectModel getUser() {
    try {
      final fireBaseUser = fireBaseAuth.currentUser;
      return UserObjectModel.fromFireBaseUser(fireBaseUser);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  bool isConnected() {
    try {
      final fireBaseUser = fireBaseAuth.currentUser;

      if (fireBaseUser == null) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      throw ServerException("Servor Error");
    }
  }

  @override
  Future<UserObject> logginIn({String email, String password}) async {
    try {
      var result = await fireBaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return UserObjectModel.fromFireBaseUser(result.user);
    } on FirebaseAuthException catch (error) {
      throw LoginException(error.code);
    } catch (error) {
      throw ServerException(error.toString());
    }
  }

  Future<UserObject> createUser(
      {String email, String password, String displayName}) async {
    try {
      var result = await fireBaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      var user = result.user;
      await user.updateProfile(displayName: displayName, photoURL: "default");
      return UserObjectModel.fromFireBaseUser(user);
    } on FirebaseAuthException catch (error) {
      throw RegisterException(error.code);
    } catch (error) {
      throw ServerException(error.toString());
    }
  }*/
}
