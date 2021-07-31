class Question {
  int id;
  String question;
  int answer = 0;
  bool isSkipped = false;
  bool isAnswered = false;

  Question(this.id, this.question);
}