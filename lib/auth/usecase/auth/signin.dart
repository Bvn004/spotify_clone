import 'package:dartz/dartz.dart';
import 'package:spotify_clone/auth/authentication.dart';
import 'package:spotify_clone/auth/createuserreq.dart';
import 'package:spotify_clone/auth/servicelocator.dart';
import 'package:spotify_clone/auth/signin_user_req.dart';
import 'package:spotify_clone/auth/usecase/usecase.dart';

class Signinusecase implements Usecase<Either, SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? params}) {
    return sl<Authrepository>().Signin(params!);
  }
}
