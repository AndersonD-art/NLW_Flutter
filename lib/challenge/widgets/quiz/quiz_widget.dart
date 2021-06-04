import 'package:dev_quiz/challenge/widgets/awnser/awnser_widget.dart';
import 'package:dev_quiz/challenge/widgets/next_button/next_button-widget.dart';
import 'package:dev_quiz/challenge/widgets/quiz/quiz_controller.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/shared/models/awnser_model.dart';
import 'package:dev_quiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;

  const QuizWidget({
    Key? key,
    required this.question,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;
  AwnserModel awnser(int index) => widget.question.awnsers[index];
  final confirmQuestion = QuizController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            widget.question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          for (var i = 0; i < widget.question.awnsers.length; i++)
            AwnserWidget(
              anwser: awnser(i),
              disabled: indexSelected != -1,
              isSelected: indexSelected == i,
              isConfirm: false,
              onTap: () {
                confirmQuestion.isConfirm.value = true;
                confirmQuestion.title = awnser(i).title;
                confirmQuestion.isRight = awnser(i).isRight;
                indexSelected = i;
                confirmQuestion.indexSelected = indexSelected;
                setState(() {});
              },
            ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: NextButtonWidget.green(
                  label: "Confirmar",
                  onTap: () {
                    confirmQuestion.isConfirm.value = true;
                    setState(() {
                      AwnserWidget(
                        anwser: AwnserModel(
                            title: confirmQuestion.title,
                            isRight: confirmQuestion.isRight),
                        isConfirm: true,
                        disabled: indexSelected != -1,
                        isSelected: true,
                        onTap: () {
                          indexSelected = confirmQuestion.indexSelected;
                        },
                      );
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
