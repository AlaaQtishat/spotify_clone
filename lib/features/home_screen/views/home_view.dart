import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/features/album_screen/views/Album_view.dart';
import 'package:spotify_clone/features/home_screen/views/widgets/customized_card.dart';
import 'package:spotify_clone/features/home_screen/views/widgets/customized_list_view.dart';
import 'package:spotify_clone/features/music_player_screen/views/music_player_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 100.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    "Made for you",
                    style: TextStyle(
                      fontSize: 24.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications_outlined,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.history_sharp,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.settings_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.h),

            CustomHorizontalList(
              cards: [
                CustomizedCard(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AlbumView(
                          text: "Ed Sheeran, Katy Perry, Pitbull and more",
                          imgLink: "assets/images/ed_sheeran.jpg",
                        ),
                      ),
                    );
                  },
                  text: "Ed Sheeran, Katy Perry, Pitbull and more",
                  imgLink: "assets/images/ed_sheeran.jpg",
                ),
                CustomizedCard(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AlbumView(
                          text:
                              "Catch the Latest Playlist made just for you and also",
                          imgLink: "assets/images/justin_bieber.jpg",
                        ),
                      ),
                    );
                  },
                  text: "Catch the Latest Playlist made just for you and also",
                  imgLink: "assets/images/justin_bieber.jpg",
                ),
                CustomizedCard(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AlbumView(
                          text: "Late night beats curated just for you.",
                          imgLink: "assets/images/drake.jpg",
                        ),
                      ),
                    );
                  },
                  text: "Late night beats curated just for you.",
                  imgLink: "assets/images/drake.jpg",
                ),
              ],
            ),
            SizedBox(height: 30.h),

            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                "Trending Now",
                style: TextStyle(
                  fontSize: 24.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            CustomHorizontalList(
              cards: [
                CustomizedCard(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const MusicPlayerView(
                          imgLink: "assets/images/stay.jpg",
                          artistName: "The Kid LAROI, Justin Bieber",
                          songTitle: "STAY (with Justin Bieber)",
                        ),
                      ),
                    );
                  },
                  text:
                      "STAY (with Justin Bieber) \nSong . The Kid LAROI, Justin Bieber",
                  imgLink: "assets/images/stay.jpg",
                ),
                CustomizedCard(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const MusicPlayerView(
                          imgLink: "assets/images/believer.jpg",
                          artistName: "Imagine Dragons",
                          songTitle: "Believer",
                        ),
                      ),
                    );
                  },
                  text: "Believer \nSong . Imagine Dragons",
                  imgLink: "assets/images/believer.jpg",
                ),
                CustomizedCard(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const MusicPlayerView(
                          imgLink: "assets/images/Harley.jpg",
                          artistName: "Katy Perry",
                          songTitle: "CHarley’s in Hawaii",
                        ),
                      ),
                    );
                  },
                  text: "CHarley’s in Hawaii \nSong . Katy Perry",
                  imgLink: "assets/images/Harley.jpg",
                ),
                CustomizedCard(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const MusicPlayerView(
                          imgLink: "assets/images/cheepthrills.jpg",
                          artistName: "Sia",
                          songTitle: "Cheap Trills",
                        ),
                      ),
                    );
                  },
                  text: "Cheap Trills \nSong . Sia",
                  imgLink: "assets/images/cheepthrills.jpg",
                ),
              ],
            ),
            SizedBox(height: 30.h),

            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                "Top picks for you",
                style: TextStyle(
                  fontSize: 24.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            CustomHorizontalList(
              cards: [
                CustomizedCard(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const MusicPlayerView(
                          imgLink: "assets/images/maroon.jpg",
                          artistName: "Maroon 5",
                          songTitle: "Memories",
                        ),
                      ),
                    );
                  },
                  text: "Memories \n Song . Maroon 5",
                  imgLink: "assets/images/maroon.jpg",
                ),
                CustomizedCard(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const MusicPlayerView(
                          imgLink: "assets/images/katyperry.jpg",
                          artistName: "Katy Perry",
                          songTitle: "Roar",
                        ),
                      ),
                    );
                  },
                  text: "Roar \nSong . Katy Perry",
                  imgLink: "assets/images/katyperry.jpg",
                ),
                CustomizedCard(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const MusicPlayerView(
                          imgLink: "assets/images/imaginedragons.jpg",
                          artistName: "Imagine Dragons",
                          songTitle: "Thunder",
                        ),
                      ),
                    );
                  },
                  text: "Thunder \nSong . Imagine Dragons",
                  imgLink: "assets/images/imaginedragons.jpg",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
