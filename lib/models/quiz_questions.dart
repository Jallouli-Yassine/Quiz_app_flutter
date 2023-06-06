class QuizQuestion {
  const QuizQuestion(this.question, this.ansswers);
  final String question;
  final List<String> ansswers;

  List<String> getShiffledAnswers() {
    final shuffledList = List.of(ansswers); //shuffle tbadl fl list ama map le
    shuffledList.shuffle();
    return shuffledList;
  }
}
