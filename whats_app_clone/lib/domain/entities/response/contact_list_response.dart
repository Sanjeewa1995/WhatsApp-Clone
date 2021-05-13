import 'package:contacts_service/contacts_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class ContactListResponse extends Equatable {
  final List<Contact> allContactList;

  ContactListResponse({@required this.allContactList});

  @override
  List<Object> get props => [allContactList];
}
