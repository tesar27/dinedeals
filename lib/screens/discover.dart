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
  String _selectedCity = 'Zurich'; // Default city
  Color _iconColor = Colors.black; // Icon color state

  void _toggleView() {
    setState(() => _isMapView = !_isMapView);
  }

  void _showCitySheet() {
    final cities = [
      'Zurich',
      'Geneva',
      'Basel',
      'Bern',
      'Lausanne',
      'Lucerne',
      'St. Gallen',
      'Lugano',
    ]; // Mock Swiss cities
    showModalBottomSheet(
      context: context,
      builder: (context) => ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(cities[index]),
          onTap: () {
            setState(() => _selectedCity = cities[index]);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  void _onSearchTap() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Search tapped!')));
  }

  void _onCityTapDown(TapDownDetails details) {
    setState(() => _iconColor = Colors.white);
  }

  void _onCityTapUp(TapUpDetails details) {
    setState(() => _iconColor = Colors.black);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _isMapView ? const MapView() : const ListViewWidget(),
        Positioned(
          top: 50,
          left: 20,
          right: 20,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: _showCitySheet,
                    onTapDown: _onCityTapDown,
                    onTapUp: _onCityTapUp,
                    child: Container(
                      color: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 8,
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color:
                                  Colors.grey[200], // Light grayish background
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.business, // Building icon
                              color: _iconColor,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 7),
                          Text(
                            _selectedCity,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(Icons.keyboard_arrow_down, size: 16),
                        ],
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _onSearchTap,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 120,
          right: 20,
          child: GestureDetector(
            onTap: _toggleView,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
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
