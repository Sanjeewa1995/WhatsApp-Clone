import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:whats_app_clone/features/register/domain/entities/country_info.dart';
import 'package:whats_app_clone/features/register/domain/usecase/get_country_info.dart';
import 'package:whats_app_clone/features/register/domain/usecase/get_phone_number.dart';

part 'resgister_event.dart';
part 'resgister_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final GetPhoneNumberUseCase getPhoneNumber;
  final GetCountryInfoUseCase getCountryInfoUseCase;
  RegisterBloc(
      {required this.getPhoneNumber, required this.getCountryInfoUseCase})
      : super(InitialState());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is GetPhoneNumberEvent) {
      String? phoneNumber = await getPhoneNumber(GetPhoneNumberParams());
      yield GetPhoneNumberCompleted(phoneNumber);
    } else if (event is GetCountryCode) {
      yield GetCountryCodeInitialize();
      CountryInfo countryInfo =
          getCountryInfoUseCase.call(event.countryInfoParams);
      yield GetCountryCodeCompleted(countryInfo);
    }
  }
}
