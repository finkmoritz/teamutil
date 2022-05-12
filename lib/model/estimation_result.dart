import 'package:teamutil/model/estimation_node.dart';

class EstimationResult {
  double analysisEffort = 0;
  double implementationEffort = 0;
  double testEffort = 0;

  get totalEffort => analysisEffort + implementationEffort + testEffort;

  double getHoursFromClassCount(String classCount) {
    switch (classCount) {
      case '0-5':
        return 8;
      case '5-10':
        return 16;
      case '10-25':
        return 40;
      case 'more than 25':
        return 100;
      default:
        return 1;
    }
  }

  double getPercentFromString(String percentString) {
    switch (percentString) {
      case '0-10%':
        return 0.05;
      case '10-20%':
        return 0.15;
      case '20-30%':
        return 0.25;
      case 'more than 30%':
        return 0.35;
      default:
        return 1;
    }
  }

  double getHoursFromTestCaseCount(String testCaseCount) {
    switch (testCaseCount) {
      case '1-5':
        return 5;
      case '5-10':
        return 10;
      case 'more than 10':
        return 16;
      default:
        return 1;
    }
  }

  void calculateEffort(List<EstimationNode> estimationNodeList) {
    implementationEffort =
        getHoursFromClassCount(estimationNodeList[1].answer) *
            getComplexityFromString(estimationNodeList[0].answer)
                .calculationFactor;
    analysisEffort = implementationEffort *
        getPercentFromString(estimationNodeList[5].answer);

    if (estimationNodeList[2].answer == "yes") {
      testEffort = getHoursFromTestCaseCount(estimationNodeList[3].answer) *
          getComplexityFromString(estimationNodeList[4].answer)
              .calculationFactor;
    }
  }
}

enum Complexity {
  low,
  medium,
  high,
}

extension ComplexityExtension on Complexity {
  double get calculationFactor {
    switch (this) {
      case Complexity.low:
        return 1;
      case Complexity.medium:
        return 1.5;
      case Complexity.high:
        return 2;
      default:
        return 1;
    }
  }
}

Complexity getComplexityFromString(String string) {
  return Complexity.values
      .firstWhere((e) => e.toString() == 'Complexity.' + string);
}
