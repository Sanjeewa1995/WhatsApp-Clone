// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasources/local_data_source/local_data_source.dart' as _i3;
import '../../data/repositories/select_contact_repo_impl.dart' as _i5;
import '../../domain/repositiries/select_contact_repo.dart' as _i4;
import '../../domain/usecases/get_contacts_list.dart' as _i6;
import '../../features/select_contact/presentation/bloc/select_contact_bloc.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.LocalDataSource>(() => _i3.LocalDataSourceImpl());
  gh.lazySingleton<_i4.SelectContactRepo>(
      () => _i5.SelectContactListRepoImpl(get<_i3.LocalDataSource>()));
  gh.lazySingleton<_i6.GetContactListUseCase>(
      () => _i6.GetContactListUseCase(get<_i4.SelectContactRepo>()));
  gh.factory<_i7.SelectContactBloc>(
      () => _i7.SelectContactBloc(get<_i6.GetContactListUseCase>()));
  return get;
}
