import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:quizapp/global.dart';
import 'package:quizapp/models/category_model.dart';
import 'package:quizapp/screens/quizscreen.dart';
import 'package:quizapp/widgets/topictile.dart';

class CategorySelectionScreen extends StatefulWidget {
  const CategorySelectionScreen({Key? key}) : super(key: key);

  @override
  State<CategorySelectionScreen> createState() =>
      _CategorySelectionScreenState();
}

class _CategorySelectionScreenState extends State<CategorySelectionScreen> {
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
                  return TopicTile(
                    categoryModel: categorylist[i],
                    currentid: topicid,
                    onTap: (newid) {
                      setState(() {
                        topicid = newid;
                      });
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'quizscreen',
        onPressed: () {
          Map<String, dynamic> params = {
            'type': 'multiple',
          };
          if (difficulty_level != 'any') {
            params.putIfAbsent('difficulty', () => difficulty_level);
          }
          if (topicid != 'any') params.putIfAbsent('category', () => topicid);

          params.putIfAbsent('amount', () => questions.toInt().toString());

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuizScreen(
                params: params,
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
}
