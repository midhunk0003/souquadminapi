// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/repositorie_implimentation/auth_repo_impliment.dart'
    as _i600;
import '../../data/repositorie_implimentation/category_repo_implimentation.dart'
    as _i869;
import '../../data/repositorie_implimentation/dash_board_repo_implimentation.dart'
    as _i1071;
import '../../data/repositorie_implimentation/defaultcategory_implimenation.dart'
    as _i423;
import '../../presentation/provider/authprovider.dart' as _i515;
import '../../presentation/provider/category_provider.dart' as _i212;
import '../../presentation/provider/dashboardprovider.dart' as _i730;
import '../../presentation/provider/default_category_provider.dart' as _i319;
import '../repositories/auth_repositories.dart' as _i344;
import '../repositories/category_repositories.dart' as _i563;
import '../repositories/dashboard_repositories.dart' as _i134;
import '../repositories/default_category_repositories.dart' as _i891;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i891.DefaultCategoryRepositories>(
        () => _i423.DefaultcategoryImplimenation());
    gh.lazySingleton<_i344.AuthRepositories>(() => _i600.AuthRepoImpliment());
    gh.lazySingleton<_i134.DashboardRepositories>(
        () => _i1071.DashBoardRepoImplimentation());
    gh.lazySingleton<_i563.CategoryRepositories>(
        () => _i869.CategoryRepoImplimentation());
    gh.factory<_i730.Dashboardprovider>(() => _i730.Dashboardprovider(
        dashboardRepositories: gh<_i134.DashboardRepositories>()));
    gh.factory<_i319.DefaultCategoryProvider>(() =>
        _i319.DefaultCategoryProvider(
            defaultCategoryRepositories:
                gh<_i891.DefaultCategoryRepositories>()));
    gh.factory<_i515.Authprovider>(() =>
        _i515.Authprovider(authRepositories: gh<_i344.AuthRepositories>()));
    gh.factory<_i212.CategoryProvider>(() => _i212.CategoryProvider(
        categoryRepositories: gh<_i563.CategoryRepositories>()));
    return this;
  }
}
