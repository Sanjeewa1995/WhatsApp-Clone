import 'package:contacts_service/contacts_service.dart';
import 'package:whats_app_clone/core/model/contact_model.dart';
import 'package:whats_app_clone/domain/entities/response/contact_list_response.dart';

class ContactListModel extends ContactListResponse {
  ContactListModel({required List<ContactModel> allContactList})
      : super(allContactList: allContactList);

  static List<ContactModel> toContactList(List<Contact> contacts) {
    List<ContactModel> contactList = contacts.map((contact) {
      return ContactModel(
        name: contact.displayName == null ? 'mm' : contact.displayName!,
        avatar: contact.avatar!,
        hasAvatar: contact.avatar!.isNotEmpty,
        initials: contact.initials(),
        isSelected: false,
      );
    }).toList();

    return contactList;
  }
}
