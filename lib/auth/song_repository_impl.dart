import 'package:dartz/dartz.dart';
import 'package:spotify_clone/auth/servicelocator.dart';
import 'package:spotify_clone/auth/song_auth/song_firebase_service.dart';
import 'package:spotify_clone/Song/song_entity.dart';
import 'package:spotify_clone/auth/song_repo/song.dart';

class SongRepositoryImpl extends Songrepository {
  @override
  Future<Either<String, List<SongEntity>>> getnewsongs() async {
    return await sl<SongFirebaseservice>().getnewsongs();
  }
}
