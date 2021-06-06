import 'package:flutter/material.dart';
import 'package:dev_quiz/challenge/challenge_controller.dart';
import 'package:dev_quiz/challenge/widgets/next_button/next_button-widget.dart';
import 'package:dev_quiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:dev_quiz/challenge/widgets/quiz/quiz_controller.dart';
import 'package:dev_quiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:dev_quiz/result/result_page.dart';
import 'package:dev_quiz/shared/models/question_model.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;

  const ChallengePage({
    Key? key,
    required this.questions,
    required this.title,
  }) : super(key: key);
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final confirmQuestion = QuizController();
  final pageController = PageController();
  @override
  void initState() {
    confirmQuestion.isConfirm.addListener(() {
      setState(() {});
    });
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });

    super.initState();
  }

  void nextPage() {
    if (controller.currentPage < widget.questions.length)
      pageController.nextPage(
        duration: Duration(milliseconds: 100),
        curve: Curves.linear,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(106),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //BackButton(),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close),
              ),
              ValueListenableBuilder<int>(
                valueListenable: controller.currenPageNotifier,
                builder: (context, value, _) => QuestionIndicator(
                  currentPage: value,
                  length: widget.questions.length,
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
            .map(
              (e) => QuizWidget(
                question: e,
                onChance: nextPage,
              ),
            )
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          child: ValueListenableBuilder(
              valueListenable: controller.currenPageNotifier,
              builder: (context, value, _) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (value == widget.questions.length)
                        Expanded(
                          child: NextButtonWidget.green(
                            label: "Finalizar",
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ResultPage(
                                    title: widget.title,
                                    length: widget.questions.length,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      if (value != widget.questions.length)
                        Expanded(
                          child: NextButtonWidget.white(
                            label: "Proximo",
                            onTap: () {
                              nextPage();
                            },
                          ),
                        ),
                      /* SizedBox(
                        width: 7,
                      ),
                      Expanded(
                        child: NextButtonWidget.green(
                          label: "Confirmar",
                          onTap: () {},
                        ),
                      ), */
                    ],
                  )),
        ),
      ),
    );
  }
}
