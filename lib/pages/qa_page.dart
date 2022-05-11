import 'package:flutter/material.dart';
import 'package:teamutil/components/estimation_tinder_card.dart';
import 'package:teamutil/model/estimation_node.dart';
import 'package:teamutil/pages/home_page.dart';

class QaPage extends StatelessWidget {
  final EstimationNode estimationNode;

  final List<Alignment> alignments = [
    Alignment.centerLeft,
    Alignment.centerRight,
    Alignment.topCenter,
    Alignment.bottomCenter,
  ];

  QaPage({
    required this.estimationNode,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> answers = List.generate(
      estimationNode.children.length,
      (index) => Positioned.fill(
        child: Align(
          alignment: alignments[index],
          child: Text(estimationNode.children[index].answer),
        ),
      ),
    );
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Estimation Tinder'),
        ),
        body: Center(
          child: Stack(
            children: <Widget>[
                  EstimationTinderCard(
                    estimationNode: estimationNode,
                  ),
                ] +
                answers,
          ),
        ),
      ),
    );
  }
}
