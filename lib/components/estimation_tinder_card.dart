import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:provider/provider.dart';
import 'package:teamutil/model/estimation_node.dart';
import 'package:teamutil/model/estimation_result.dart';
import 'package:teamutil/pages/estimation_result_page.dart';
import 'package:teamutil/pages/qa_page.dart';
import 'package:teamutil/providers/estimation_provider.dart';

class EstimationTinderCard extends StatelessWidget {
  final EstimationNode estimationNode;

  const EstimationTinderCard({
    required this.estimationNode,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Center(
        child: TinderSwapCard(
          maxWidth: MediaQuery.of(context).size.width * 0.8,
          maxHeight: MediaQuery.of(context).size.width * 0.8,
          minWidth: MediaQuery.of(context).size.width * 0.7,
          minHeight: MediaQuery.of(context).size.width * 0.7,
          swipeUp: true,
          swipeDown: true,
          totalNum: 1,
          cardBuilder: (context, index) {
            return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                elevation: 5,
                child: Center(
                    child: Text(
                  estimationNode.question,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )));
          },
          swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
            if (estimationNode.nextQuestionIndexes.isEmpty) {
              EstimationResult result = EstimationResult();
              result.calculateEffort(context.read<EstimationProvider>().nodes);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EstimationResultPage(
                      estimationResult: result,
                    ),
                  ),
                );
            } else {
              int? answerIndex;
              switch (orientation) {
                case CardSwipeOrientation.LEFT:
                  answerIndex = 0;
                  break;
                case CardSwipeOrientation.RIGHT:
                  answerIndex = 1;
                  break;
                case CardSwipeOrientation.UP:
                  if (estimationNode.choices.length > 2) {
                    answerIndex = 2;
                  }
                  break;
                case CardSwipeOrientation.DOWN:
                  if (estimationNode.choices.length > 3) {
                    answerIndex = 3;
                  }
                  break;
                default:
                  answerIndex = null;
              }
              if (answerIndex != null) {
                context.read<EstimationProvider>().setAnswerIndex(answerIndex);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QaPage(),
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
