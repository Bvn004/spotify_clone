import 'package:spotify_clone/Song/song_entity.dart';

abstract class NewsSongsState {}

class NewSongsloading extends NewsSongsState {


  
}

class NewsongsLoaded extends NewsSongsState {
  final List<SongEntity> songs;

  NewsongsLoaded({required this.songs});
}

class NewsongsFailure extends NewsSongsState {



}
