import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/features/library_screen/views/widgets/songs_listTile.dart';

class LibraryView extends StatelessWidget {
  const LibraryView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 100.h),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.sp),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        offset: const Offset(0, 4),
                        blurRadius: 4,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  width: 233.w,
                  height: 266.h,
                  child: Image.asset(
                    "assets/images/imaginedragons.jpg",
                    width: 233.w,
                    height: 266.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20.sp),
              Text(
                "Tune in to Top Tracks from Imagine Dragons, Alan Walker and many more",
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 16.sp),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/images/spotify_logo.png",
                    width: 24.sp,
                    height: 24.sp,
                  ),
                  SizedBox(width: 8.sp),
                  Text(
                    "Spotify",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Text(
                "191,165 likes . 3h 45min",
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.favorite_outline_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(width: 32.sp),
                      Icon(Icons.more_vert, color: Colors.white),
                    ],
                  ),
                  Icon(
                    Icons.play_circle_fill,
                    color: Colors.green,
                    size: 60.sp,
                  ),
                ],
              ),
              //SizedBox(height: 30.h),
              SongsListtile(
                songTitle: "Alone",
                artistName: "Alan Walker",
                imagePath: "assets/images/alone.jpg",
              ),
              SongsListtile(
                songTitle: "Let me love you",
                artistName: "Justin Bieber feat DJ Snake",
                imagePath: "assets/images/letmeloveyou.jpg",
              ),
              SongsListtile(
                songTitle: "Ignite",
                artistName: "Alan Walker",
                imagePath: "assets/images/ignite.png",
              ),
              SongsListtile(
                songTitle: "Taki Taki",
                artistName: "DJ Snake feat Selena Gomez",
                imagePath: "assets/images/taki.jpg",
              ),
              SongsListtile(
                songTitle: "Believer",
                artistName: "Imagine Dragons",
                imagePath: "assets/images/believer.jpg",
              ),
              SongsListtile(
                songTitle: "Perfect",
                artistName: "Ed Sheeran",
                imagePath: "assets/images/perfect.png",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
