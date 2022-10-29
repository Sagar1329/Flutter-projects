import "question.dart";

class QuizzBrain {
  int questionNum = 0;
  final _questions = <Question>[
    Question("Will you succedd in life", true),
    Question("Bollywood is overrated", false),
    Question("Life sucks right?", false),
    Question("you are not happy right?", true),
    Question("Maccha nin badukbeka?", false),
    Question('Some cats are actually allergic to humans', false),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', false),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
  ];
  void nextQuestion() {
    if (questionNum < _questions.length - 1) questionNum++;
  }

  String getQuestionText() => _questions[questionNum].questionText;
  bool getQuestionAnswer() => _questions[questionNum].questionAnswer;
  int getQuestionlenght() => _questions.length;
}
