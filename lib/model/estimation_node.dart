class EstimationNode<T> {
  final String question;
  final EstimationNode? parent;
  final List<EstimationNode>? children;
  final T? answer;
  final Function<int>(T answer)? evaluationFunc;

  EstimationNode(
    this.question, {
    this.parent,
    this.children,
    this.answer,
    this.evaluationFunc,
  });
}
