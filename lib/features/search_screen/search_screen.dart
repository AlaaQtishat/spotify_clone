import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/core/constants/app_colors.dart';
import 'package:spotify_clone/core/data/app_data.dart';
import 'package:spotify_clone/core/widgets/section_title.dart';
import 'package:spotify_clone/features/library_screen/widgets/songs_listTile.dart';
import 'package:spotify_clone/features/music_player_screen/music_player_screen.dart';
import 'package:spotify_clone/features/search_screen/widgets/custom_category_grid.dart';
import 'package:spotify_clone/features/search_screen/widgets/search_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<Map<String, dynamic>> allSongs = [
    ...AppData.madeForYouData,
    ...AppData.trendingNowData,
    ...AppData.topPicksData,
    ...AppData.libraryData,
  ];

  List<Map<String, dynamic>> displayedSongs = [];
  final TextEditingController searchController = TextEditingController();

  void startSearch(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];

    for (var song in allSongs) {
      final songTitle = song["title"].toLowerCase();
      final artistName = song["artist"].toLowerCase();
      final searchInput = enteredKeyword.toLowerCase();

      if (songTitle.contains(searchInput) || artistName.contains(searchInput)) {
        results.add(song);
      }
    }

    setState(() {
      displayedSongs = results;
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isSearching = searchController.text.isNotEmpty;

    return SafeArea(
      bottom: false,
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 48.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Search",
                  style: TextStyle(
                    fontFamily: "Gotham",
                    color: Colors.white,
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -1.92.sp,
                  ),
                ),
                SizedBox(height: 24.h),

                SearchField(
                  controller: searchController,
                  onChanged: startSearch,
                ),

                SizedBox(height: 24.h),

                if (!isSearching) ...[
                  SectionTitle(title: "Your top genres"),
                  SizedBox(height: 24.h),
                  CustomCategoryGrid(
                    categories: [
                      {"title": "Pop", "color": AppColors.cardPurple},
                      {"title": "Bollywood", "color": AppColors.cardDarkRed},
                    ],
                  ),
                  SizedBox(height: 32.h),
                  SectionTitle(title: "Browse all"),
                  SizedBox(height: 24.h),
                  CustomCategoryGrid(
                    categories: [
                      {"title": "Podcasts", "color": AppColors.cardOrange},
                      {"title": "New\nReleases", "color": AppColors.cardPink},
                      {"title": "Charts", "color": AppColors.cardPurple},
                      {"title": "Concerts", "color": AppColors.cardDarkBlue},
                      {
                        "title": "Made for\nyou",
                        "color": AppColors.cardDarkBlue,
                      },
                      {"title": "At home", "color": AppColors.cardTeal},
                      {"title": "At work", "color": AppColors.cardDarkRed},
                      {"title": "At car", "color": AppColors.cardGreen},
                    ],
                  ),
                ] else ...[
                  displayedSongs.isEmpty
                      ? Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 50.h),
                            child: Text(
                              "No results found for '${searchController.text}'",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: displayedSongs.length,
                          itemBuilder: (context, index) {
                            final song = displayedSongs[index];

                            return Padding(
                              padding: EdgeInsets.only(bottom: 16.h),
                              child: SongsListTile(
                                songTitle: song["title"],
                                artistName: song["artist"],
                                imagePath: song["image"],
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MusicPlayerScreen(
                                        playlist: displayedSongs,
                                        initialIndex: index,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                ],

                SizedBox(height: 70.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
