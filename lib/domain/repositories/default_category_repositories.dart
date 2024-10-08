import 'package:dartz/dartz.dart';
import 'package:vendorsouqjumla/data/core/failures.dart';
import 'package:vendorsouqjumla/data/core/success.dart';
import 'package:vendorsouqjumla/data/model/default_category_model/default_category_model.dart';

abstract class DefaultCategoryRepositories {
  Future<Either<Failure, List<DefaultCategory>>> getDefaultCAtegory(
    String? loginToken,
  );
  Future<Either<Failure, Success>> postCategory(
    String? loginToken,
    int? id,
    String? eng_title,
    String? arb_title,
    String? imagefile,
  );

  Future<Either<Failure, Success>> hideCategory(String? loginToken, String? id);

  Future<Either<Failure ,Success>> deleteCategory(String? loginToken , String? id);
  
}
