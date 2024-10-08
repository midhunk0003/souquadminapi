import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:vendorsouqjumla/data/core/failures.dart';
import 'package:vendorsouqjumla/data/model/dashboardmodel/dashboardmodel.dart';
import 'package:vendorsouqjumla/domain/repositories/dashboard_repositories.dart';

@LazySingleton(as: DashboardRepositories)
class DashBoardRepoImplimentation implements DashboardRepositories {
  @override
  Future<Either<Failure, Dashboardmodel>> getDashBoardData(
    String? loginToken,
  ) async {
    final client = http.Client();

    try {
      final response = await client.get(
        Uri.parse('https://souq-jumla.noviindusdemosites.in/store/dashboard'),
        headers: {
          'Authorization': 'Bearer $loginToken',
        },
      );

      print('response in repo implimentation ${response.body}');
      if (response.statusCode == 200) {
        final dashboardData = json.decode(response.body);
        final dashBoardresp = Dashboardmodel.fromJson(dashboardData);
        return Right(dashBoardresp);
      } else {
        return Left(ServerFailures('server failure ${response.statusCode}'));
      }
    } on SocketException {
      return Left(NetworkFailure('no nnternet connection'));
    } catch (e) {
      return Left(ServerFailures('server failure ${e.toString()}'));
    } finally {
      client.close();
    }
  }
}
