import 'package:flutter/material.dart';
import 'package:spotify_clone/core/data/app_data.dart';
import 'package:spotify_clone/core/widgets/songs_list_tile.dart';
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
          songTitle: song.title,
          artistName: song.artist,
          imagePath: song.image,

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
