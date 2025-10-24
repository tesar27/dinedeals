import 'package:flutter/material.dart';
import '../widgets/discover/map_view.dart';
import '../widgets/discover/list_view.dart';
import '../widgets/discover/city_selector.dart';
import '../widgets/discover/view_toggle.dart';
import '../widgets/discover/city_sheet.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  bool _isMapView = true;
  String _selectedCity = 'Zurich';

  void _toggleView() {
    setState(() => _isMapView = !_isMapView);
  }

  void _showCitySheet() {
    CitySheet.show(context, _selectedCity, (city) {
      setState(() => _selectedCity = city);
    });
  }

  void _onSearchTap() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Search tapped!')));
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
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CitySelector(
                  selectedCity: _selectedCity,
                  onTap: _showCitySheet,
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
          child: ViewToggle(isMapView: _isMapView, onToggle: _toggleView),
        ),
      ],
    );
  }
}
