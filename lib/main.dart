import 'package:flutter/material.dart';
import 'package:quizapp/global.dart';
import 'package:quizapp/screens/blankpage.dart';
import 'package:quizapp/screens/homepage.dart';
import 'package:quizapp/screens/quizscreen.dart';
import 'package:flutter/services.dart';
import 'package:quizapp/screens/resultScreen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: orange,
        fontFamily: "productsans",
        scaffoldBackgroundColor: blue1,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 7,
            backgroundColor: orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
            ),
          ),
        ),
      ),
      // home: homePage(),
      // home: resultScreen(),
      home: quizscreen(),
    );
  }
}
