import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePageProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  final int _maxQuestions = 10;
  List? questions;
  int _countOfQuestion = 0;

  BuildContext context;

  HomePageProvider({
    required this.context,
  }) {
    _dio.options.baseUrl = 'https://opentdb.com/api.php?';
    print("Hello");
    getQuestionsApi();
  }

  Future<void> getQuestionsApi() async {
    var response = await _dio.get('', queryParameters: {
      'amount': _maxQuestions,
      'type': 'boolean',
      'difficulty': 'easy',
    });

    var dataFromResponse = jsonDecode(response.toString());
    print(dataFromResponse);
    questions = dataFromResponse["results"];
    notifyListeners();
  }

  String getCurrentQuestions() => questions![_countOfQuestion]["question"];
}
