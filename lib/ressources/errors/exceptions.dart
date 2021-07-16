class ServerException implements Exception {
  final String message;

  ServerException(this.message);
}

class NoPermissionException implements Exception {
  final String string;

  NoPermissionException(this.string);
}
