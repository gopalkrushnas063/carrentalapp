import 'package:flutter_riverpod/legacy.dart';
import '../models/booking_model.dart';


enum BookingState { initial, loading, success, failed }

final bookingProvider = StateNotifierProvider<BookingProvider, BookingViewModel>((ref) {
  return BookingProvider(BookingViewModel());
});

class BookingProvider extends StateNotifier<BookingViewModel> {
  BookingProvider(super.state);

  void createBooking({
    required String userName,
    required String userEmail,
    required String phoneNumber,
    required DateTime pickupDate,
    required DateTime returnDate,
    required String pickupLocation,
    required String returnLocation,
    required String carId,
  }) {
    try {
      state = BookingViewModel(state: BookingState.loading);
      
      // Mock booking creation
      final booking = Booking(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        carId: carId,
        userName: userName,
        userEmail: userEmail,
        phoneNumber: phoneNumber,
        pickupDate: pickupDate,
        returnDate: returnDate,
        pickupLocation: pickupLocation,
        returnLocation: returnLocation,
        totalPrice: _calculateTotalPrice(carId, pickupDate, returnDate),
        bookingDate: DateTime.now(),
        status: 'Confirmed',
      );
      
      state = BookingViewModel(
        state: BookingState.success,
        booking: booking,
      );
    } catch (e) {
      state = BookingViewModel(
        state: BookingState.failed,
        error: e.toString(),
      );
    }
  }

  double _calculateTotalPrice(String carId, DateTime pickup, DateTime returnDate) {
    // Mock calculation - in real app, fetch car price and calculate
    final days = returnDate.difference(pickup).inDays + 1;
    return days * 45.99; // Default price
  }
}

class BookingViewModel {
  final BookingState state;
  final Booking? booking;
  final String? error;

  BookingViewModel({
    this.state = BookingState.initial,
    this.booking,
    this.error,
  });
}