import 'package:flutter/material.dart';
import 'package:quizapp/api.dart';
import 'package:quizapp/global.dart';
import 'package:quizapp/models/questionmodel.dart';
import 'package:quizapp/screens/resultScreen.dart';

class quizscreen extends StatefulWidget {
  final String topicid;
  final int question;
  final String difficulty;
  const quizscreen(
      {Key? key,
      this.topicid = 'any',
      this.question = 10,
      this.difficulty = 'any'})
      : super(key: key);

  @override
  State<quizscreen> createState() => _quizscreenState();
}

class _quizscreenState extends State<quizscreen> {
  //
  late PageController pageController;
  int currentpage = 0;
  double quizcontaineropacity = 1;
  late int maxpages;
  //
  List<Questionmodel> questionlist = [];

  getdata() async {
    var params = <String, dynamic>{};
    params.putIfAbsent('amount', () => widget.question.toString());
    params.putIfAbsent('type', () => 'multiple');
    if (widget.difficulty != 'any') {
      params.putIfAbsent('difficulty', () => widget.difficulty);
    }
    if (widget.topicid != 'any') {
      params.putIfAbsent('category', () => widget.topicid);
    }
    questionlist = await getquestions(params);
    // questionlist = [
    //   Questionmodel(
    //     "samplecategory",
    //     "This is the question and a big sentence",
    //     "The Correct Answer",
    //     ["Wrong 1", "Wrong 2", "Wrong 3"],
    //     ["Wrong 1", "Wrong 2", "Wrong 3", "The Correct Answer"],
    //   ),
    //   Questionmodel(
    //     "samplecategory",
    //     "This is the question and a big sentence",
    //     "The Correct Answer",
    //     ["Wrong 1", "Wrong 2", "Wrong 3"],
    //     ["asd 1", "The Correct Answer", "Wrong 3", "Wrong 3"],
    //   ),
    //   Questionmodel(
    //     "samplecategory",
    //     "This is the question and a big sentence",
    //     "The Correct Answer",
    //     ["Wrong 1", "Wrong 2", "Wrong 3"],
    //     ["Wroang 1", "The Correct Answer", "Wraaong 2", "Wrasdfong 3"],
    //   ),
    // ];
    setState(() {
      maxpages = questionlist.length;
    });
  }

  printanswers() {
    for (Questionmodel i in questionlist) {
      print(i.user_answer);
    }
  }

  prevpage() async {
    if (currentpage > 0) {
      currentpage--;
      setState(() {
        quizcontaineropacity = 0.5;
      });
      await Future.delayed(Duration(milliseconds: 100));
      pageController.animateToPage(
        currentpage,
        duration: Duration(microseconds: 1),
        curve: Curves.fastLinearToSlowEaseIn,
      );
      setState(() {
        quizcontaineropacity = 1;
      });
    }
  }

  nextpage() async {
    if (currentpage < (maxpages - 1)) {
      currentpage++;
      setState(() {
        quizcontaineropacity = 0.5;
      });
      await Future.delayed(Duration(milliseconds: 100));
      pageController.animateToPage(
        currentpage,
        duration: Duration(microseconds: 1),
        curve: Curves.fastLinearToSlowEaseIn,
      );
      setState(() {
        quizcontaineropacity = 1;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
    getdata();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: "quizscreen",
        child: (questionlist.length == 0)
            ? (Scaffold(
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
              ))
            : (Scaffold(
                backgroundColor: blue1,
                appBar: AppBar(
                  backgroundColor: blue2,
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  leading: Container(
                    padding: EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: ImageIcon(
                        AssetImage('assets/icons/category_selection/' +
                            questionlist[currentpage].categoryobj.iconfile),
                        color: orange,
                        size: 10,
                      ),
                    ),
                  ),
                  title: Text(
                    questionlist[currentpage].categoryobj.title,
                    style: appbartext,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Exit",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
                body: Container(
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          Text(
                            "Quiz: ",
                            style: quizmeta,
                          ),
                          Text(
                            (currentpage + 1).toString() +
                                ' / ' +
                                questionlist.length.toString(),
                            style: quizmeta,
                          ),
                          Spacer(),
                          Text(
                            "03:00",
                            style: quizmeta,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "min",
                            style: quizmeta,
                          ),
                        ],
                      ),
                      // Divider(
                      //   color: lightcolor,
                      //   thickness: 1.5,
                      //   height: 20,
                      // ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 3,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: lightcolor,
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 1000),
                                curve: Curves.fastLinearToSlowEaseIn,
                                height: 3,
                                width: MediaQuery.of(context).size.width *
                                    ((currentpage + 1) / questionlist.length),
                                decoration: BoxDecoration(
                                  color: orange,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: NeverScrollableScrollPhysics(),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 600,
                            child: AnimatedOpacity(
                              duration: Duration(milliseconds: 100),
                              opacity: quizcontaineropacity,
                              child: PageView(
                                controller: pageController,
                                physics: NeverScrollableScrollPhysics(),
                                children: [
                                  // for (Questionmodel i in questionlist)
                                  //   quizlayout(object: i),
                                  for (int i = 0; i < questionlist.length; i++)
                                    quizlayout(
                                      object: questionlist[i],
                                      questionno: i + 1,
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    prevpage();
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.skip_previous_rounded,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                          "Previous",
                                          style: buttontext,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    nextpage();
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Next",
                                          style: buttontext,
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Icon(
                                          Icons.skip_next_rounded,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => resultScreen(
                                    //       questionlist: questionlist,
                                    //     ),
                                    //   ),
                                    // );
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50,
                                    child: Text(
                                      "Submit",
                                      style: buttontext,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )));
  }
}

String sampletext =
    "What part of an automobile engine uses lobes to open and close intake and exhaust valves, and allows an air/fuel mixture into the engine?";

class quizlayout extends StatefulWidget {
  final Questionmodel object;
  final int questionno;
  const quizlayout({Key? key, required this.object, this.questionno = 1})
      : super(key: key);

  @override
  State<quizlayout> createState() => _quizlayoutState();
}

class _quizlayoutState extends State<quizlayout> {
  List optionalphabet = ['A', 'B', 'C', 'D'];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            widget.questionno.toString() + ". " + widget.object.question,
            style: quizquestion,
          ),
          SizedBox(
            height: 25,
          ),
          for (int i = 0; i < widget.object.alloptions.length; i++)
            optionbutton(answer: widget.object.alloptions[i], id: i),
        ],
      ),
    );
  }

  Widget optionbutton({required String answer, required int id}) {
    bool selected = (answer == widget.object.user_answer);
    return GestureDetector(
      onTap: () {
        if (widget.object.user_answer == answer) {
          setState(() {
            widget.object.user_answer = "";
          });
        } else {
          setState(() {
            widget.object.user_answer = answer;
          });
        }
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        width: MediaQuery.of(context).size.width,
        height: 60,
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.symmetric(
          vertical: 7,
          horizontal: 7,
        ),
        decoration: BoxDecoration(
          color: (selected) ? (orange) : (lightcolor),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          children: [
            AnimatedOpacity(
              opacity: (selected) ? (0) : (1),
              duration: Duration(milliseconds: 100),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                elevation: 15,
                margin: EdgeInsets.all(0),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: (selected) ? (0) : (46),
                  width: (selected) ? (0) : (46),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: orange,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Text(
                    optionalphabet[id],
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                child: Text(
                  answer,
                  softWrap: true,
                  style: optiontext.copyWith(
                    color: (selected) ? (Colors.white) : (Colors.black),
                  ),
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: (selected) ? (1) : (0),
              duration: Duration(milliseconds: 100),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                elevation: 15,
                margin: EdgeInsets.all(0),
                child: Container(
                  height: 46,
                  width: 46,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Icon(
                    Icons.check_rounded,
                    color: orange,
                    size: 35,
                    shadows: [
                      BoxShadow(
                        color: Colors.black.withAlpha(120),
                        offset: Offset(-2, 5),
                        spreadRadius: 30,
                        blurRadius: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
