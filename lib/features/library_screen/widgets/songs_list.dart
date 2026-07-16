// import 'package:flutter/material.dart';
// import 'package:spotify_clone/features/library_screen/views/widgets/songs_listTile.dart';
//
// final List<Map<String, String>> _songsList = [
//   {
//     "title": "Alone",
//     "artist": "Alan Walker",
//     "image": "assets/images/alone.jpg",
//   },
//   {
//     "title": "Let me love you",
//     "artist": "Justin Bieber feat DJ Snake",
//     "image": "assets/images/letmeloveyou.jpg",
//   },
//   {
//     "title": "Ignite",
//     "artist": "Alan Walker",
//     "image": "assets/images/ignite.png",
//   },
//   {
//     "title": "Taki Taki",
//     "artist": "DJ Snake feat Selena Gomez",
//     "image": "assets/images/taki.jpg",
//   },
//   {
//     "title": "Believer",
//     "artist": "Imagine Dragons",
//     "image": "assets/images/believer.jpg",
//   },
//   {
//     "title": "Perfect",
//     "artist": "Ed Sheeran",
//     "image": "assets/images/perfect.png",
//   },
// ];
//
// class SongsList extends StatelessWidget {
//   const SongsList({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       padding: EdgeInsets.zero,
//       itemCount: _songsList.length,
//
//       itemBuilder: (context, index) {
//         var song = _songsList[index];
//         return SongsListTile(
//           songTitle: song["title"]!,
//           artistName: song["artist"]!,
//           imagePath: song["image"]!,
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:spotify_clone/core/data/app_data.dart';
import 'package:spotify_clone/features/library_screen/widgets/songs_listTile.dart';
import 'package:spotify_clone/features/music_player_screen/music_player_screen.dart';

class SongsList extends StatelessWidget {
  const SongsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,

      itemCount: AppData.libraryData.length,

      itemBuilder: (context, index) {
        var song = AppData.libraryData[index];

        return SongsListTile(
          songTitle: song["title"],
          artistName: song["artist"],
          imagePath: song["image"],

          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MusicPlayerScreen(
                  playlist: AppData.libraryData,
                  initialIndex: index,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
