import 'package:flutter/material.dart';

class QuizController {
  var indexSelected = 0;
  final isConfirm = ValueNotifier<bool>(false);
  bool get currentQuestion => isConfirm.value;
  set currentQuestion(bool value) => isConfirm.value = value;
}
