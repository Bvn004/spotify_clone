import 'package:cloud_firestore/cloud_firestore.dart';

class SongEntity {
  final String Artist;
  final num duration;
  final Timestamp Releasedate;
  final String title;

  SongEntity(
      {required this.Artist,
      required this.duration,
      required this.Releasedate,
      required this.title});
}
 