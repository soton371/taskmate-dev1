abstract class Failure {
  final String message;
  Failure(this.message);
}

class ResponseFailure extends Failure {
  ResponseFailure(super.message);
}