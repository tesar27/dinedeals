import 'package:flutter/material.dart';

class CitySheet {
  static void show(
    BuildContext context,
    String currentCity,
    Function(String) onCitySelected,
  ) {
    final cities = [
      'Zurich',
      'Geneva',
      'Basel',
      'Bern',
      'Lausanne',
      'Lucerne',
      'St. Gallen',
      'Lugano',
    ];

    showModalBottomSheet(
      context: context,
      builder: (context) => ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(cities[index]),
          trailing: cities[index] == currentCity
              ? const Icon(Icons.check, color: Colors.blue)
              : null,
          onTap: () {
            onCitySelected(cities[index]);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
