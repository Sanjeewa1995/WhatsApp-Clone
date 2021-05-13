import 'package:whats_app_clone/domain/entities/response/contact_list_response.dart';

abstract class SelectContactRepo {
    Future<ContactListResponse> getContactList();
}