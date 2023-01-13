import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:quizapp/global.dart';
import 'package:quizapp/models/category_model.dart';
import 'package:quizapp/screens/quizscreen.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  double questions = 10;
  String topicid = "any";
  String difficulty_level = 'any';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue1,
      appBar: AppBar(
        backgroundColor: blue2,
        elevation: 0,
        title: Text(
          "Quiz App",
          style: appbartext,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Select No. of Questions: " + (questions.toInt()).toString(),
              style: quizmeta,
            ),
            SizedBox(
              height: 10,
            ),
            Slider(
              thumbColor: orange,
              activeColor: orange,
              inactiveColor: blue2,
              value: questions,
              min: 5,
              max: 25,
              divisions: 4,
              label: (questions.toInt()).toString(),
              onChanged: (a) {
                setState(() {
                  questions = a;
                });
              },
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    "5",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "25",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Select Difficulty Level:",
              style: quizmeta,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                difficultychip("any"),
                SizedBox(
                  width: 10,
                ),
                difficultychip("easy"),
                SizedBox(
                  width: 10,
                ),
                difficultychip("medium"),
                SizedBox(
                  width: 10,
                ),
                difficultychip("hard"),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Select Topic:",
              style: quizmeta,
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: categorylist.length,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(bottom: 90),
                itemBuilder: ((context, i) {
                  return topicButton(categorylist[i]);
                }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'quizscreen',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => quizscreen(
                question: questions.toInt(),
                topicid: topicid,
                difficulty: difficulty_level,
              ),
            ),
          );
        },
        label: Text("Start"),
        icon: Icon(Icons.start),
        extendedPadding: EdgeInsets.symmetric(horizontal: 30),
      ),
    );
  }

  Widget difficultychip(String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          difficulty_level = text;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: Text(
          text[0].toUpperCase() + text.substring(1, text.length),
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        decoration: BoxDecoration(
          color: (difficulty_level == text) ? (orange) : (blue2),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.white.withAlpha(150),
          ),
        ),
      ),
    );
  }

  Widget topicButton(categorymodel object) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: TextButton(
        onPressed: () {
          setState(() {
            topicid = object.id;
          });
        },
        style: TextButton.styleFrom(
          backgroundColor:
              (object.id == topicid) ? (orange.withOpacity(0.9)) : (blue2),
          foregroundColor: orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            children: [
              ImageIcon(
                AssetImage(
                  ("assets/icons/category_selection/" + object.iconfile),
                ),
                color: (object.id == topicid) ? (blue1) : (orange),
                size: 50,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  object.title,
                  style: category_text.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
