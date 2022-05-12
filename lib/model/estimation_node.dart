class EstimationNode<T> {
  final String question;
  final List<String> choices;
  final List<int> nextQuestionIndexes;

  EstimationNode({
    required this.question,
    required this.choices,
    required this.nextQuestionIndexes,
  });

  factory EstimationNode.q1() {
    return EstimationNode(
      question: 'Which complexity has the implementation?',
      choices: ['low', 'medium', 'high'],
      nextQuestionIndexes: [1, 1, 1],
    );
  }
}
