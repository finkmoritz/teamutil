import 'package:flutter/material.dart';
import 'package:teamutil/components/estimation_tinder_card.dart';
import 'package:teamutil/model/estimation_node.dart';
import 'package:teamutil/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:teamutil/providers/estimation_provider.dart';

class QaPage extends StatelessWidget {
  final List<Alignment> alignments = [
    Alignment.centerLeft,
    Alignment.centerRight,
    Alignment.topCenter,
    Alignment.bottomCenter,
  ];

  QaPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EstimationNode estimationNode = context.watch<EstimationProvider>().currentNode;

    List<Widget> answers = List.generate(
      estimationNode.choices.length,
      (index) => Positioned.fill(
        child: Align(
          alignment: alignments[index],
          child: Text(estimationNode.choices[index]),
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
          title: const Text('Estimation Tinder'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
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
      ),
    );
  }
}
