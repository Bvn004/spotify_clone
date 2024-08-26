import 'package:get_it/get_it.dart';
import 'package:spotify_clone/auth/authentication.dart';
import 'package:spotify_clone/auth/authentication_firebase_service.dart';
import 'package:spotify_clone/auth/authentication_repository_impl.dart';
import 'package:spotify_clone/auth/get_new_songs.dart';
import 'package:spotify_clone/auth/song_auth/song_firebase_service.dart';
import 'package:spotify_clone/auth/song_repo/song.dart';
import 'package:spotify_clone/auth/song_repository_impl.dart';
import 'package:spotify_clone/auth/usecase/auth/signin.dart';
import 'package:spotify_clone/auth/usecase/auth/signup.dart';

// Instantiate GetIt
final sl = GetIt.instance;

// Initialize and register dependencies
Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<SongFirebaseservice>(SongFirebaseserviceImpl());
  sl.registerSingleton<Authrepository>(AuthenticationRepositoryImpl());
  sl.registerSingleton<Signupusecase>(Signupusecase());
  sl.registerSingleton<Signinusecase>(Signinusecase());

  // Register SongRepositoryImpl correctly
  sl.registerSingleton<Songrepository>(SongRepositoryImpl());

  // Register the GetNewSongsUsecase
  sl.registerSingleton<GetNewSongsUsecase>(GetNewSongsUsecase());
}
