import 'package:quizapp/models/category_model.dart';

class Questionapimodel {
  String category = "";
  String question = "";
  String correct_answer = "";
  List otheroptions = [];

  Questionmodel convertomodel() {
    List<String> templist = [];

    for (String i in otheroptions) {
      templist.add(i);
    }
    templist.add(correct_answer);
    templist.shuffle();
    List<String> alloptions = templist;
    return Questionmodel(category, findcategoryobject(category), question,
        correct_answer, otheroptions, alloptions);
  }

  printer() {
    print(question);
    print(correct_answer);
    print(otheroptions);
  }
}

class Questionmodel {
  String category;
  CategoryModel categoryobj;
  String question;
  String correct_answer; // correct answer
  List otheroptions; // options other than correct answer
  List<String> alloptions = []; // options including answer
  String user_answer = ""; // user opted answer

  Questionmodel(
    this.category,
    this.categoryobj,
    this.question,
    this.correct_answer,
    this.otheroptions,
    this.alloptions,
  );
  apitoquestion_seperate(Questionapimodel questionapimodel) {
    category = questionapimodel.category;
    question = questionapimodel.question;
    correct_answer = questionapimodel.correct_answer;
    otheroptions = questionapimodel.otheroptions;
    List<String> templist = [];
    otheroptions.map((e) {
      templist.add(e);
    });
    templist.add(correct_answer);
    templist.shuffle();
    otheroptions = templist;
  }

  printer() {
    print(question);
    print(correct_answer);
    print(otheroptions);
    print(alloptions);
  }
}
