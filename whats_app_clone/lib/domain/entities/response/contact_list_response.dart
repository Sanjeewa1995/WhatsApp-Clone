
import 'package:equatable/equatable.dart';
import 'package:whats_app_clone/core/model/contact_model.dart';

class ContactListResponse extends Equatable {
  final List<ContactModel> allContactList;

  ContactListResponse({required this.allContactList});

  @override
  List<Object> get props => [allContactList];
}
