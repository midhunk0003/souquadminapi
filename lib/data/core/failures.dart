class Failure {
  String? message;

  Failure({required this.message});
}

class ServerFailures extends Failure {
  ServerFailures(String? message) : super(message: message);
}

class LoginFailure extends Failure {
  LoginFailure(String? message) : super(message: message);
}

class ClientFailure extends Failure {
  ClientFailure(String? message) : super(message: message);
}

class OtherFailureNon200 extends Failure {
  OtherFailureNon200(String? message) : super(message: message);
}

class NetworkFailure extends Failure {
  NetworkFailure(String? message) : super(message: message);
}
