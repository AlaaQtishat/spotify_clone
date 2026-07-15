import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/features/auth/auth_controller.dart';
import 'package:spotify_clone/features/welcome/views/welcome_view.dart';

class RightDrawer extends StatelessWidget {
  RightDrawer({super.key});
  AuthController authController = AuthController();
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Drawer(
      backgroundColor: Colors.grey[900],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 80.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: CircleAvatar(
              maxRadius: 32,
              child: Image.asset("assets/images/spotify_logo.png"),
            ),
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
            child: Text(
              user?.displayName ?? "Spotify user",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Divider(color: Colors.grey),
          SizedBox(height: 16.h),
          ListTile(
            titleAlignment: ListTileTitleAlignment.center,
            title: Text(
              "Favorites",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Icon(Icons.favorite_rounded, color: Colors.white),
          ),
          ListTile(
            titleAlignment: ListTileTitleAlignment.center,
            title: Text(
              "Log out",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Icon(Icons.logout, color: Colors.white),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Colors.grey[900],
                    title: const Text(
                      "Log out",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: const Text(
                      "Are you sure you want to log out?",
                      style: TextStyle(color: Colors.white70),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Cancel",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),

                      TextButton(
                        onPressed: () async {
                          Navigator.of(context).pop();

                          String? error = await authController.logout();

                          if (error == null) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => WelcomeView(),
                              ),
                            );
                          } else {
                            if (context.mounted) {
                              ScaffoldMessenger.of(
                                context,
                              ).showSnackBar(SnackBar(content: Text(error)));
                            }
                          }
                        },
                        child: const Text(
                          "Log out",
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }
}
