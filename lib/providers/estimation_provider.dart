import 'package:flutter/foundation.dart';
import 'package:teamutil/model/estimation_node.dart';

class EstimationProvider with ChangeNotifier, DiagnosticableTreeMixin {
  late List<EstimationNode> nodes;
  late int currentNodeIndex;

  EstimationProvider() {
    reset();
  }

  get currentNode => nodes[currentNodeIndex];

  void setAnswerIndex(int answerIndex) {
    currentNode.answer = currentNode.choices[answerIndex];
    if(answerIndex < currentNode.nextQuestionIndexes.length) {
      currentNodeIndex = currentNode.nextQuestionIndexes[answerIndex];
    }
    notifyListeners();
  }

  void reset() {
    nodes = [
      EstimationNode.q1(),
      EstimationNode.q2(),
      EstimationNode.q3(),
      EstimationNode.q4(),
      EstimationNode.q5(),
      EstimationNode.q6(),
    ];
    currentNodeIndex = 0;
    notifyListeners();
  }
}
