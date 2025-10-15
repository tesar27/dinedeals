import 'package:dinedeals/widgets/discover/list_view.dart';
import 'package:dinedeals/widgets/discover/map_view.dart';
import 'package:flutter/material.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  bool _isMapView = true; // Toggle between map and list

  void _toggleView() {
    setState(() => _isMapView = !_isMapView);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _isMapView ? const MapView() : const ListViewWidget(),
        Positioned(
          top: 50,
          right: 20,
          child: GestureDetector(
            onTap: _toggleView,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(_isMapView ? Icons.list : Icons.map, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    _isMapView ? 'List' : 'Map',
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
