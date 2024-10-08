import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:vendorsouqjumla/domain/repositories/auth_repositories.dart';
import 'package:vendorsouqjumla/main.dart';

@injectable
class Authprovider extends ChangeNotifier {
  final AuthRepositories authRepositories;

  Authprovider({required this.authRepositories});

  bool _isLoading = false;
  String? _errorMessage;
  String? _successMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String? get successMessage => _successMessage;

  Future<void> login(String? userName, String? password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final result = await authRepositories.Login(
      userName,
      password,
      'aaaa',
    );

    result.fold(
      (failure) {
        _errorMessage = failure.message;
        showSnakeBar(navigatorKey.currentContext!, _errorMessage, false);
        _isLoading = false;
        notifyListeners();
      },
      (successLogin) {
        _successMessage = successLogin.message;
        showSnakeBar(navigatorKey.currentContext!, _successMessage, true);
        _isLoading = false;
        notifyListeners();
      },
    );
  }

  void showSnakeBar(
      BuildContext context, String? messagestosnakebar, bool isSuccess) {
    // ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "$messagestosnakebar",
          style: const TextStyle(
            color: Colors.white, // Custom text color
            fontSize: 16.0, // Custom text size
          ),
        ),
        backgroundColor: isSuccess == true
            ? Colors.green
            : const Color.fromARGB(255, 248, 0, 54), // Custom background color
        duration: const Duration(seconds: 1), // Custom duration
        behavior: SnackBarBehavior.floating, // Floating behavior
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Rounded corners
        ),
        // action: SnackBarAction(
        //   label: 'Undo',
        //   textColor: Colors.yellow, // Custom action button color
        //   onPressed: () {
        //     // Action when 'Undo' is pressed
        //   },
        // ),
      ),
    );
    // ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }
}
