import 'dart:convert';
import 'model_quiz.dart';

List<Quiz> parseQuizs(String responseBody){
 final parsed =  json.decode(responseBody).cast <Map <String, dynamic>>();
 return parsed.map<Quiz>((json) => Quiz.fromJson(json)).toList();
}
//home screen에서 api 데이터를 가져오는 작업만 하면 됨
