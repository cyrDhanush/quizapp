import 'package:quizapp/models/category_model.dart';

// class Questionapimodel {
//   String category = "";
//   String question = "";
//   String correct_answer = "";
//   List otheroptions = [];
//
//   // Questionmodel convertomodel() {
//   //   List<String> templist = [];
//   //
//   //   for (String i in otheroptions) {
//   //     templist.add(i);
//   //   }
//   //   templist.add(correct_answer);
//   //   templist.shuffle();
//   //   List<String> alloptions = templist;
//   //   return Questionmodel(category, findcategoryobject(category), question,
//   //       correct_answer, otheroptions, alloptions);
//   // }
//
//   printer() {
//     print(question);
//     print(correct_answer);
//     print(otheroptions);
//   }
// }

class QuestionModel {
  String? category;
  CategoryModel? categoryobj;
  String question;
  String correct_answer; // correct answer
  List incorrect_answers; // options other than correct answer
  List? allanswers; // options including answer
  String? user_answer; // user opted answer

  QuestionModel({
    this.category,
    this.categoryobj,
    required this.question,
    required this.correct_answer,
    required this.incorrect_answers,
    this.allanswers,
  });

  factory QuestionModel.fromMap({required Map<String, dynamic> questionmap}) {
    List incorrect_answers = [...questionmap['incorrect_answers']];
    List shuffledoptions = incorrect_answers;
    shuffledoptions.add(questionmap['correct_answer']);
    shuffledoptions.shuffle();
    return QuestionModel(
      category: questionmap['category'],
      categoryobj: findCategory(title: questionmap['category']),
      question: questionmap['question'],
      correct_answer: questionmap['correct_answer'],
      incorrect_answers: questionmap['incorrect_answers'],
      allanswers: shuffledoptions,
    );
  }

  printer() {
    print(this.category);
    this.categoryobj!.printer();
  }
}
