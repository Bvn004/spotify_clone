import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/Song/song_entity.dart';
import 'package:spotify_clone/bloc/news.dart';
import 'package:spotify_clone/bloc/news_songs_state.dart';

class Newsongs extends StatelessWidget {
  const Newsongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsongCubit()..getnewsongs(),
      child: SizedBox(
        height: 200,
        child: BlocBuilder<NewsongCubit, NewsSongsState>(
          builder: (context, state) {
            print('Current state: $state'); // Add logging for state changes

            if (state is NewSongsloading) {
              return Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              );
            }

            if (state is NewsongsLoaded) {
              if (state.songs.isEmpty) {
                return Center(child: Text('No songs available'));
              }
              //return song(state.songs);
            }

            if (state is NewsongsFailure) {
              return Center(
                  child: Text('Failed to load songs. Please try again.'));
            }

            return Container();
          },
        ),
      ),
    );
  }

  Widget song(List<SongEntity> songs) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final song = songs[index];
        return Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display the image
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/keda-d9c75.appspot.com/o/covers%2FThe_Weeknd_-_Starboy.png?alt=media&token=65f6a5de-e871-4f88-a9c1-95d403332298',
                width: 50, // Set desired width
                height: 50, // Set desired height
                fit: BoxFit.cover, // Adjust the image to cover the box
              ),
              SizedBox(height: 8), // Space between image and text
              Text(song.title, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(song.Artist),
              // Add more details as needed
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(width: 14),
      itemCount: songs.length,
    );
  }
}
