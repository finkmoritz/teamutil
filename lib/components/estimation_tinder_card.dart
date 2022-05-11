import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:teamutil/model/estimation_node.dart';
import 'package:teamutil/pages/qa_page.dart';

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
          cardBuilder: (context, index) => Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              elevation: 5,
              child: Center(
                  child: Text(
                estimationNode.question,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ))),
          swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
            print('Swiped??: ${orientation.name}');
            if (estimationNode.children.isEmpty) {
              // TODO evaluate
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
                  if (estimationNode.children.length > 2) {
                    answerIndex = 2;
                  }
                  break;
                case CardSwipeOrientation.DOWN:
                  if (estimationNode.children.length > 3) {
                    answerIndex = 3;
                  }
                  break;
                default:
                  answerIndex = null;
              }
              if (answerIndex != null) {
                print('answerIndex: $answerIndex');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QaPage(
                      estimationNode: estimationNode.children[answerIndex!],
                    ),
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
