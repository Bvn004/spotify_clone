import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/auth/get_new_songs.dart';
import 'package:spotify_clone/auth/params.dart';
import 'package:spotify_clone/auth/servicelocator.dart';
import 'package:spotify_clone/bloc/news_songs_state.dart';

class NewsongCubit extends Cubit<NewsSongsState> {
  NewsongCubit() : super(NewSongsloading());

  Future<void> getnewsongs() async {
    try {
      emit(NewSongsloading());  // Show loading indicator
      var returnedSongs = await sl<GetNewSongsUsecase>().call(params: NoParams());
      returnedSongs.fold(
        (error) {
          print('Error occurred: $error');
          emit(NewsongsFailure());
        },
        (songs) {
          print('Songs loaded: ${songs.length}');
          if (songs.isEmpty) {
            emit(NewsongsFailure());  // Emit failure state if no songs
          } else {
            emit(NewsongsLoaded(songs: songs));
          }
        },
      );
    } catch (e) {
      print('Exception occurred: $e');
      emit(NewsongsFailure());
    }
  }
}
