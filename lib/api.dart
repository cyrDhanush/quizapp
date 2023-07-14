import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quizapp/models/questionmodel.dart';

Future getquestions(params) async {
  // var params = {
  //   'amount': '10',
  //   'category': '28',
  //   'difficulty': 'medium',
  //   'type': 'multiple',
  // };
  final uri = Uri.https('opentdb.com', 'api.php', params); // making uri

  print("start");
  final response = await http.get(
    uri,
    headers: {"Accept": "application/json"},
  ); //getting response with uri

  var decoded = jsonDecode(response.body); // response is decoded

  List resultlist = decoded['results']; //response to list

  List<Questionapimodel> apiobjects = [];

  //converting json into questionapimodel
  for (var i in resultlist) {
    Questionapimodel m = fromjson(i);
    apiobjects.add(m);
  }

  //converting questionapimodel into questionmodel
  List<Questionmodel> questionmodelobj = [];
  for (Questionapimodel items in apiobjects) {
    questionmodelobj.add(items.convertomodel());
  }

  // for (Questionmodel i in questionmodelobj) {
  //   i.printer();
  // }
  return questionmodelobj;
}

fromjson(jsno) {
  Questionapimodel model = Questionapimodel();
  model.category = jsno['category'];
  model.question = jsno['question'];
  model.correct_answer = jsno['correct_answer'];
  model.otheroptions = jsno['incorrect_answers'];
  return model;
}
