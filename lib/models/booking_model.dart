class Booking {
  final String id;
  final String carId;
  final String userName;
  final String userEmail;
  final String phoneNumber;
  final DateTime pickupDate;
  final DateTime returnDate;
  final String pickupLocation;
  final String returnLocation;
  final double totalPrice;
  final DateTime bookingDate;
  final String status;

  Booking({
    required this.id,
    required this.carId,
    required this.userName,
    required this.userEmail,
    required this.phoneNumber,
    required this.pickupDate,
    required this.returnDate,
    required this.pickupLocation,
    required this.returnLocation,
    required this.totalPrice,
    required this.bookingDate,
    required this.status,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      carId: json['carId'],
      userName: json['userName'],
      userEmail: json['userEmail'],
      phoneNumber: json['phoneNumber'],
      pickupDate: DateTime.parse(json['pickupDate']),
      returnDate: DateTime.parse(json['returnDate']),
      pickupLocation: json['pickupLocation'],
      returnLocation: json['returnLocation'],
      totalPrice: json['totalPrice'].toDouble(),
      bookingDate: DateTime.parse(json['bookingDate']),
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'carId': carId,
      'userName': userName,
      'userEmail': userEmail,
      'phoneNumber': phoneNumber,
      'pickupDate': pickupDate.toIso8601String(),
      'returnDate': returnDate.toIso8601String(),
      'pickupLocation': pickupLocation,
      'returnLocation': returnLocation,
      'totalPrice': totalPrice,
      'bookingDate': bookingDate.toIso8601String(),
      'status': status,
    };
  }
}