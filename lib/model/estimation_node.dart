class EstimationNode<T> {
  final String question;
  int numberOfVisits = 0;
  int maxVisits;
  final EstimationNode? parent;
  late final List<EstimationNode> children;
  final T? answer;
  final Function<int>(EstimationNode currentNode)? evaluationFunc;

  EstimationNode(
    this.question,
    this.maxVisits, {
    this.parent,
    this.children = const [],
    this.answer,
    this.evaluationFunc,
  });
}
