import 'package:dartz/dartz.dart';
import 'package:vendorsouqjumla/data/core/failures.dart';
import 'package:vendorsouqjumla/data/model/categorymodel/categorymodel.dart';

abstract class CategoryRepositories {
  Future<Either<Failure, List<Allcategory>>> getCategoryData(
    String? loginToken,
  );
}
