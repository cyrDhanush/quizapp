import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quizapp/models/questionmodel.dart';
import 'package:quizapp/screens/blankpage.dart';

Future<List<QuestionModel>> getQuestions({Map<String, dynamic>? params}) async {
  if (params == null) {
    params = {
      'amount': '10',
      'category': '28',
      'difficulty': 'medium',
      'type': 'multiple'
    };
  }

  final uri = Uri.https('opentdb.com', 'api.php', params); // making uri
  final response = await http.get(uri); //getting response with uri
  print(response.reasonPhrase);
  var decodedjson = jsonDecode(response.body); // response is decoded
  List resultlist = decodedjson['results']; //response to list
  List<QuestionModel> questions = [];
  for (Map<String, dynamic> map in resultlist) {
    questions.add(QuestionModel.fromMap(questionmap: map));
  }
  return questions;
}
