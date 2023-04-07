import 'package:dartz/dartz.dart';
import 'package:setup_provider/domain/model/user_model.dart';

abstract class AuthFacade {

  Future<Either<UserModel,String>> login(String email);

  


}