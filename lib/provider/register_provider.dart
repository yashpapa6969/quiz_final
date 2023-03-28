import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:quiz_final/models/quiz_model.dart';
import 'package:quiz_final/repo/home_repo.dart';

class RegisterProvider with ChangeNotifier {
  final HomeRepository _homeRepo = HomeRepository();
  HomeRepository get homeRepo => _homeRepo;




  final TextEditingController _questionController = TextEditingController();
  TextEditingController get questionController => _questionController;

  String category = "Select Category";
  String difficulty = "Select Difficulty";
  bool anwser = false;
  final TextEditingController _option1Controller = TextEditingController();
  TextEditingController get option1Controller => _option1Controller;

  final TextEditingController _option2Controller = TextEditingController();
  TextEditingController get option2Controller => _option2Controller;

  final TextEditingController _option3Controller = TextEditingController();
  TextEditingController get option3Controller => _option3Controller;

  final TextEditingController _option4Controller = TextEditingController();
  TextEditingController get option4Controller => _option4Controller;

  final TextEditingController _anwserController = TextEditingController();
  TextEditingController get anwserController => _anwserController;

  final TextEditingController _explainationController = TextEditingController();
  TextEditingController get explainationController => _explainationController;


  bool _isLoading = false;
  bool passwordError = false;

  bool get isLoading => _isLoading;



  void updatecategory(String value) {
    category = value;
    notifyListeners();
  }

  void updatedifficulty(String value) {
    difficulty = value;
    notifyListeners();
  }

  List<quizModel> _quizItems = [];
  List<quizModel> get quizItems {
    return [..._quizItems];
  }

  Future<void> getAllQuizes() async {
    final response = await _homeRepo.fetchAndGetAllQuizes();
    final responseData = json.decode(response);

    _quizItems = List<quizModel>.from(responseData.map((item) => quizModel(
      category: item["category"],
      difficulty: item["difficulty"],
      question: item["question"],
      option1: item["option1"],
      option2: item["option2"],
      option3: item["option3"],
      option4: item["option4"],
      anwser: item["anwser"],
      explaination: item["explaination"],
    )));

    notifyListeners();
  }

  createquiz(BuildContext context) async {
    await _homeRepo
        .createQuiz(
      category,
      difficulty,
      questionController.text,
      option1Controller.text,
      option2Controller.text,
      option3Controller.text,
      option4Controller.text,
      anwserController.text,
      explainationController.text,
    )
        .then((response) async {
      final responseData = json.decode(response);
      print(responseData);
      print(responseData["message"]);
      // await SharedPreferences.getInstance().then((prefs) {
      //           // prefs.setString('_id', _id);
      //           prefs.setString('mobile_token', '');
      //           prefs.setString("mobile_id", '');
      _showDialog("Quiz Question Added", context);
      //           // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainScreen()));
      //         });
    });

    notifyListeners();
  }

  void _showDialog(String message, BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('QuizP!'),
        content: Text(message),
        actions: <Widget>[
          ElevatedButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(const Size.fromHeight(40.0)),
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            ),
            child: const Text('Okay'),
            onPressed: () {
              category = "Select Category";
              difficulty = "Select Difficulty";
              questionController.text = "";
              option1Controller.text = "";
              option2Controller.text = "";
              option3Controller.text = "";
              option4Controller.text = "";
              anwserController.text = "";
              explainationController.text = "";
              notifyListeners();
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }
}
