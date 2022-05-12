class EstimationResult {
  Complexity? implementationComplexity;
  int? scopeSizeInClasses;
  bool? areNewTestsNeeded;
  int? numberOfTestCasesNeeded;
  Complexity? testCaseComplexity;
  int? analysisEffort;
}

enum Complexity {
  low,
  medium,
  high,
}
