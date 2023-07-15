import 'package:flutter/material.dart';
import 'package:quizapp/global.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //loading screen
      backgroundColor: blue1,
      body: Center(
        child: Card(
          color: blue2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          elevation: 10,
          margin: EdgeInsets.all(0),
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: blue2,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 10,
                ),
                CircularProgressIndicator(
                  color: orange,
                  backgroundColor: blue1,
                ),
                Text(
                  "Loading",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
