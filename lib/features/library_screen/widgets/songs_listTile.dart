// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class SongsListTile extends StatelessWidget {
//   final String songTitle;
//   final String artistName;
//   final String imagePath;
//   const SongsListTile({
//     super.key,
//     required this.songTitle,
//     required this.artistName,
//     required this.imagePath,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       contentPadding: EdgeInsets.zero,
//       leading: Image.asset(
//         imagePath,
//         width: 60.w,
//         height: 60.w,
//         fit: BoxFit.cover,
//       ),
//
//       title: Text(
//         songTitle,
//         style: TextStyle(
//           fontFamily: "Gotham",
//           color: Colors.white,
//           fontSize: 16.sp,
//           fontWeight: FontWeight.w700,
//         ),
//       ),
//
//       subtitle: Padding(
//         padding: EdgeInsets.only(top: 4.h),
//         child: Row(
//           children: [
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade400,
//                 borderRadius: BorderRadius.circular(2.r),
//               ),
//               child: Text(
//                 "LYRICS",
//                 style: TextStyle(
//                   fontFamily: "Gotham",
//                   color: Colors.black,
//                   fontSize: 9.sp,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//             ),
//             SizedBox(width: 6.w),
//
//             Text(
//               artistName,
//               style: TextStyle(
//                 fontFamily: "Gotham",
//                 fontWeight: FontWeight.w500,
//                 color: Colors.grey.shade400,
//                 fontSize: 13.sp,
//                 letterSpacing: -0.6,
//               ),
//             ),
//           ],
//         ),
//       ),
//
//       trailing: IconButton(
//         icon: const Icon(Icons.more_vert, color: Colors.white),
//         onPressed: () {},
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SongsListTile extends StatelessWidget {
  final String songTitle;
  final String artistName;
  final String imagePath;
  final VoidCallback onTap;

  const SongsListTile({
    super.key,
    required this.songTitle,
    required this.artistName,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: Image.asset(
        imagePath,
        width: 60.w,
        height: 60.w,
        fit: BoxFit.cover,
      ),

      title: Text(
        songTitle,
        style: TextStyle(
          fontFamily: "Gotham",
          color: Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
        ),
      ),

      subtitle: Padding(
        padding: EdgeInsets.only(top: 4.h),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(2.r),
              ),
              child: Text(
                "LYRICS",
                style: TextStyle(
                  fontFamily: "Gotham",
                  color: Colors.black,
                  fontSize: 9.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(width: 6.w),

            Text(
              artistName,
              style: TextStyle(
                fontFamily: "Gotham",
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade400,
                fontSize: 13.sp,
                letterSpacing: -0.6,
              ),
            ),
          ],
        ),
      ),

      trailing: IconButton(
        icon: const Icon(Icons.more_vert, color: Colors.white),
        onPressed: () {},
      ),
    );
  }
}
