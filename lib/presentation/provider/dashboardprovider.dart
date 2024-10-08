import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:vendorsouqjumla/data/model/dashboardmodel/dashboardmodel.dart';
import 'package:vendorsouqjumla/domain/repositories/dashboard_repositories.dart';

@injectable
class Dashboardprovider extends ChangeNotifier {
  final DashboardRepositories dashboardRepositories;

  Dashboardprovider({required this.dashboardRepositories});

  bool _isLoading = false;
  String? _errorMessage;
  Dashboardmodel? _dashBoardResponas;

  bool get isLoading => _isLoading;
  String? get errorMesage => _errorMessage;
  Dashboardmodel? get dashBoardResponas => _dashBoardResponas;

  Future<void> getDashBoardData(String? loginToken) async {
    print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final result = await dashboardRepositories.getDashBoardData(loginToken);

    print('dash result in provider : ${result}');
    result.fold(
      (failure) {
        _errorMessage = failure.message;
        _isLoading = false;
        notifyListeners();
      },
      (dashboardData) {
        _dashBoardResponas = dashboardData;
        _isLoading = false;
        notifyListeners();
      },
    );
  }
}
