import 'package:dartz/dartz.dart';
import 'package:vendorsouqjumla/data/core/failures.dart';
import 'package:vendorsouqjumla/data/model/dashboardmodel/dashboardmodel.dart';

abstract class DashboardRepositories {
  Future<Either<Failure, Dashboardmodel>> getDashBoardData(
    String? loginToken,
  );
}
