import 'dart:core';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:lichamduong/src/configs/configs.dart';
import 'package:lichamduong/src/resource/model/quiz.dart';
import 'package:lichamduong/src/utils/app_clients.dart';

class QuizRepository {
  http.Client client = http.Client();
  String _apiUrl = AppEndpoint.QUIZS;

  Future<List<Quiz>> fetchQuizList() async {
    final quizs = <Quiz>[];
    try {
      final response = await AppClients().get(_apiUrl);
      List.from((response.data)).forEach((element) {
        quizs.add(Quiz.fromJson(element));
      });
    } on DioError catch (e) {
      print(e.error);
    }
    return quizs;
  }
}
