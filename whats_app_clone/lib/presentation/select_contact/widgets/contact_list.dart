import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app_clone/presentation/select_contact/bloc/select_contact_bloc.dart';
import 'package:whats_app_clone/presentation/select_contact/widgets/contact_list_item.dart';

class ContactList extends StatefulWidget {
  ContactList({Key key}) : super(key: key);

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectContactBloc, SelectContactState>(
      builder: (context, state) {
        return state.map(initial: (state) {
          return Center(child: CircularProgressIndicator());
        }, completed: (state) {
          return ListView.builder(
              itemCount: state.allContacts.length,
              //shrinkWrap: true,
              itemBuilder: (context, index) {
                return ContactListItem(
                  index: index,
                  state: state.allContacts[index].displayName,
                );
              });
        });
      },
    );
  }
}
