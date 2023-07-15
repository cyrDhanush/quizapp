import 'package:flutter/material.dart';
import 'package:quizapp/api.dart';

String sampleresponse =
    '{"response_code":0,"results":[{"category":"Vehicles","type":"multiple","difficulty":"medium","question":"What part of an automobile engine uses lobes to open and close intake and exhaust valves, and allows an air\/fuel mixture into the engine?","correct_answer":"Camshaft","incorrect_answers":["Piston","Drive shaft","Crankshaft"]},{"category":"Vehicles","type":"multiple","difficulty":"medium","question":"Which country has the international vehicle registration letter &#039;A&#039;?","correct_answer":"Austria","incorrect_answers":["Afghanistan","Australia","Armenia"]},{"category":"Vehicles","type":"multiple","difficulty":"medium","question":"Which of the following is NOT a Russian car manufacturer?","correct_answer":"BYD","incorrect_answers":["Silant","Dragon","GAZ"]},{"category":"Vehicles","type":"multiple","difficulty":"medium","question":"Which of the following passenger jets is the longest?","correct_answer":"Boeing 747-8","incorrect_answers":["Airbus A350-1000","Airbus A330-200","Boeing 787-10"]},{"category":"Vehicles","type":"multiple","difficulty":"medium","question":"Enzo Ferrari was originally an auto racer for what manufacturer before founding his own car company?","correct_answer":"Alfa Romeo","incorrect_answers":["Auto Union","Mercedes Benz","Bentley"]},{"category":"Vehicles","type":"multiple","difficulty":"medium","question":"Which supercar company is from Sweden?","correct_answer":"Koenigsegg","incorrect_answers":["Bugatti","Lamborghini","McLaren"]},{"category":"Vehicles","type":"multiple","difficulty":"medium","question":"Which car brand does NOT belong to General Motors?","correct_answer":"Ford","incorrect_answers":["Buick","Cadillac","Chevrolet"]},{"category":"Vehicles","type":"multiple","difficulty":"medium","question":"What do the 4 Rings in Audi&#039;s Logo represent?","correct_answer":"Previously independent automobile manufacturers","incorrect_answers":["States in which Audi makes the most sales","Main cities vital to Audi","Countries in which Audi makes the most sales"]},{"category":"Vehicles","type":"multiple","difficulty":"medium","question":"Which one of the following is not made by Ford?","correct_answer":"Camry","incorrect_answers":["Fusion","Model A","F-150"]},{"category":"Vehicles","type":"multiple","difficulty":"medium","question":"Which car manufacturer created the &quot;Aventador&quot;?","correct_answer":"Lamborghini","incorrect_answers":["Ferrari","Pagani","Bugatti"]}]}';
// String sampleresponse =
// """{"response_code":0,"results":[{"category":"Vehicles","type":"multiple","difficulty":"medium","question":"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.What part of an automobile engine uses lobes to open and close intake and exhaust valves, and allows an air\/fuel mixture into the engine?","correct_answer":"Camshaft","incorrect_answers":["Piston","Drive shaft","Crankshaft"]},{"category":"Vehicles","type":"multiple","difficulty":"medium","question":"Which country has the international vehicle registration letter &#039;A&#039;?","correct_answer":"Austria","incorrect_answers":["Afghanistan","Australia","Armenia"]},{"category":"Vehicles","type":"multiple","difficulty":"medium","question":"Which of the following is NOT a Russian car manufacturer?","correct_answer":"BYD","incorrect_answers":["Silant","Dragon","GAZ"]},{"category":"Vehicles","type":"multiple","difficulty":"medium","question":"Which of the following passenger jets is the longest?","correct_answer":"Boeing 747-8","incorrect_answers":["Airbus A350-1000","Airbus A330-200","Boeing 787-10"]},{"category":"Vehicles","type":"multiple","difficulty":"medium","question":"Enzo Ferrari was originally an auto racer for what manufacturer before founding his own car company?","correct_answer":"Alfa Romeo","incorrect_answers":["Auto Union","Mercedes Benz","Bentley"]},{"category":"Vehicles","type":"multiple","difficulty":"medium","question":"Which supercar company is from Sweden?","correct_answer":"Koenigsegg","incorrect_answers":["Bugatti","Lamborghini","McLaren"]},{"category":"Vehicles","type":"multiple","difficulty":"medium","question":"Which car brand does NOT belong to General Motors?","correct_answer":"Ford","incorrect_answers":["Buick","Cadillac","Chevrolet"]},{"category":"Vehicles","type":"multiple","difficulty":"medium","question":"What do the 4 Rings in Audi&#039;s Logo represent?","correct_answer":"Previously independent automobile manufacturers","incorrect_answers":["States in which Audi makes the most sales","Main cities vital to Audi","Countries in which Audi makes the most sales"]},{"category":"Vehicles","type":"multiple","difficulty":"medium","question":"Which one of the following is not made by Ford?","correct_answer":"Camry","incorrect_answers":["Fusion","Model A","F-150"]},{"category":"Vehicles","type":"multiple","difficulty":"medium","question":"Which car manufacturer created the &quot;Aventador&quot;?","correct_answer":"Lamborghini","incorrect_answers":["Ferrari","Pagani","Bugatti"]}]}""";

class Blankpage extends StatelessWidget {
  const Blankpage({super.key});

  onClick() {
    print('hrllo');
    getQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            onClick();
          },
          child: Text('Click me'),
        ),
      ),
    );
  }
}
