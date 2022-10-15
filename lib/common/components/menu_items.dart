import 'package:e_learning/common/config/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppBarMenuItem extends StatelessWidget {
  final String title;
  final Function? press;

  const AppBarMenuItem({Key? key, required this.title,  this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press!(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          title.toUpperCase() ?? '',
          style: TextStyle(
            fontSize: 6.sp,
            fontFamily: AppFonts.poppinsExtraBold
          ),
        ),
      ),
    );
  }
}
