class NoInternetException implements Exception {
  final String message;

  NoInternetException({this.message = 'No internet connection'});

  @override
  String toString() => 'NoInternetException: $message';
}

class ResponseException implements Exception {
  final String message;

  ResponseException({required this.message});

  @override
  String toString() => 'ResponseException: $message';
}

class UnknownNetworkException implements Exception {
  final String message;

  UnknownNetworkException({this.message = 'Unknown network error'});

  @override
  String toString() => 'UnknownNetworkException: $message';
}
