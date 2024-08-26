import 'package:dartz/dartz.dart';
import 'package:spotify_clone/auth/params.dart';
import 'package:spotify_clone/auth/servicelocator.dart';
import 'package:spotify_clone/auth/song_repo/song.dart';
import 'package:spotify_clone/auth/song_repository_impl.dart';
import 'package:spotify_clone/auth/usecase/usecase.dart';
import 'package:spotify_clone/Song/song_entity.dart';

class GetNewSongsUsecase implements Usecase<Either<String, List<SongEntity>>, NoParams> {
  @override
  Future<Either<String, List<SongEntity>>> call({NoParams? params}) {
    return sl<Songrepository>().getnewsongs();
  }
}
