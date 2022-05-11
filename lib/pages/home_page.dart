import 'package:flutter/material.dart';
import 'package:teamutil/model/estimation_node.dart';
import 'package:teamutil/pages/qa_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estimation Tinder'),
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QaPage(
                  estimationNode: EstimationNode(
                    'Dumm?',
                    1,
                    children: [
                      EstimationNode('?', 1, answer: 'Nein'),
                      EstimationNode('?', 1, answer: 'Ja'),
                      EstimationNode('?', 1, answer: 'Vielleicht'),
                      EstimationNode('?', 1, answer: 'Wahrscheinlich'),
                    ],
                  ),
                ),
              ),
            );
          },
          icon: Icon(Icons.add),
          label: Text('New Estimation'),
        ),
      ),
    );
  }
}
