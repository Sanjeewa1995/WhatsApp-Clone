import 'package:whats_app_clone/features/register/data/register_local_data_source.dart';
import 'package:whats_app_clone/features/register/domain/entities/country_info.dart';
import 'package:whats_app_clone/features/register/domain/repository/register_repo.dart';

class RegisterRepoImpl extends RegisterRepo {
  final RegisterLocalDataSource registerLocalDataSource;

  RegisterRepoImpl({required this.registerLocalDataSource});
  @override
  Future getPhoneNumber() async {
    return await registerLocalDataSource.getPhoneNumber();
  }

  @override
  CountryInfo getCountryInfo(String country) {
      return registerLocalDataSource.getCountryInfo(country);
  }
}
