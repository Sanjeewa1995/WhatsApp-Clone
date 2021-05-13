import 'package:contacts_service/contacts_service.dart';
import 'package:injectable/injectable.dart';
import 'package:whats_app_clone/data/datasources/local_data_source/local_data_source.dart';
import 'package:whats_app_clone/data/models/response/contact_list_response_model.dart';
import 'package:whats_app_clone/domain/entities/response/contact_list_response.dart';
import 'package:whats_app_clone/domain/repositiries/select_contact_repo.dart';

@LazySingleton(as: SelectContactRepo)
class SelectContactListRepoImpl extends SelectContactRepo {
  final LocalDataSource localDataSource;

  SelectContactListRepoImpl(this.localDataSource);
  @override
  Future<ContactListResponse> getContactList() async {
    Iterable<Contact> contactData = await localDataSource.getContactList();
    ContactListResponse response = ContactListResponseModel.toList(contactData);
    return response;
  }
}
