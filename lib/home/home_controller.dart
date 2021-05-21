import 'package:dev_quiz/core/app_images.dart';
import 'package:dev_quiz/home/home_state.dart';
import 'package:dev_quiz/shared/models/awnser_model.dart';
import 'package:dev_quiz/shared/models/question_model.dart';
import 'package:dev_quiz/shared/models/quiz_model.dart';
import 'package:dev_quiz/shared/models/user_model.dart';

class HomeController {
  var state = HomeState.empty;

  UserModel? user;
  List<QuizModel>? quizzes;

  void getUser() {
    user = UserModel(
      name: "AndersonDart",
      pthotoUrl:
          "https://cdn.pixabay.com/photo/2018/04/18/18/56/user-3331256__340.png",
    );
  }

  void getQuizzes() {
    quizzes = [
      QuizModel(
          title: "NLW 5 Flutter",
          questions: [
            QuestionModel(
              title: "Está curtindo o Flutter?",
              awnsers: [
                AwnserModel(title: "Estou Curtindo"),
                AwnserModel(title: "Estou Amando", isRight: true),
                AwnserModel(title: "Estou Admirando"),
                AwnserModel(title: "Estou Odiando"),
              ],
            ),
          ],
          imagem: AppImages.blocks,
          level: Level.facil)
    ];
  }
}
