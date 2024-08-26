import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:spotify_clone/auth/createuserreq.dart';
import 'package:get_it/get_it.dart';
import 'package:spotify_clone/auth/signin_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> Signup(Createuserreq userreq);
  Future<Either> Signin(SigninUserReq userreq);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> Signup(Createuserreq userreq) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: userreq.Email, password: userreq.Password);

      // Update the user's display name
      await userCredential.user?.updateDisplayName(userreq.Fullname);

      // Adding user data to Firestore
      FirebaseFirestore.instance.collection('Users').add({
        'name': userreq.Fullname,
        'email': userCredential.user?.email,
      });

      return Right('Signup was successful');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'The email is already in use';
      } else {
        message = 'An unexpected error occurred';
      }

      return Left(message);
    }
  }

  @override
  Future<Either> Signin(SigninUserReq userreq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userreq.Email, password: userreq.Password);
      return Right('Sign In was successful');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'invalid-email') {
        message = 'Please enter a valid email ';
      } else {
        message = 'An unexpected error occurred';
      }

      return Left(message);
    }
  }
}