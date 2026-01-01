import 'package:flutter/material.dart';
import 'city_selector.dart';

class TopBar extends StatelessWidget {
  final String selectedCity;
  final VoidCallback onCityTap;
  final VoidCallback onSearchTap;

  const TopBar({
    super.key,
    required this.selectedCity,
    required this.onCityTap,
    required this.onSearchTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CitySelector(selectedCity: selectedCity, onTap: onCityTap),
        IconButton(
          icon: const Icon(Icons.search, color: Colors.black),
          onPressed: onSearchTap,
        ),
      ],
    );
  }
}
