class Question {
  final int id;
  final String question;
  final Map<String, String> options;
  final String correctAnswer;

  Question({
    required this.id,
    required this.question,
    required this.options,
    required this.correctAnswer,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      question: json['question'],
      options: Map<String, String>.from(json['options']),
      correctAnswer: json['correctAnswer'],
    );
  }
}
