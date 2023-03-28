import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quiz_final/utils/url.dart';

class HomeRepository {


  Future<String> fetchAndGetAllQuizes() async {
    final url =
        Uri.parse(URL.url+'quiz');
    print(url);
    try {
      final response = await http.get(url);

      print(response.body);

      return response.body;
    } catch (error) {
      throw (error);
    }
  }

  Future<String> createQuiz(
    String category,
    String difficulty,
    String question,
    String option1,
    String option2,
    String option3,
    String option4,
    String anwser,
    String explaination,
  ) async {
    final url = Uri.parse(URL.url+'quiz');
    print(url);
    try {
      final response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            "category": category,
            "difficulty": difficulty,
            "question": question,
            "option1": option1,
            "option2": option2,
            "option3": option3,
            "option4": option4,
            "anwser": anwser,
            "explaination": explaination,
          }));

      print(url);

      return response.body;
    } catch (error) {
      throw (error);
    }
  }
}
