import 'package:carrentalapp/widgets/car_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/car_provider.dart';

class CarListScreen extends ConsumerStatefulWidget {
  const CarListScreen({super.key});

  @override
  ConsumerState<CarListScreen> createState() => _CarListScreenState();
}

class _CarListScreenState extends ConsumerState<CarListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(carListProvider.notifier).fetchCars();
    });
  }

  @override
  Widget build(BuildContext context) {
    final carState = ref.watch(carListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Available Cars')),
      body: _buildBody(carState),
    );
  }

  Widget _buildBody(CarListViewModel state) {
    switch (state.state) {
      case CarState.loading:
        return const Center(child: CircularProgressIndicator());
      case CarState.failed:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text('Error: ${state.error}'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ref.read(carListProvider.notifier).fetchCars();
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        );
      case CarState.ready:
        if (state.cars == null || state.cars!.isEmpty) {
          return const Center(child: Text('No cars available'));
        }
        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 16),
          itemCount: state.cars!.length,
          itemBuilder: (context, index) {
            final car = state.cars![index];
            return CarCard(
              car: car,
              onTap: () {
                context.go('/car/${car.id}');
              },
            );
          },
        );
    }
  }
}
