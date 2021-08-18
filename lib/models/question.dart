class Question {
  String id;
  String question;
  int answer = 0;
  bool isSkipped = false;
  bool isAnswered = false;

  Question(this.id, this.question);
}