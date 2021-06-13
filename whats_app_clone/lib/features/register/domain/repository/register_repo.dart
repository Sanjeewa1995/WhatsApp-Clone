import 'package:whats_app_clone/features/register/domain/entities/country_info.dart';

abstract class RegisterRepo {
  CountryInfo getCountryInfo(String country);
  Future getPhoneNumber();
}
