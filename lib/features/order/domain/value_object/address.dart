import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final String street;
  final String zipCode;
  final String city;
  final String country;

  const Address({
    required this.street,
    required this.zipCode,
    required this.city,
    required this.country,
  });

  @override
  List<Object?> get props => [street, zipCode, city, country];
}
