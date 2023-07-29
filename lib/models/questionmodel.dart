import 'package:quizapp/models/category_model.dart';

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
    print(this.allanswers);
    print(this.correct_answer);
    print(this.user_answer ?? ' answer not yet selected');
  }
}
