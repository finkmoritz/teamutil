import 'package:flutter/material.dart';
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
                builder: (context) => QaPage(),
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
