import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendorsouqjumla/data/core/failures.dart';
import 'package:vendorsouqjumla/data/core/success.dart';
import 'package:vendorsouqjumla/data/model/loginmodel/loginmodel.dart';
import 'package:vendorsouqjumla/domain/repositories/auth_repositories.dart';
import 'package:http/http.dart' as http;

@LazySingleton(as: AuthRepositories)
class AuthRepoImpliment implements AuthRepositories {
  @override
  Future<Either<Failure, Loginmodel>> Login(
    String? userName,
    String? password,
    String? fcmToken,
  ) async {
    print('user name : $userName');
    print('password name : $password');
    print('fcm name : $fcmToken');
    final client = http.Client();

    try {
      final response = await client.post(
        Uri.parse('https://souq-jumla.noviindusdemosites.in/store/Login'),
        body: {
          'username': userName,
          'password': password,
          'fcm': fcmToken,
        },
      );

      print('vendor login response in imple : ${response.body}');
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final loginResponse = Loginmodel.fromJson(data);
        if (loginResponse.status == true) {
          await saveToken(loginResponse.token!);
          return Right(loginResponse);
        } else {
          return Left(ClientFailure('${loginResponse.message}'));
        }
      } else {
        return Left(ServerFailures('server failure ${response.statusCode}'));
      }
    } on SocketException {
      return Left(NetworkFailure('Network Failure'));
    } catch (e) {
      return Left(ServerFailures('server failure ${e.toString()}'));
    } finally {
      client.close();
    }
  }

  Future<void> saveToken(String? token) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('auth_token', token!);
  }
}
