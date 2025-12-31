import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'screens/welcome_screen.dart';
import 'screens/car_list_screen.dart';
import 'screens/car_detail_screen.dart';
import 'screens/booking_form_screen.dart';
import 'screens/booking_confirmation_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'welcome',
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: '/cars',
        name: 'cars',
        builder: (context, state) => const CarListScreen(),
      ),
      GoRoute(
        path: '/car/:id',
        name: 'car-detail',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return CarDetailScreen(carId: id);
        },
      ),
      GoRoute(
        path: '/book/:carId',
        name: 'booking-form',
        builder: (context, state) {
          final carId = state.pathParameters['carId']!;
          return BookingFormScreen(carId: carId);
        },
      ),
      GoRoute(
        path: '/confirmation',
        name: 'confirmation',
        builder: (context, state) => const BookingConfirmationScreen(),
      ),
    ],
  );
});