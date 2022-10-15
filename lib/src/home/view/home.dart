import 'dart:developer';

import 'package:e_learning/common/config/app_colors.dart';
import 'package:e_learning/common/media_query.dart';
import 'package:e_learning/src/footer/view/footer.dart';
import 'package:e_learning/src/lang/language_change_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../common/components/app_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageChangeProvider>(
      builder: (context, _, child) {
        return Scaffold(
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: const [
                      CustomAppBar(),
                      // Footer(),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
