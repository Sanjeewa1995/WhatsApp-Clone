part of 'resgister_bloc.dart';

abstract class RegisterState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialState extends RegisterState {}

class GetCountryCodeInitialize extends RegisterState{}

class GetCountryCodeCompleted extends RegisterState{
  final CountryInfo countryInfo;

  GetCountryCodeCompleted(this.countryInfo); 
}

class GetPhoneNumberCompleted extends RegisterState {
  final String? phoneNumber;

  GetPhoneNumberCompleted(this.phoneNumber);
}
