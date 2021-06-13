part of 'resgister_bloc.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetCountryCode extends RegisterEvent {
  final CountryInfoParams countryInfoParams;

  GetCountryCode(this.countryInfoParams);
}

class GetPhoneNumberEvent extends RegisterEvent {}

