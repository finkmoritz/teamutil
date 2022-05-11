class EstimationNode<T> {
  final List<EstimationNode>? children;
  final T? value;
  final Function<int>(T choice)? evaluationFunc;

  EstimationNode({
    this.children,
    this.value,
    this.evaluationFunc,
  });
}
