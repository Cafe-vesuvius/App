import 'package:dartz/dartz.dart';
import '../../../../../../core/errors/failure.dart';
import '../../../../../../core/params/params.dart';
import '../entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> loginUser({
    required LoginUserParams loginUserParams,
  });
  Future<Either<Failure, UserEntity>> logoutUser();
}