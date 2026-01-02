import 'package:flutter/material.dart';
import '../models/car_model.dart';

class CarService {
  static Future<List<Car>> getAvailableCars() async {
    try {
      // Mock data - replace with actual API call if needed
      await Future.delayed(const Duration(seconds: 1));

      // In car_service.dart - Update the cars list
      return [
        Car(
          id: '1',
          name: 'Toyota Camry',
          brand: 'Toyota',
          model: 'Camry 2023',
          imageUrl:
              'https://images.unsplash.com/photo-1549399542-7e3f8b79c341?w=500&auto=format&fit=crop',
          pricePerDay: 45.99,
          transmission: 'Automatic',
          fuelType: 'Hybrid',
          seats: 5,
          type: 'Sedan',
          available: true,
          rating: 4.5,
          description:
              'Comfortable sedan with great fuel efficiency and modern features.',
          features: [
            'Bluetooth',
            'GPS',
            'Backup Camera',
            'Leather Seats',
            'Sunroof',
          ],
        ),
        Car(
          id: '2',
          name: 'BMW X5',
          brand: 'BMW',
          model: 'X5 2023',
          imageUrl:
              'https://images.unsplash.com/photo-1553440569-bcc63803a83d?w=500&auto=format&fit=crop',
          pricePerDay: 89.99,
          transmission: 'Automatic',
          fuelType: 'Gasoline',
          seats: 7,
          type: 'SUV',
          available: true,
          rating: 4.8,
          description:
              'Luxury SUV with premium features and powerful performance.',
          features: [
            'Panoramic Sunroof',
            'Heated Seats',
            'Premium Sound',
            '360 Camera',
            'Apple CarPlay',
          ],
        ),
        Car(
          id: '3',
          name: 'Tesla Model 3',
          brand: 'Tesla',
          model: 'Model 3 2023',
          imageUrl:
              'https://images.unsplash.com/photo-1560958089-b8a1929cea89?w=500&auto=format&fit=crop',
          pricePerDay: 79.99,
          transmission: 'Automatic',
          fuelType: 'Electric',
          seats: 5,
          type: 'Sedan',
          available: true,
          rating: 4.9,
          description:
              'Fully electric vehicle with autopilot and minimalist design.',
          features: [
            'Autopilot',
            'Glass Roof',
            'Premium Audio',
            'Wireless Charging',
            'Supercharging',
          ],
        ),
        Car(
          id: '4',
          name: 'Honda Civic',
          brand: 'Honda',
          model: 'Civic 2023',
          imageUrl:
              'https://images.unsplash.com/photo-1599912027806-cfec9f5944b6?w=500&auto=format&fit=crop',
          pricePerDay: 35.99,
          transmission: 'Manual',
          fuelType: 'Gasoline',
          seats: 5,
          type: 'Sedan',
          available: true,
          rating: 4.3,
          description: 'Reliable and fuel-efficient compact sedan.',
          features: [
            'Apple CarPlay',
            'Lane Assist',
            'Cruise Control',
            'Backup Camera',
          ],
        ),
      ];
    } catch (e) {
      debugPrint("Error fetching cars: $e");
      return [];
    }
  }

  static Future<Car?> getCarById(String id) async {
    try {
      final cars = await getAvailableCars();
      return cars.firstWhere((car) => car.id == id);
    } catch (e) {
      debugPrint("Error fetching car by id: $e");
      return null;
    }
  }
}
