import 'package:flutter/material.dart';

class CitySelector extends StatefulWidget {
  final String selectedCity;
  final VoidCallback onTap;

  const CitySelector({
    super.key,
    required this.selectedCity,
    required this.onTap,
  });

  @override
  State<CitySelector> createState() => _CitySelectorState();
}

class _CitySelectorState extends State<CitySelector> {
  Color _iconColor = Colors.black;

  void _onTapDown(TapDownDetails details) {
    setState(() => _iconColor = Colors.white);
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => _iconColor = Colors.black);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: widget.onTap,
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        child: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.business, color: _iconColor, size: 20),
              ),
              const SizedBox(width: 7),
              Text(
                widget.selectedCity,
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
    );
  }
}
