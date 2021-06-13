import 'package:equatable/equatable.dart';
import 'package:whats_app_clone/features/register/domain/entities/country_info.dart';
import 'package:whats_app_clone/features/register/domain/repository/register_repo.dart';

class GetCountryInfoUseCase {
  final RegisterRepo registerRepo;

  GetCountryInfoUseCase(this.registerRepo);

  CountryInfo call(CountryInfoParams params) {
    return registerRepo.getCountryInfo(params.country);
  }
}

class CountryInfoParams extends Equatable {
  final String country;

  CountryInfoParams(this.country);
  @override
  List<Object?> get props => [country];
}
