import 'package:equatable/equatable.dart';

class Purchaser extends Equatable {
  final String name;
  final String email;
  final String phoneNumber;

  const Purchaser({
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  @override
  List<Object?> get props => [name, email, phoneNumber];
}
