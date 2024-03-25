class ConnectionException implements Exception {
  final String message;

  ConnectionException(this.message);
}

class RequestException implements Exception {
  final String message;

  RequestException(this.message);
}

class BadRequestException implements Exception {
  final String message;

  BadRequestException(this.message);
}

class UnauthorizedException implements Exception {
  final String message;

  UnauthorizedException(this.message);
}
