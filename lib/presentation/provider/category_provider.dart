import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:vendorsouqjumla/data/model/categorymodel/categorymodel.dart';
import 'package:vendorsouqjumla/domain/repositories/category_repositories.dart';

@injectable
class CategoryProvider extends ChangeNotifier {
  final CategoryRepositories categoryRepositories;

  CategoryProvider({required this.categoryRepositories});

  bool _isLoading = false;
  String? _errorMessage;
  List<Allcategory>? _categoryData;
  List<Allcategory>? get categoryData => _categoryData;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> getCategoryData(String? loginToken) async {
    _isLoading = true;
    notifyListeners();
    final response = await categoryRepositories.getCategoryData(loginToken);

    print('response in provider : $response');
    response.fold(
      (failure) {
        _errorMessage = failure.message;
        _isLoading = false;
        notifyListeners();
      },
      (data) {
        _errorMessage = null;
        _categoryData = data;
        _isLoading = false;
        notifyListeners();
      },
    );
  }
}
