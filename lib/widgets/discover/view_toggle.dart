import 'package:flutter/material.dart';

class ViewToggle extends StatelessWidget {
  final bool isMapView;
  final VoidCallback onToggle;

  const ViewToggle({
    super.key,
    required this.isMapView,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(isMapView ? Icons.list : Icons.map, size: 20),
            const SizedBox(width: 8),
            Text(
              isMapView ? 'List' : 'Map',
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
