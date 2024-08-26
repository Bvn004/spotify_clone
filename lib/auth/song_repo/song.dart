import 'package:dartz/dartz.dart';
import 'package:spotify_clone/Song/song_entity.dart';

abstract class Songrepository {
  Future<Either<String, List<SongEntity>>> getnewsongs();
}
