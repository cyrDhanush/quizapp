import 'package:flutter/material.dart';
import 'package:quizapp/api.dart';
import 'package:quizapp/global.dart';
import 'package:quizapp/models/questionmodel.dart';

class quizscreen extends StatefulWidget {
  const quizscreen({Key? key}) : super(key: key);

  @override
  State<quizscreen> createState() => _quizscreenState();
}

class _quizscreenState extends State<quizscreen> {
  late PageController pageController;
  int currentpage = 0;
  late int maxpages;
  List<Questionmodel> questionlist = [];
  getdata() async {
    questionlist = await getquestions();
    // questionlist = [
    //   Questionmodel(
    //     "samplecategory",
    //     "This is the question and a big sentence",
    //     "The Correct Answer",
    //     ["Wrong 1", "Wrong 2", "Wrong 3"],
    //     ["Wrong 1", "The Correct Answer", "Wrong 2", "Wrong 3"],
    //   ),
    //   Questionmodel(
    //     "samplecategory",
    //     "This is the question and a big sentence",
    //     "The Correct Answer",
    //     ["Wrong 1", "Wrong 2", "Wrong 3"],
    //     ["Wrong 1", "The Correct Answer", "Wrong 2", "Wrong 3"],
    //   ),
    //   Questionmodel(
    //     "samplecategory",
    //     "This is the question and a big sentence",
    //     "The Correct Answer",
    //     ["Wrong 1", "Wrong 2", "Wrong 3"],
    //     ["Wrong 1", "The Correct Answer", "Wrong 2", "Wrong 3"],
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

  prevpage() {
    if (currentpage > 0) {
      currentpage--;
      // pageController.animateToPage(
      //   currentpage,
      //   duration: Duration(seconds: 1),
      //   curve: Curves.fastLinearToSlowEaseIn,
      // );
      pageController.animateToPage(
        currentpage,
        duration: Duration(microseconds: 1),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    }
  }

  nextpage() {
    if (currentpage < (maxpages - 1)) {
      currentpage++;
      // pageController.animateToPage(
      //   currentpage,
      //   duration: Duration(seconds: 1),
      //   curve: Curves.fastLinearToSlowEaseIn,
      // );
      pageController.animateToPage(
        currentpage,
        duration: Duration(microseconds: 1),
        curve: Curves.fastLinearToSlowEaseIn,
      );
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue2,
      appBar: AppBar(
        backgroundColor: blue1,
        elevation: 0,
        title: Text("Science and Technology"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.exit_to_app_rounded),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        "Quiz: ",
                        style: quizmeta,
                      ),
                      Text(
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
                  Divider(
                    color: lightcolor,
                    thickness: 1.5,
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 430,
                    // color: Colors.white.withAlpha(100),
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
                ],
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.skip_previous_rounded,
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
                            mainAxisAlignment: MainAxisAlignment.center,
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
                        onPressed: () {},
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
    );
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                child: Container(
                  height: 46,
                  width: 46,
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
