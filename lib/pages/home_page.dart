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
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QaPage(
                  estimationNode: EstimationNode(
                    'Which complexity has the implementation?',
                    1,
                    children: [
                      EstimationNode('How many classes you need to change?',
                          1,
                          answer: 'low',
                          children: [
                            EstimationNode("Next question", 1, answer: '5'),
                            EstimationNode("Next question", 1, answer: '10'),
                            EstimationNode("Next question", 1, answer: '15'),
                            EstimationNode("Next question", 1, answer: '20')
                          ]),
                      EstimationNode('How many classes you need to change?',
                          1,
                          answer: 'medium',
                          children: [
                            EstimationNode("Next question", 1, answer: '5'),
                            EstimationNode("Next question", 1, answer: '10'),
                            EstimationNode("Next question", 1, answer: '15'),
                            EstimationNode("Next question", 1, answer: '20')
                          ]),
                      EstimationNode('How many classes you need to change?',
                          1,
                          answer: 'high',
                          children: [
                            EstimationNode("Next question", 1, answer: '5'),
                            EstimationNode("Next question", 1, answer: '10'),
                            EstimationNode("Next question", 1, answer: '15'),
                            EstimationNode("Next question", 1, answer: '20')
                          ])
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
