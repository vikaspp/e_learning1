import 'package:e_learning/common/config/app_fonts.dart';
import 'package:e_learning/common/media_query.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../generated/l10n.dart';
import '../../main.dart';
import '../../src/lang/language_change_provider.dart';
import '../config/app_colors.dart';
import '../config/app_images.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  void initState() {
    super.initState();
    getLanguage();
  }

  List<DropdownMenuItem<String>> langItem = [];

  String? langValue = '0';

  getLanguage() {
    for (int i = 0; i < languageList.length; i++) {
      langItem.add(
        DropdownMenuItem(
          value: '$i',
          child: Text(languageList[i]),
        ),
      );
    }
  }

  List<String> language = <String>['en', 'hi', 'gu'];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<LanguageChangeProvider>(context, listen: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageChangeProvider>(
      builder: (context, provider, child) {
        return Container(
          height: contextHeight(context) * 0.08,
          width: contextWidth(context),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: AppColors.backgroundColorAppBar,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, -2),
                  blurRadius: 30,
                  color: Colors.black.withOpacity(0.44),
                )
              ]),
          child: Row(
            children: <Widget>[
              Gap(1.w),
              Image.asset(AppImages.icon,
              fit: BoxFit.fill,
               height: contextHeight(context) * 0.065,
               width: contextWidth(context) * 0.04,
              ),
              Gap(1.5.w),
              Text(
                S.of(context).title,
                style: TextStyle(
                    fontSize: 4.sp,
                    fontFamily: AppFonts.poppinsBoldItalic,
                    color: AppColors.white),
              ),
              const Spacer(),
              InkWell(
                child: Text(
                  S.of(context).Home,
                  style: TextStyle(
                      fontSize: 4.sp,
                      fontFamily: AppFonts.poppinsBoldItalic,
                      color: AppColors.white

                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/course');
                  setState(() {

                  });
                },
              ),
              Gap(5.w),
              InkWell(
                child: Text(
                  S.of(context).Course,
                  style: TextStyle(
                      fontSize: 4.sp,
                      fontFamily: AppFonts.poppinsBoldItalic,
                      color: AppColors.white),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/course');
                },
              ),
              Gap(5.w),
              InkWell(
                child: Text(
                  S.of(context).About,
                  style: TextStyle(
                      fontSize: 4.sp,
                      fontFamily: AppFonts.poppinsBoldItalic,
                      color: AppColors.white),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/dashboard');
                },
              ),
              Gap(5.w),
              InkWell(
                child: Text(
                  S.of(context).About,
                  style: TextStyle(
                      fontSize: 4.sp,
                      fontFamily: AppFonts.poppinsBoldItalic,
                      color: AppColors.white),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/course');
                },
              ),
              Gap(5.w),
              InkWell(
                child: Text(
                  S.of(context).Login,
                  style: TextStyle(
                      fontSize: 4.sp,
                      fontFamily: AppFonts.poppinsBoldItalic,
                      color: AppColors.white),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/welcome');
                },
              ),
              Gap(5.w),
              Container(
                height: contextHeight(context) * 0.05,
                width: contextWidth(context) * 0.08,
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Center(
                  child: DropdownButton<String>(
                    dropdownColor: AppColors.primaryColor,
                    underline: const SizedBox.shrink(),
                    onChanged: (String? newValue) {
                      provider.changeLocale(language[int.parse(newValue!)]);
                      if (mounted) {
                        setState(() {
                          langValue = newValue;
                        });
                      }
                    },
                    value: langValue,
                    items: langItem,
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 4.sp,
                        fontFamily: AppFonts.poppinsBoldItalic),
                  ),
                ),
              ),
              Gap(5.w),
            ],
          ),
        );
      },
    );
  }
}
