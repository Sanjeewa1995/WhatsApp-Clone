import 'package:sms_autofill/sms_autofill.dart';
import 'package:whats_app_clone/core/const.dart';
import 'package:whats_app_clone/features/register/domain/entities/country_info.dart';

abstract class RegisterLocalDataSource {
  Future<String?> getPhoneNumber();
  CountryInfo getCountryInfo(String country);
}

class RegisterLocalDataSourceImpl extends RegisterLocalDataSource {
  @override
  Future<String?> getPhoneNumber() async {
    final SmsAutoFill _autoFill = SmsAutoFill();
    String? phoneNumber = await _autoFill.hint;
    return phoneNumber ?? '';
  }

  @override
  CountryInfo getCountryInfo(String country) {
     
    for (int i = 0; i < countryCodes.length; i++) {
      if (countryCodes[i]['name'] == country) {
        CountryInfo countryInfo =
            CountryInfo(name: country, code: countryCodes[i]['dial_code']);
        return countryInfo;
      } else {}
    }
    CountryInfo countryInfo = CountryInfo(name: country, code: '');
    return countryInfo;
  }
}
