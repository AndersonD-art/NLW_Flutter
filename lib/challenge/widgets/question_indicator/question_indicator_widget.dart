import 'package:flutter/material.dart';

import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/shared/widgets/progress_indicator_widget.dart';

class QuestionIndicator extends StatelessWidget {
  final int currentPage;
  final int length;
  const QuestionIndicator({
    Key? key,
    required this.currentPage,
    required this.length,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Questão $currentPage',
                style: AppTextStyles.body,
              ),
              Text(
                'de $length',
                style: AppTextStyles.body,
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          ProgressIndicatorWidget(value: currentPage / length),
        ],
      ),
    );
  }
}
