import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHorizontalList extends StatelessWidget {
  final List<Widget> cards;

  const CustomHorizontalList({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),

        itemCount: cards.length,

        separatorBuilder: (context, index) => SizedBox(width: 16.w),

        itemBuilder: (context, index) => cards[index],
      ),
    );
  }
}
