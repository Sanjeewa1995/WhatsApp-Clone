import 'package:equatable/equatable.dart';
import 'package:whats_app_clone/core/usecases/usecase.dart';
import 'package:whats_app_clone/features/register/domain/repository/register_repo.dart';

class GetPhoneNumberUseCase {
  final RegisterRepo registerRepo;

  GetPhoneNumberUseCase(this.registerRepo);

  Future<String?> call(GetPhoneNumberParams params) async {
    return await registerRepo.getPhoneNumber();
  }
}

class GetPhoneNumberParams extends Equatable {
  @override
  List<Object?> get props => [];
}
