import 'package:vendorsouqjumla/data/core/failures.dart';
import 'package:vendorsouqjumla/data/core/success.dart';
import 'package:dartz/dartz.dart';
import 'package:vendorsouqjumla/data/model/loginmodel/loginmodel.dart';

abstract class AuthRepositories {
  Future<Either<Failure, Loginmodel>> Login(
    String? userName,
    String? password,
    String? fcmToken,
  );
}
