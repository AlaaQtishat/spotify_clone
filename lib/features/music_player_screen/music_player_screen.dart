import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MusicPlayerScreen extends StatefulWidget {
  final List<Map<String, dynamic>> playlist;
  final int initialIndex;

  const MusicPlayerScreen({
    super.key,
    required this.playlist,
    required this.initialIndex,
  });

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  late int currentIndex;

  Duration duration = Duration.zero; //the length of the song
  Duration position = Duration.zero; //where am I as of the length of the song

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });

    audioPlayer.onPlayerComplete.listen((event) {
      nextSong();
    });
  }

  Future<void> toggleFavorite(Map<String, dynamic> currentSong) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final docRef = FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('favorites')
        .doc(currentSong['title']);

    final doc = await docRef.get();

    if (doc.exists) {
      await docRef.delete();
    } else {
      await docRef.set({
        "title": currentSong['title'],
        "artist": currentSong['artist'],
        "image": currentSong['image'],
        "audioPath": currentSong['audioPath'],
        "addedAt": FieldValue.serverTimestamp(),
      });
    }
  }

  void playCurrentSong() async {
    final song = widget.playlist[currentIndex];
    await audioPlayer.play(AssetSource(song['audioPath']));
  }

  void togglePlayPause() async {
    if (isPlaying) {
      await audioPlayer.pause();
    } else {
      if (position == Duration.zero) {
        playCurrentSong();
      } else {
        await audioPlayer.resume();
      }
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void nextSong() {
    if (currentIndex < widget.playlist.length - 1) {
      audioPlayer.stop();
      setState(() {
        currentIndex++;
        isPlaying = true;
        position = Duration.zero;
      });
      playCurrentSong();
    }
  }

  void previousSong() {
    if (currentIndex > 0) {
      audioPlayer.stop();
      setState(() {
        currentIndex--;
        isPlaying = true;
        position = Duration.zero;
      });
      playCurrentSong();
    }
  }

  String formatDuration(Duration duration) {
    int minutes = duration.inMinutes;
    int seconds = duration.inSeconds % 60;

    String minutesText = minutes.toString();
    String secondsText = seconds.toString();
    if (seconds < 10) {
      secondsText = "0$seconds";
    }

    if (minutes < 10) {
      minutesText = "0$minutes";
    }

    return "$minutesText:$secondsText";
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentSong = widget.playlist[currentIndex];

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
                '“${currentSong['title']}” in Songs',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
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
              Image.asset(
                currentSong['image'],
                fit: BoxFit.cover,
                height: 380.h,
                width: double.infinity,
              ),
              SizedBox(height: 40.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currentSong['title'],
                          style: TextStyle(
                            fontFamily: "Gotham",
                            color: Colors.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.5,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          currentSong['artist'],
                          style: TextStyle(
                            fontFamily: "Gotham",
                            color: Colors.grey.shade300,
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                            letterSpacing: -0.8,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),

                  StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .doc(FirebaseAuth.instance.currentUser?.uid)
                        .collection('favorites')
                        .doc(currentSong['title'])
                        .snapshots(),
                    builder: (context, snapshot) {
                      bool isFavorite =
                          snapshot.hasData && snapshot.data!.exists;

                      return IconButton(
                        icon: Icon(
                          isFavorite
                              ? Icons.favorite
                              : Icons.favorite_outline_outlined,
                          color: isFavorite ? Colors.green : Colors.white,
                          size: 32.sp,
                        ),
                        onPressed: () => toggleFavorite(currentSong),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 32.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formatDuration(position),
                    style: TextStyle(
                      color: Colors.grey.shade300,
                      fontSize: 12.sp,
                    ),
                  ),

                  Text(
                    formatDuration(duration),
                    style: TextStyle(
                      color: Colors.grey.shade300,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Slider(
                padding: EdgeInsets.zero,
                inactiveColor: Colors.grey.shade600,
                activeColor: Colors.white,
                value: position.inSeconds.toDouble(),
                min: 0,
                max: duration.inSeconds.toDouble(),
                onChanged: (value) async {
                  final position = Duration(seconds: value.toInt());
                  await audioPlayer.seek(position);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.shuffle, color: Colors.white, size: 32.sp),

                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.skip_previous,
                      color: Colors.white,
                      size: 50.sp,
                    ),
                    onPressed: previousSong,
                  ),

                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      isPlaying ? Icons.pause_circle : Icons.play_circle_fill,
                      color: Colors.white,
                      size: 80.sp,
                    ),
                    onPressed: togglePlayPause,
                  ),

                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.skip_next,
                      color: Colors.white,
                      size: 50.sp,
                    ),
                    onPressed: nextSong,
                  ),

                  IconButton(
                    icon: Icon(Icons.repeat, color: Colors.white, size: 32.sp),
                    onPressed: () {},
                  ),
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
