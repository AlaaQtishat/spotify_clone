import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify_clone/core/widgets/gradient_background.dart';
import 'package:spotify_clone/core/widgets/songs_list.dart';

class AlbumView extends StatelessWidget {
  final String? imgLink;
  final String? text;
  const AlbumView({super.key, this.imgLink, this.text});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      body: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.white,
              size: 32.sp,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Album",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        extendBody: false,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        imgLink!,
                        width: 130.w,
                        height: 130.w,
                        fit: BoxFit.cover,
                      ),

                      SizedBox(width: 16.w),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Album",
                              style: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: 12.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              text!,
                              style: TextStyle(
                                fontFamily: "Gotham",
                                color: Colors.white,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w700,
                                height: 1.2,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 24.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "191,165 likes . 3h 45min",
                        style: GoogleFonts.poppins(
                          color: Colors.grey.shade500,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.favorite_outline_outlined,
                                color: Colors.white,
                                size: 28,
                              ),
                              SizedBox(width: 32.sp),
                              const Icon(
                                Icons.more_vert,
                                color: Colors.white,
                                size: 28,
                              ),
                            ],
                          ),
                          Icon(
                            Icons.play_circle_fill,
                            color: Colors.green,
                            size: 60.sp,
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      SongsList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
