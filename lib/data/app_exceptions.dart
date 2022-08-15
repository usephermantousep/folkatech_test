//CLASS FOR CLASIFICATION EXCEPTION

class AppException implements Exception {
  final String message;
  final String prefix;
  AppException(this.message, this.prefix);

  @override
  String toString() {
    return "$prefix$message";
  }
}

class FetchDataException extends AppException {
  FetchDataException(String message)
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException(String message) : super(message, "Error : ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException(String message) : super(message, "Error :");
}

class ServerException extends AppException {
  ServerException(String message) : super(message, "Error : ");
}

class NoInternetException extends AppException {
  NoInternetException(String message) : super(message, "Error : ");
}

class NotFoundException extends AppException {
  NotFoundException(String message) : super(message, "Error :");
}
