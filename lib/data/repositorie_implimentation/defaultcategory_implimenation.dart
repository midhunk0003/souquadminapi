import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:vendorsouqjumla/data/core/failures.dart';
import 'package:vendorsouqjumla/data/core/success.dart';
import 'package:vendorsouqjumla/data/model/default_category_model/default_category_model.dart';
import 'package:vendorsouqjumla/domain/repositories/default_category_repositories.dart';

@LazySingleton(as: DefaultCategoryRepositories)
class DefaultcategoryImplimenation implements DefaultCategoryRepositories {
  @override
  Future<Either<Failure, List<DefaultCategory>>> getDefaultCAtegory(
      String? loginToken) async {
    final client = http.Client();

    try {
      final response = await client.get(
        Uri.parse(
            'https://souq-jumla.noviindusdemosites.in/store/mycategorylist'),
        headers: {
          'Authorization': 'Bearer $loginToken',
        },
      );

      print('response repo impl  default category : ${response.body}');

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['category'];
        final defCatList =
            data.map((items) => DefaultCategory.fromJson(items)).toList();
        return Right(defCatList);
      } else {
        return Left(ServerFailures('server Failure ${response.statusCode}'));
      }
    } on SocketException {
      return Left(NetworkFailure('no internet Connection'));
    } catch (e) {
      return Left(ServerFailures('server failure : ${e.toString()}'));
    } finally {
      client.close();
    }
  }

  @override
  Future<Either<Failure, Success>> postCategory(
    String? loginToken,
    int? id,
    String? eng_title,
    String? arb_title,
    String? imagefile,
  ) async {
    print('id imp id : $id');
    print('eng imp id : $eng_title');
    print('arb imp id : $arb_title');
    print('img imp id : $imagefile');
    final client = http.Client();
    File imageFile = File(imagefile!);
    print('img 11111111111111 : ${imageFile.path}');
    if (imageFile.existsSync()) {
      print('File exists');
    } else {
      print('File not found');
    }
    try {
      // final response = await client.post(
      //   Uri.parse(
      //       'https://souq-jumla.noviindusdemosites.in/store/mycategorylist'),
      //   headers: {
      //     'Authorization': 'Bearer $loginToken',
      //   },
      //   body: {
      //     'id': id.toString(),
      //     'eng_title': eng_title,
      //     'arb_title': arb_title,
      //     'imagefile': imagefile,
      //   },
      // );

      var headers = {
        'Authorization': 'Bearer $loginToken',
      };
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              'https://souq-jumla.noviindusdemosites.in/store/mycategorylist'));
      request.fields.addAll(
        {
          'id': id.toString(),
          'eng_title': eng_title.toString(),
          'arb_title': arb_title.toString(),
        },
      );
      print('gggggggggggggggggg');
      // Add the file to the request
      if (imageFile.existsSync()) {
        var multipartFile = await http.MultipartFile.fromPath(
          'imagefile', // The field name expected by the server
          imagefile.toString(),
          filename: basename(
              "/media/category/$imagefile"), // Optional: provide a filename
        );
        print('eeeeeeeeee');
        request.files.add(multipartFile);
      }
      print('fffffffffffff');
      final response = await request.send();
      final responseBody = await http.Response.fromStream(response);
      print(
        '11122222222222222',
      );
      print('post result in repo impliment : $response');
      print('post result in repo impliment : ${responseBody.body}');
      if (response.statusCode == 200) {
        final data = json.decode(responseBody.body);
        if (data['status'] == true) {
          return Right(
            Success(message: 'successfully category added'),
          );
        } else {
          return Left(ServerFailures(data['message']));
        }
      } else {
        return Left(
          ServerFailures(
            'server failure222 ${responseBody.statusCode}',
          ),
        );
      }
    } on SocketException {
      return Left(
        NetworkFailure('no internet connection'),
      );
    } catch (e) {
      log("errror : $e");
      return Left(ServerFailures('server failure333 ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Success>> deleteCategory(
    String? loginToken,
    String? id,
  ) async {
    final client = http.Client();
    try {
      final response = await client.post(
        Uri.parse(
            'https://souq-jumla.noviindusdemosites.in/store/deletecategory'),
        headers: {
          'Authorization': 'Bearer $loginToken',
        },
        body: {
          'id': id,
        },
      );
      print('delete category response : ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == true) {
          return Right(
            Success(message: 'successfully category deleted'),
          );
        } else {
          return Left(ServerFailures(data['message']));
        }
      } else {
        return Left(
          ServerFailures(
            'server failure222 ${response.statusCode}',
          ),
        );
      }
    } catch (e) {
      return Left(ServerFailures('server failure ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Success>> hideCategory(
    String? loginToken,
    String? id,
  ) async {
    final client = http.Client();
    try {
      final response = await client.post(
        Uri.parse(
            'https://souq-jumla.noviindusdemosites.in/store/hidecategory'),
        headers: {
          'Authorization': 'Bearer $loginToken',
        },
        body: {
          'id': id,
        },
      );
      print('delete category response : ${response.body}');
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == true) {
          return Right(
            Success(message: 'successfully category deleted'),
          );
        } else {
          return Left(ServerFailures(data['message']));
        }
      } else {
        return Left(
          ServerFailures(
            'server failure222 ${response.statusCode}',
          ),
        );
      }
    } catch (e) {
      return Left(ServerFailures('server failure ${e.toString()}'));
    }
  }
}
