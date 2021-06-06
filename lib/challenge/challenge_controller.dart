//CurrentPage

import 'package:flutter/material.dart';

class ChallengeController {
  final currenPageNotifier = ValueNotifier<int>(1);
  int get currentPage => currenPageNotifier.value;
  set currentPage(int value) => currenPageNotifier.value = value;

  int hits = 0;
}
