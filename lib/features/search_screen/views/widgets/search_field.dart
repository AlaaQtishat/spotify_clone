import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search, color: Colors.black),
        hintText: "Artists, songs, or podcasts",
        hintStyle: TextStyle(
          fontFamily: "Gotham",
          color: Colors.grey.shade700,
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
        ),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.r),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.10),
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.r),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.10),
            width: 0.5,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.r),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.10),
            width: 0.5,
          ),
        ),
      ),
    );
  }
}
