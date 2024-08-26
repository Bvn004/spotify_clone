import 'package:dartz/dartz.dart';
import 'package:spotify_clone/auth/authentication.dart';
import 'package:spotify_clone/auth/createuserreq.dart';
import 'package:spotify_clone/auth/servicelocator.dart';
import 'package:spotify_clone/auth/usecase/usecase.dart';

class Signupusecase implements Usecase<Either, Createuserreq> {
  @override
  Future<Either> call({Createuserreq? params}) {
    return sl<Authrepository>().Signup(params!);
  }
}
