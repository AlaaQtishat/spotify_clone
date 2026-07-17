import 'package:spotify_clone/core/models/song_model.dart';

class AppData {
  static final List<SongModel> madeForYouData = [
    SongModel(
      title: "Let Down",
      artist: "Radiohead",
      image: "assets/images/let_down.jpg",
      audioPath: "audio/let_down.mp3",
      text: "Let Down \nSong . Radiohead",
    ),
    SongModel(
      title: "Fire To The Rain",
      artist: "Adele",
      image: "assets/images/fire_to_the_rain.png",
      audioPath: "audio/fire_to_the_rain.mp3",
      text: "Fire To The Rain \nSong . Adele",
    ),
    SongModel(
      title: "Sailor",
      artist: "Gigi Perez",
      image: "assets/images/sailor.png",
      audioPath: "audio/belong_together.mp3",
      text: "Sailor \nSong . Gigi Perez",
    ),
    SongModel(
      title: "TV",
      artist: "Billie Eilish",
      image: "assets/images/tv.png",
      audioPath: "audio/mocking.mp3",
      text: "TV \nSong . Billie Eilish",
    ),
  ];

  static final List<SongModel> trendingNowData = [
    SongModel(
      title: "STAY (with Justin Bieber)",
      artist: "The Kid LAROI, Justin Bieber",
      image: "assets/images/stay.jpg",
      audioPath: "audio/default.mp3",
      text: "STAY (with Justin Bieber) \nSong . The Kid LAROI, Justin Bieber",
    ),
    SongModel(
      title: "Believer",
      artist: "Imagine Dragons",
      image: "assets/images/believer.jpg",
      audioPath: "audio/default.mp3",
      text: "Believer \nSong . Imagine Dragons",
    ),
    SongModel(
      title: "CHarley’s in Hawaii",
      artist: "Katy Perry",
      image: "assets/images/Harley.jpg",
      audioPath: "audio/default.mp3",
      text: "CHarley’s in Hawaii \nSong . Katy Perry",
    ),
    SongModel(
      title: "Cheap Trills",
      artist: "Sia",
      image: "assets/images/cheepthrills.jpg",
      audioPath: "audio/default.mp3",
      text: "Cheap Trills \nSong . Sia",
    ),
  ];

  static final List<SongModel> topPicksData = [
    SongModel(
      title: "Memories",
      artist: "Maroon 5",
      image: "assets/images/maroon.jpg",
      audioPath: "audio/memories.mp3",
      text: "Memories \n Song . Maroon 5",
    ),
    SongModel(
      title: "Roar",
      artist: "Katy Perry",
      image: "assets/images/katyperry.jpg",
      audioPath: "audio/roar.mp3",
      text: "Roar \nSong . Katy Perry",
    ),
    SongModel(
      title: "Thunder",
      artist: "Imagine Dragons",
      image: "assets/images/imaginedragons.jpg",
      audioPath: "audio/thunder.mp3",
      text: "Thunder \nSong . Imagine Dragons",
    ),
  ];

  static final List<SongModel> libraryData = [
    SongModel(
      title: "Alone",
      artist: "Alan Walker",
      image: "assets/images/alone.jpg",
      audioPath: "audio/default.mp3",
    ),
    SongModel(
      title: "Let me love you",
      artist: "Justin Bieber feat DJ Snake",
      image: "assets/images/letmeloveyou.jpg",
      audioPath: "audio/default.mp3",
    ),
    SongModel(
      title: "Ignite",
      artist: "Alan Walker",
      image: "assets/images/ignite.png",
      audioPath: "audio/default.mp3",
    ),
    SongModel(
      title: "Taki Taki",
      artist: "DJ Snake feat Selena Gomez",
      image: "assets/images/taki.jpg",
      audioPath: "audio/default.mp3",
    ),
    SongModel(
      title: "Believer",
      artist: "Imagine Dragons",
      image: "assets/images/believer.jpg",
      audioPath: "audio/default.mp3",
    ),
    SongModel(
      title: "Perfect",
      artist: "Ed Sheeran",
      image: "assets/images/perfect.png",
      audioPath: "audio/default.mp3",
    ),
  ];
}
