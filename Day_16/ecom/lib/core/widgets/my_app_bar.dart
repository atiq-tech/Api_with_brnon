import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppBar extends StatelessWidget {
  final String hedertxt;
  final String HeaderName;
  const MyAppBar({required this.hedertxt, required this.HeaderName});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                hedertxt,
                style: TextStyle(fontSize: 14.sp),
              ),
              Text(
                HeaderName,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          CircleAvatar(
            backgroundImage:
                AssetImage("assets/graphics/common/profile-ecom.png"),
          )
        ],
      ),
    );
  }
}
