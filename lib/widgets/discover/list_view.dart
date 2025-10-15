import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // Replace with actual data
      itemBuilder: (context, index) => ListTile(
        title: Text('Restaurant ${index + 1}'),
        subtitle: const Text('Address here'),
      ),
    );
  }
}
