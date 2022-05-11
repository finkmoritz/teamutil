class EstimationNode<T> {
  final EstimationNode parent;
  final String question;
  final List<EstimationNode>? children;
  final T? answer;
  final Function<int>(T answer)? evaluationFunc;

  EstimationNode(
    this.parent,
    this.question, {
    this.children,
    this.answer,
    this.evaluationFunc,
  });
}
