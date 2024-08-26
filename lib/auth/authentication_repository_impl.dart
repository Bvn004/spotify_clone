import 'package:dartz/dartz.dart';
import 'package:spotify_clone/auth/authentication.dart';
import 'package:spotify_clone/auth/authentication_firebase_service.dart';
import 'package:spotify_clone/auth/createuserreq.dart';
import 'package:spotify_clone/auth/signin_user_req.dart';
import 'servicelocator.dart';

class AuthenticationRepositoryImpl extends Authrepository {
  @override
  Future<Either> Signin(SigninUserReq userreq) async {
    return await sl<AuthFirebaseService>().Signin(userreq);
  }

  @override
  Future<Either> Signup(Createuserreq userreq) async {
    return await sl<AuthFirebaseService>().Signup(userreq);
  }
}
