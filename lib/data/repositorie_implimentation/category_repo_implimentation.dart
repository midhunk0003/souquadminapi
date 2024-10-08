import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:vendorsouqjumla/data/core/failures.dart';
import 'package:vendorsouqjumla/data/model/categorymodel/categorymodel.dart';
import 'package:vendorsouqjumla/domain/repositories/category_repositories.dart';

@LazySingleton(as: CategoryRepositories)
class CategoryRepoImplimentation implements CategoryRepositories {
  @override
  Future<Either<Failure, List<Allcategory>>> getCategoryData(
    String? loginToken,
  ) async {
    final client = http.Client();
    try {
      final response = await client.get(
        Uri.parse(
            'https://souq-jumla.noviindusdemosites.in/store/allcategorylist'),
        headers: {
          'Authorization': 'Bearer $loginToken',
        },
      );
      print('response in repo impliment  : ${response.body}');

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)['allcategory'];
        final responData =
            data.map((items) => Allcategory.fromJson(items)).toList();
        return Right(responData);
      } else {
        return Left(ServerFailures('server failure ${response.statusCode}'));
      }
    } on SocketException {
      return Left(
        NetworkFailure('no internet connection'),
      );
    } catch (e) {
      return Left(
        ServerFailures('serve failure ${e.toString()}'),
      );
    } finally {
      client.close();
    }
  }
}
