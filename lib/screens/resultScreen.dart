import 'package:flutter/material.dart';
import 'package:quizapp/global.dart';
import 'package:quizapp/models/questionmodel.dart';

class resultScreen extends StatefulWidget {
  // final List<Questionmodel> questionlist;
  const resultScreen({Key? key, }) : super(key: key);
  // const resultScreen({Key? key, required this.questionlist}) : super(key: key);

  @override
  State<resultScreen> createState() => _resultScreenState();
}

class _resultScreenState extends State<resultScreen> {
  late int totalquestions;
  int score = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // totalquestions = widget.questionlist.length;
    // for (Questionmodel i in widget.questionlist) {
    //   if (i.user_answer == i.correct_answer) {
    //     score += 1;
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: blue2,
        elevation: 0,
        title: Text(
          "Result",
          style: appbartext,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          score.toString() + ' / ' + totalquestions.toString(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
      ),
      bottomSheet: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        // color: orange,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Home",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
