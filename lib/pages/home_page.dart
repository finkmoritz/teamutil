import 'package:flutter/material.dart';
import 'package:teamutil/pages/qa_page.dart';
import 'package:provider/provider.dart';
import 'package:teamutil/providers/estimation_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/logo.png'),
        title: const Text('Estimation Tinder'),
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Text('Create your first estimation...'),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            context.read<EstimationProvider>().reset();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QaPage(),
              ),
            );
          },
          icon: const Icon(Icons.add),
          label: const Text('New Estimation'),
        ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Powered by Team 3',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
