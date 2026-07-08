import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomizedCard extends StatelessWidget {
  String text;
  String imgLink;
  CustomizedCard({super.key, required this.text, required this.imgLink});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.w,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imgLink, width: 170.w, height: 170.w, fit: BoxFit.cover),
          SizedBox(height: 12.h),
          Text(
            text,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
