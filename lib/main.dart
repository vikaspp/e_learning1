import 'package:e_learning/src/about/view/about.dart';
import 'package:e_learning/src/course/view/course.dart';
import 'package:e_learning/src/footer/view/footer.dart';
import 'package:e_learning/src/home/view/home.dart';
import 'package:e_learning/src/lang/language_change_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'auth/Welcome/welcome_screen.dart';
import 'common/constants.dart';
import 'generated/l10n.dart';

const List<String> languageList = <String>['English', 'हिन्दी', 'ગુજરાતી'];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LanguageChangeProvider>(
      create: (context) => LanguageChangeProvider(),
      child: Builder(
        builder: (context) => Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(
              home: const Home(),
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  primaryColor: kPrimaryColor,
                  scaffoldBackgroundColor: Colors.white,
                  elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: kPrimaryColor,
                      shape: const StadiumBorder(),
                      maximumSize: const Size(double.infinity, 56),
                      minimumSize: const Size(double.infinity, 56),
                    ),
                  ),
                  inputDecorationTheme: const InputDecorationTheme(
                    filled: true,
                    fillColor: kPrimaryLightColor,
                    iconColor: kPrimaryColor,
                    prefixIconColor: kPrimaryColor,
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: defaultPadding, vertical: defaultPadding),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide.none,
                    ),
                  )),
              locale: Provider.of<LanguageChangeProvider>(context, listen: true)
                  .currentLocale,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              initialRoute: '/home',
              routes: {
                '/home': (context) => const Home(),
                '/course': (context) => const Courses(),
                '/footer': (context) => const Footer(),
                '/about': (context) => const About(),
                '/welcome': (context) => const WelcomeScreen(),
              },
            );
          },
        ),
      ),
    );
  }
}
