import 'package:flutter_riverpod/legacy.dart';
import '../models/car_model.dart';
import '../services/car_service.dart';

enum CarState { loading, ready, failed }

final carListProvider = StateNotifierProvider<CarListProvider, CarListViewModel>((ref) {
  return CarListProvider(CarListViewModel());
});

class CarListProvider extends StateNotifier<CarListViewModel> {
  CarListProvider(super.state);

  Future<void> fetchCars() async {
    try {
      state = CarListViewModel(state: CarState.loading);
      
      final List<Car> cars = await CarService.getAvailableCars();
      
      state = CarListViewModel(
        state: CarState.ready,
        cars: cars,
      );
    } catch (e) {
      state = CarListViewModel(
        state: CarState.failed,
        error: e.toString(),
      );
    }
  }
}

class CarListViewModel {
  final CarState state;
  final List<Car>? cars;
  final String? error;

  CarListViewModel({
    this.state = CarState.loading,
    this.cars,
    this.error,
  });
}

final selectedCarProvider = StateProvider<Car?>((ref) => null);