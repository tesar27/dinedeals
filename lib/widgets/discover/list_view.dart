import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Overall margin around the entire list
      padding: const EdgeInsets.all(12.0),
      child: ListView.builder(
        itemCount: 10, // Replace with actual data
        itemBuilder: (context, index) {
          return Padding(
            // Margin between each item
            padding: const EdgeInsets.only(
              bottom: 1.0,
            ), // 12px bottom margin between items; adjust or use EdgeInsets.all(8) for uniform
            child: ListTile(
              title: Text('Restaurant ${index + 1}'),
              subtitle: const Text('Address here'),
              // Add more styling if needed
            ),
          );
        },
      ),
    );
  }
}
