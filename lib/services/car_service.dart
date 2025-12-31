import 'package:flutter/material.dart';
import '../models/car_model.dart';

class CarService {
  static Future<List<Car>> getAvailableCars() async {
    try {
      // Mock data - replace with actual API call if needed
      await Future.delayed(const Duration(seconds: 1));
      
      return [
        Car(
          id: '1',
          name: 'Toyota Camry',
          brand: 'Toyota',
          model: 'Camry 2023',
          imageUrl: 'https://images.unsplash.com/photo-1614200179396-2bdb77ebf81b?w=500',
          pricePerDay: 45.99,
          transmission: 'Automatic',
          fuelType: 'Hybrid',
          seats: 5,
          type: 'Sedan',
          available: true,
          rating: 4.5,
          description: 'Comfortable sedan with great fuel efficiency and modern features.',
          features: ['Bluetooth', 'GPS', 'Backup Camera', 'Leather Seats', 'Sunroof'],
        ),
        Car(
          id: '2',
          name: 'BMW X5',
          brand: 'BMW',
          model: 'X5 2023',
          imageUrl: 'https://images.unsplash.com/photo-1555212697-194d092e3b8f?w=500',
          pricePerDay: 89.99,
          transmission: 'Automatic',
          fuelType: 'Gasoline',
          seats: 7,
          type: 'SUV',
          available: true,
          rating: 4.8,
          description: 'Luxury SUV with premium features and powerful performance.',
          features: ['Panoramic Sunroof', 'Heated Seats', 'Premium Sound', '360 Camera', 'Apple CarPlay'],
        ),
        Car(
          id: '3',
          name: 'Tesla Model 3',
          brand: 'Tesla',
          model: 'Model 3 2023',
          imageUrl: 'https://images.unsplash.com/photo-1560958089-b8a1929cea89?w=500',
          pricePerDay: 79.99,
          transmission: 'Automatic',
          fuelType: 'Electric',
          seats: 5,
          type: 'Sedan',
          available: true,
          rating: 4.9,
          description: 'Fully electric vehicle with autopilot and minimalist design.',
          features: ['Autopilot', 'Glass Roof', 'Premium Audio', 'Wireless Charging', 'Supercharging'],
        ),
        Car(
          id: '4',
          name: 'Honda Civic',
          brand: 'Honda',
          model: 'Civic 2023',
          imageUrl: 'https://images.unsplash.com/photo-1593941707882-a5bba5338fe2?w=500',
          pricePerDay: 35.99,
          transmission: 'Manual',
          fuelType: 'Gasoline',
          seats: 5,
          type: 'Sedan',
          available: true,
          rating: 4.3,
          description: 'Reliable and fuel-efficient compact sedan.',
          features: ['Apple CarPlay', 'Lane Assist', 'Cruise Control', 'Backup Camera'],
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