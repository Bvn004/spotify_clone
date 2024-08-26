import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify_clone/Song/song_entity.dart';
import 'package:spotify_clone/auth/song_model.dart';

abstract class SongFirebaseservice {
  Future<Either<String, List<SongEntity>>> getnewsongs();
}

class SongFirebaseserviceImpl extends SongFirebaseservice {
  @override
  Future<Either<String, List<SongEntity>>> getnewsongs() async {
    try {
      List<SongEntity> songs = [];

      // Fetching data from Firestore
      var data = await FirebaseFirestore.instance
          .collection('songs')
          .orderBy('Releasedate', descending: true)
          .limit(2)
          .get();

      // Log the number of documents found
      print('Number of documents fetched: ${data.docs.length}');

      if (data.docs.isEmpty) {
        print('No songs found');
        return Left('No songs available');
      }

      for (var element in data.docs) {
        print('Document ID: ${element.id}');
        print('Document data: ${element.data()}'); // Log document data

        // Convert Firestore document to SongModel
        var songModel = SongModel.fromJson(element.data());

        // Ensure that the fields are correctly mapped and not null
        if (songModel.Artist != null &&
            songModel.duration != null &&
            songModel.Releasedate != null &&
            songModel.title != null) {
          songs.add(songModel.toentity());
        } else {
          print('Missing fields in document: ${element.id}');
        }
      }

      return Right(songs);
    } catch (e) {
      // Log the error for debugging
      print('Error fetching songs: $e');
      return Left('Failed to load songs. Please try again later.');
    }
  }
}
