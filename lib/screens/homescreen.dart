import 'package:flutter/material.dart';
import 'package:quizapp/api.dart';
import 'package:quizapp/models/questionmodel.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  late PageController pageController;
  int currentpage = 0;
  late int maxpages;
  List<Questionmodel> questionlist = [];
  getdata() async {
    questionlist = await getqustions();
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
      pageController.animateToPage(
        currentpage,
        duration: Duration(seconds: 1),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    }
  }

  nextpage() {
    if (currentpage < maxpages) {
      currentpage++;
      pageController.animateToPage(
        currentpage,
        duration: Duration(seconds: 1),
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                children: [
                  for (Questionmodel i in questionlist) quizlayout(object: i),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    prevpage();
                  },
                  child: Icon(Icons.chevron_left_rounded),
                ),
                ElevatedButton(
                  onPressed: () {
                    nextpage();
                  },
                  child: Icon(Icons.chevron_right_rounded),
                ),
                ElevatedButton(
                  onPressed: () {
                    printanswers();
                  },
                  child: Icon(Icons.print),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class quizlayout extends StatefulWidget {
  final Questionmodel object;
  const quizlayout({Key? key, required this.object}) : super(key: key);

  @override
  State<quizlayout> createState() => _quizlayoutState();
}

class _quizlayoutState extends State<quizlayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.object.question,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          for (String i in widget.object.alloptions)
            ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.object.user_answer = i;
                });
              },
              child: Text(i),
            ),
          Text(widget.object.user_answer),
          // ElevatedButton(
          //   onPressed: () {},
          //   child: Text(widget.object.alloptions[0]),
          // ),
          // ElevatedButton(
          //   onPressed: () {},
          //   child: Text(widget.object.alloptions[1]),
          // ),
          // ElevatedButton(
          //   onPressed: () {},
          //   child: Text(widget.object.alloptions[2]),
          // ),
          // ElevatedButton(
          //   onPressed: () {},
          //   child: Text(widget.object.alloptions[3]),
          // ),
        ],
      ),
    );
  }
}
