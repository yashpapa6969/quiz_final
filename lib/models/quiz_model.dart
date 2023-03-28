
import 'dart:convert';

import 'package:flutter/cupertino.dart';



class quizModel with ChangeNotifier {
  quizModel({
    required this.category,
    required this.difficulty,
    required this.question,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
    required this.anwser,
    required this.explaination,

  });

  String category;
      String difficulty;
  String question;
      String option1;
  String option2;
      String option3;
  String option4;
      String anwser;
  String explaination;

}