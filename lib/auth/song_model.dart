import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify_clone/Song/song_entity.dart';

class SongModel {
  String? Artist;
  num? duration;
  Timestamp? Releasedate;
  String? title;

  SongModel(
      {required this.Artist,
      required this.duration,
      required this.Releasedate,
      required this.title});

  SongModel.fromJson(Map<String, dynamic> data) {
    Artist = data['Artist'];
    duration = data['duration'];

    Releasedate = data['Releasedate'];
    title = data['Title'];
  }
}

extension songModelX on SongModel {
  SongEntity toentity() {
    return SongEntity(
        Artist: Artist!,
        duration: duration!,
        Releasedate: Releasedate!,
        title: title!);
  }
}
