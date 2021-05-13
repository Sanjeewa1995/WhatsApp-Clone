import 'package:whats_app_clone/core/usecases/usecase.dart';
import 'package:whats_app_clone/domain/entities/response/contact_list_response.dart';
import 'package:whats_app_clone/domain/repositiries/select_contact_repo.dart';

class GetContactListUseCase extends UseCase {
  final SelectContactRepo repo;

  GetContactListUseCase(this.repo);

  @override
  Future<ContactListResponse> call(params) async {
    return repo.getContactList();
  }
}
