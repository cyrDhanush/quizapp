import 'package:flutter/material.dart';
import 'package:quizapp/global.dart';
import 'package:quizapp/global.dart';
import 'package:quizapp/models/questionmodel.dart';

class resultScreen extends StatefulWidget {
  final List<QuestionModel>? questionlist;
  final String duration;
  const resultScreen({Key? key, this.questionlist, this.duration = '00 : 00'})
      : super(key: key);

  @override
  State<resultScreen> createState() => _resultScreenState();
}

class _resultScreenState extends State<resultScreen> {
  List options = ['A', 'B', 'C', 'D'];
  int correctanswers = 0;
  getBorderColor(
      {required String correctanswer,
      required List wronganswer,
      required String useranswer,
      required String currentanswer}) {
    Color color = blue1.withAlpha(0);

    if (useranswer == currentanswer && wronganswer.contains(useranswer))
      color = Colors.red;

    if (useranswer == correctanswer && currentanswer == correctanswer)
      color = Colors.green;

    if (currentanswer == correctanswer) color = Colors.green;
    return color;
  }

  evaluate() {
    for (QuestionModel q in widget.questionlist!) {
      if (q.user_answer == q.correct_answer) correctanswers += 1;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    evaluate();
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
      body: Column(
        children: [
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Duration',
                    style: quizmeta.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    widget.duration,
                    style: quizmeta.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Correct\nAnswers',
                    style: quizmeta.copyWith(
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    correctanswers.toString(),
                    style: quizmeta.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Total\nQuestions',
                    style: quizmeta.copyWith(
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    widget.questionlist!.length.toString(),
                    style: quizmeta.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              itemCount: widget.questionlist!.length,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(bottom: 100, top: 10),
              itemBuilder: (context, i) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: lightcolor,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              (i + 1).toString() +
                                  '. ' +
                                  widget.questionlist![i].question,
                              style: quizquestion,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      for (int j = 0; j < options.length; j++)
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 2.5,
                            horizontal: 10,
                          ),
                          margin: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color: getBorderColor(
                              correctanswer:
                                  widget.questionlist![i].correct_answer,
                              wronganswer:
                                  widget.questionlist![i].incorrect_answers,
                              useranswer: widget.questionlist![i].user_answer!,
                              currentanswer:
                                  widget.questionlist![i].allanswers![j],
                            ).withAlpha(20),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: getBorderColor(
                                correctanswer:
                                    widget.questionlist![i].correct_answer,
                                wronganswer:
                                    widget.questionlist![i].incorrect_answers,
                                useranswer:
                                    widget.questionlist![i].user_answer!,
                                currentanswer:
                                    widget.questionlist![i].allanswers![j],
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                options[j] + '. ',
                                style: quizmeta,
                              ),
                              Expanded(
                                child: Text(
                                  widget.questionlist![i].allanswers![j],
                                  style: quizmeta,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
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
