import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendorsouqjumla/data/model/default_category_model/default_category_model.dart';
import 'package:vendorsouqjumla/domain/repositories/default_category_repositories.dart';
import 'package:vendorsouqjumla/main.dart';

@injectable
class DefaultCategoryProvider extends ChangeNotifier {
  final DefaultCategoryRepositories defaultCategoryRepositories;

  DefaultCategoryProvider({required this.defaultCategoryRepositories});

  bool _isLoading = false;
  bool _isPostLoading = false;
  bool _isSavedornot = false;
  String? _errorMessage;
  String? _errorpostMessage;
  String? _successPostMessage;
  String? _successMessage;
  List<DefaultCategory>? _defaultCategoryLIst;

  BuildContext _context = navigatorKey.currentContext!;

  bool get isLoading => _isLoading;
  bool get isSavedornot => _isSavedornot;
  bool get isPostLoading => _isPostLoading;
  String? get errorMessage => _errorMessage;
  String? get errorpostMessage => _errorpostMessage;
  String? get successPostMessage => _successPostMessage;
  String? get successMessage => _successMessage;
  List<DefaultCategory>? get defaultCategoryLIst => _defaultCategoryLIst;

  int? _id;
  bool? _isactive;
  String? _eng_title;
  String? _arb_title;
  String? _image;

  //setters
  set id(int? value) {
    _id = value;
  }

  set isactive(bool? value) {
    _isactive = value;
  }

  set eng_title(String? value) {
    _eng_title = value;
  }

  set arb_title(String? value) {
    _arb_title = value;
  }

  set image(String? value) {
    _image = value;
  }

  //getters
  int? get gettid => _id;
  bool? get gettisactive => _isactive;
  String? get getteng_title => _eng_title;
  String? get gettarb_title => _arb_title;
  String? get gettimage => _image;

  void prints() {
    print('deid : ${_id}');
    print('de is active :$_isactive');
    print('detit : $_eng_title');
    print('deart : $_arb_title');
    print('deimg : $_image');
  }

  void makeDataEmpty() {
    print('make data empty');
    _id = null;
    _isactive = null;
    _eng_title = null;
    _arb_title = null;
    _image = null;
  }

  Future<void> getDefaultCategory() async {
    final loginToken = await SharedPreferences.getInstance();
    final String? loginT = loginToken.getString('auth_token');
    _isSavedornot = false;
    _isLoading = true;
    notifyListeners();
    final result = await defaultCategoryRepositories.getDefaultCAtegory(loginT);
    print('result 1111111 : $result');

    result.fold(
      (failure) {
        _isLoading = false;
        _errorMessage = failure.message;
        notifyListeners();
      },
      (defaultCategory) {
        _isLoading = false;
        _defaultCategoryLIst = defaultCategory;
        notifyListeners();
      },
    );
  }

  Future<void> postCategory(
    int? id,
    String? eng_title,
    String? arb_title,
    String? imagefile,
  ) async {
    final pref = await SharedPreferences.getInstance();
    final String? loginToken = pref.getString('auth_token');
    _isSavedornot = false;
    _isLoading = true;
    _isPostLoading = true;

    notifyListeners();

    print('id from default cat : $id');
    print('eng title from default cat : $eng_title');
    print('arb  from default cat : $arb_title');
    print('img from default cat : $imagefile');

    final result = await defaultCategoryRepositories.postCategory(
      loginToken,
      id,
      eng_title,
      arb_title,
      imagefile,
    );

    print('defautl category repo provider post : $result');

    result.fold(
      (failure) {
        _errorpostMessage = failure.message;
        _isPostLoading = false;
        _showSnakebarf(_errorpostMessage, _context);
        notifyListeners();
      },
      (successPostCat) {
        _isSavedornot = true;
        _successPostMessage = successPostCat.message;
        _errorMessage = null;
        _isPostLoading = false;
        _showSnakebarf(_successPostMessage, _context);
        notifyListeners();
      },
    );
  }

  Future<void> hideCategory(String? id) async {
    final pref = await SharedPreferences.getInstance();
    final String? loginToken = pref.getString('auth_token');
    _isSavedornot = false;
    _isLoading = true;
    notifyListeners();
    final result = await defaultCategoryRepositories.hideCategory(
      loginToken,
      id,
    );
    result.fold(
      (failure) {
        _errorMessage = failure.message;
        _isLoading = false;
        _showSnakebarf(_errorMessage, _context);
        notifyListeners();
      },
      (successMessage) {
        _successMessage = successMessage.message;
        _isLoading = false;
        _showSnakebarf(_successMessage, _context);
        notifyListeners();
      },
    );
  }

  Future<void> deleteCategory(String? id) async {
    final pref = await SharedPreferences.getInstance();
    final String? loginToken = pref.getString('auth_token');
    _isSavedornot = false;
    _isLoading = true;
    notifyListeners();
    final result = await defaultCategoryRepositories.deleteCategory(
      loginToken,
      id,
    );
    result.fold(
      (failure) {
        _errorMessage = failure.message;
        _isLoading = false;
        _showSnakebarf(_errorMessage, _context);
        notifyListeners();
      },
      (successMessage) {
        _successMessage = successMessage.message;
        _isLoading = false;
        _showSnakebarf(_successMessage, _context);
        notifyListeners();
      },
    );
  }
}

void _showSnakebarf(String? message, BuildContext context) {
  print('111111111111122222222222 : ${message}');
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.green,
      content: Text(message!),
      duration: Duration(seconds: 2),
    ),
  );
  // Scaffold.of(context).removeCurrentSnackBar();
}
