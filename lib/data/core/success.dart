class Success {
  String? message;

  Success({required this.message});
}

class LoginSuccess extends Success {
  LoginSuccess(String? message) : super(message: message);
}
