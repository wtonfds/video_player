abstract class Failures implements Exception {}

class FailureLogin implements Failures {}

class ErrorOnApi implements Failures {
  String message;

  ErrorOnApi(this.message);
}

class ErrorVideo implements Failures {}
