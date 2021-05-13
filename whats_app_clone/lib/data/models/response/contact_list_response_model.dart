import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/widgets.dart';
import 'package:whats_app_clone/domain/entities/response/contact_list_response.dart';

class ContactListResponseModel extends ContactListResponse {
  ContactListResponseModel({@required List<Contact> allContactList})
      : super(allContactList: allContactList);

  factory ContactListResponseModel.toList(Iterable contactList) {
    return ContactListResponseModel(allContactList: contactList.toList());
  }
}
