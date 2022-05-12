class EstimationNode<T> {
  final String question;
  final List<String> choices;
  final List<int> nextQuestionIndexes;
  dynamic answer;

  EstimationNode(
      {required this.question,
      required this.choices,
      required this.nextQuestionIndexes,
      this.answer});

  factory EstimationNode.q1() {
    return EstimationNode(
      question: 'Which complexity has the implementation?',
      choices: ['low', 'medium', 'high'],
      nextQuestionIndexes: [1, 1, 1],
    );
  }

  factory EstimationNode.q2() {
    return EstimationNode(
      question: 'How many classes you need to change?',
      choices: ['0-5', '5-10', '10-25', 'more than 25'],
      nextQuestionIndexes: [2, 2, 2, 2],
    );
  }

  factory EstimationNode.q3() {
    return EstimationNode(
      question: 'Are new test cases needed?',
      choices: ['yes', 'no'],
      nextQuestionIndexes: [3, 5],
    );
  }

  factory EstimationNode.q4() {
    return EstimationNode(
      question: 'How many test cases are need?',
      choices: ['1-5', '5-10', 'more than 10'],
      nextQuestionIndexes: [4, 4, 4],
    );
  }

  factory EstimationNode.q5() {
    return EstimationNode(
      question: 'Which complexity does the test cases have?',
      choices: ['low', 'medium', 'high'],
      nextQuestionIndexes: [5, 5, 5],
    );
  }

  factory EstimationNode.q6() {
    return EstimationNode(
      question: 'How much Analysis is needed according to the implementation?',
      choices: ['0-10%', '10-20%', '20-30%', 'more than 30%'],
      nextQuestionIndexes: [-1, -1],
    );
  }
}
