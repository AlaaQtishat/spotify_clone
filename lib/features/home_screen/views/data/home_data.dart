import 'package:spotify_clone/features/album_screen/views/Album_view.dart';
import 'package:spotify_clone/features/music_player_screen/views/music_player_view.dart';

class HomeData {
  static final List<Map<String, dynamic>> madeForYouData = [
    {
      "text": "Ed Sheeran, Katy Perry, Pitbull and more",
      "imgLink": "assets/images/ed_sheeran.jpg",
      "destination": const AlbumView(
        text: "Ed Sheeran, Katy Perry, Pitbull and more",
        imgLink: "assets/images/ed_sheeran.jpg",
      ),
    },
    {
      "text": "Catch the Latest Playlist made just for you and also",
      "imgLink": "assets/images/justin_bieber.jpg",
      "destination": const AlbumView(
        text: "Catch the Latest Playlist made just for you and also",
        imgLink: "assets/images/justin_bieber.jpg",
      ),
    },
    {
      "text": "Late night beats curated just for you.",
      "imgLink": "assets/images/drake.jpg",
      "destination": const AlbumView(
        text: "Late night beats curated just for you.",
        imgLink: "assets/images/drake.jpg",
      ),
    },
  ];

  static final List<Map<String, dynamic>> trendingNowData = [
    {
      "text": "STAY (with Justin Bieber) \nSong . The Kid LAROI, Justin Bieber",
      "imgLink": "assets/images/stay.jpg",
      "destination": const MusicPlayerView(
        imgLink: "assets/images/stay.jpg",
        artistName: "The Kid LAROI, Justin Bieber",
        songTitle: "STAY (with Justin Bieber)",
      ),
    },
    {
      "text": "Believer \nSong . Imagine Dragons",
      "imgLink": "assets/images/believer.jpg",
      "destination": const MusicPlayerView(
        imgLink: "assets/images/believer.jpg",
        artistName: "Imagine Dragons",
        songTitle: "Believer",
      ),
    },
    {
      "text": "CHarley’s in Hawaii \nSong . Katy Perry",
      "imgLink": "assets/images/Harley.jpg",
      "destination": const MusicPlayerView(
        imgLink: "assets/images/Harley.jpg",
        artistName: "Katy Perry",
        songTitle: "CHarley’s in Hawaii",
      ),
    },
    {
      "text": "Cheap Trills \nSong . Sia",
      "imgLink": "assets/images/cheepthrills.jpg",
      "destination": const MusicPlayerView(
        imgLink: "assets/images/cheepthrills.jpg",
        artistName: "Sia",
        songTitle: "Cheap Trills",
      ),
    },
  ];

  static final List<Map<String, dynamic>> topPicksData = [
    {
      "text": "Memories \n Song . Maroon 5",
      "imgLink": "assets/images/maroon.jpg",
      "destination": const MusicPlayerView(
        imgLink: "assets/images/maroon.jpg",
        artistName: "Maroon 5",
        songTitle: "Memories",
      ),
    },
    {
      "text": "Roar \nSong . Katy Perry",
      "imgLink": "assets/images/katyperry.jpg",
      "destination": const MusicPlayerView(
        imgLink: "assets/images/katyperry.jpg",
        artistName: "Katy Perry",
        songTitle: "Roar",
      ),
    },
    {
      "text": "Thunder \nSong . Imagine Dragons",
      "imgLink": "assets/images/imaginedragons.jpg",
      "destination": const MusicPlayerView(
        imgLink: "assets/images/imaginedragons.jpg",
        artistName: "Imagine Dragons",
        songTitle: "Thunder",
      ),
    },
  ];
}
