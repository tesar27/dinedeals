import 'package:dinedeals/services/location_service.dart';
import 'package:dinedeals/widgets/discover/location_button.dart';
import 'package:dinedeals/widgets/discover/top_bar.dart';
import 'package:flutter/material.dart';
import '../widgets/discover/map_view.dart';
import '../widgets/discover/list_view.dart';
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

  // Add these methods to your State class:
  bool _isLocating = false;

  Future<void> _handleLocationTap() async {
    setState(() => _isLocating = true);

    final position = await LocationService.getCurrentLocation();

    if (position != null && mounted) {
      // Animate camera to user location
      // mapController.animateCamera(...)
    }

    if (mounted) setState(() => _isLocating = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.01),
                blurRadius: 8,
                spreadRadius: 0,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: TopBar(
              selectedCity: _selectedCity,
              onCityTap: _showCitySheet,
              onSearchTap: _onSearchTap,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          _isMapView ? const MapView() : const ListViewWidget(),
          Positioned(
            top: 20,
            right: 20,
            child: ViewToggle(isMapView: _isMapView, onToggle: _toggleView),
          ),
          if (_isMapView)
            Positioned(
              right: 20,
              bottom: 20,
              child: LocationButton(
                isLoading: _isLocating,
                onPressed: _handleLocationTap,
              ),
            ),
        ],
      ),
    );
  }
}
