import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:spotify_clone/auth/createuserreq.dart';
import 'package:spotify_clone/auth/signin_user_req.dart';

abstract class Authrepository {
  Future<Either> Signup(Createuserreq userreq);
  Future<Either> Signin(SigninUserReq userreq);
}
