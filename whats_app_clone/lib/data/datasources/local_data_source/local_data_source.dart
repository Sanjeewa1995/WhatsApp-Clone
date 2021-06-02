import 'package:contacts_service/contacts_service.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class LocalDataSource {
  Future<Iterable<Contact>> getContactList();
}

@LazySingleton(as: LocalDataSource)
class LocalDataSourceImpl extends LocalDataSource {
  @override
  Future<Iterable<Contact>> getContactList() async {
    Iterable<Contact> contacts =[];
    if (await Permission.contacts.request().isGranted) {
      contacts = await ContactsService.getContacts();
    }
    return contacts;
  }
}
