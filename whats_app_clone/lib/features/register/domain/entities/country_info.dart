import 'package:equatable/equatable.dart';

class CountryInfo extends Equatable {
  final String name;
  final String code;

  CountryInfo({required this.name, required this.code});
  @override
  List<Object?> get props => [name, code];
}
