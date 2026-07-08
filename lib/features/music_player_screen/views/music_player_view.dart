import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MusicPlayerView extends StatelessWidget {
  const MusicPlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF5E5A4F), Color(0xFF35322D), Color(0xFF1D1C1A)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
                "PLAYING FROM SEARCH",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                '“stay” in Songs',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
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

        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              Container(
                child: Image.asset(
                  "assets/images/stay.jpg",
                  fit: BoxFit.cover,
                  //   height: 380.h,
                  width: double.infinity,
                ),
              ),
              SizedBox(height: 40.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "STAY (with Justin Bieber)",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "The Kid LAROI, Justin Bieber",
                        style: TextStyle(
                          color: Colors.grey.shade300,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.favorite_outline_outlined,
                        color: Colors.white,
                        size: 32,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              Slider(
                padding: EdgeInsets.zero,
                inactiveColor: Colors.grey.shade600,
                activeColor: Colors.white,
                value: 0.3,
                onChanged: (value) {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "1:23",
                    style: TextStyle(
                      color: Colors.grey.shade300,
                      fontSize: 12.sp,
                    ),
                  ),
                  Text(
                    "3:26",
                    style: TextStyle(
                      color: Colors.grey.shade300,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.shuffle, color: Colors.white, size: 32.sp),
                  Icon(Icons.skip_previous, color: Colors.white, size: 50.sp),
                  Icon(Icons.pause_circle, color: Colors.white, size: 80.sp),
                  Icon(Icons.skip_next, color: Colors.white, size: 50.sp),
                  Icon(Icons.repeat, color: Colors.white, size: 32.sp),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.devices, color: Colors.white, size: 24.sp),
                  Icon(Icons.share_outlined, color: Colors.white, size: 24.sp),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
