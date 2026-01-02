// widgets/spec_item_card.dart
import 'package:flutter/material.dart';

class SpecItemCard extends StatelessWidget {
  final String title;
  final String value;
  final bool isAvailable;

  const SpecItemCard({
    super.key,
    required this.title,
    required this.value,
    this.isAvailable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            _getCardColor(),
            _getCardColor().withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              _getIcon(),
              color: _getIconColor(),
              size: 20,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title.toUpperCase(),
            style: const TextStyle(
              fontSize: 11,
              color: Colors.white70,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.0,
            ),
          ),
        ],
      ),
    );
  }

  Color _getCardColor() {
    switch (title.toLowerCase()) {
      case 'transmission':
        return Colors.blueAccent;
      case 'fuel type':
        return Colors.teal;
      case 'seats':
        return Colors.deepOrange;
      case 'status':
        return isAvailable ? Colors.green : Colors.red;
      default:
        return Colors.deepPurple;
    }
  }

  Color _getIconColor() => _getCardColor();

  IconData _getIcon() {
    switch (title.toLowerCase()) {
      case 'transmission':
        return Icons.settings;
      case 'fuel type':
        return Icons.local_gas_station;
      case 'seats':
        return Icons.people;
      case 'status':
        return isAvailable ? Icons.check : Icons.close;
      default:
        return Icons.info;
    }
  }
}