import 'package:flutter/material.dart';
import 'package:task/service/hive_service.dart';

class FactsPage extends StatelessWidget {
  const FactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x00E5E4E2),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("Facts"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              tileColor: Colors.deepPurple,
              title: Text(
                HiveService.factBox!.getAt(index)[0]['text'].toString(),
              ),
            ),
          );
        },
        itemCount: HiveService.factBox!.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          HiveService.factBox!.clear();
        },
      ),
    );
  }
}
