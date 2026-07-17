class SongModel {
  final String title;
  final String artist;
  final String image;
  final String audioPath;
  final String? text;

  SongModel({
    required this.title,
    required this.artist,
    required this.image,
    required this.audioPath,
    this.text,
  });
}
