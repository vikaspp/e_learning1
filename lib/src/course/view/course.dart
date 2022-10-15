import 'package:e_learning/common/config/app_fonts.dart';
import 'package:e_learning/common/config/app_images.dart';
import 'package:e_learning/common/media_query.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

import '../../../common/config/app_colors.dart';
import '../../../generated/l10n.dart';

class Courses extends StatefulWidget {
  const Courses({Key? key}) : super(key: key);

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Gap(2.h),
          Container(
            height: contextHeight(context) * 0.38,
            width: contextWidth(context) * 0.25,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Gap(2.w),
                    Expanded(
                      child: Image.asset(
                        AppImages.cImage1,
                        fit: BoxFit.fill,
                        width: contextWidth(context) * 0.08,
                        height: contextHeight(context) * 0.08,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        S.of(context).Hindi,
                        style: TextStyle(
                            fontSize: 4.sp,
                            fontFamily: AppFonts.poppinsBoldItalic,
                            color: AppColors.green),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
