import 'package:flutter/material.dart';

class QuizController {
  var indexSelected = 0;
  String title = "";
  bool isRight = false;
  ValueNotifier<bool> isConfirm = ValueNotifier<bool>(false);
  //bool get currentQuestion => isConfirm.value;
  //set currentQuestion(bool value) => isConfirm.value = value;
}
