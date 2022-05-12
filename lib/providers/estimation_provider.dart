import 'package:flutter/foundation.dart';
import 'package:teamutil/model/estimation_node.dart';

class EstimationProvider with ChangeNotifier, DiagnosticableTreeMixin {
  List<EstimationNode> nodes = [
    EstimationNode.q1(),
    EstimationNode.q2(),
    EstimationNode.q3(),
    EstimationNode.q4(),
    EstimationNode.q5(),
    EstimationNode.q6(),
  ];
  int currentNodeIndex = 0;

  get currentNode => nodes[currentNodeIndex];

  void setAnswerIndex(int answerIndex) {
    currentNode.answer = currentNode.choices[answerIndex];
    currentNodeIndex = currentNode.nextQuestionIndexes[answerIndex];
    notifyListeners();
  }
}
