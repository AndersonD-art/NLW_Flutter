class UserModel {
  final String name;
  final String pthotoUrl;
  final int score;

  UserModel({
    required this.name,
    required this.pthotoUrl,
    this.score = 0,
  });
}
