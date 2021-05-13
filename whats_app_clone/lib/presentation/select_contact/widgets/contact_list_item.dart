import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app_clone/presentation/select_contact/bloc/select_contact_bloc.dart';

class ContactListItem extends StatelessWidget {
  final int index;
  final state;
  const ContactListItem({Key key, @required this.index, @required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectContactBloc, SelectContactState>(
        builder: (context, state) {
      return state.map(initial: (state) {
        return Container();
      }, completed: (state) {
        //          List colors = [
        //   Colors.green,
        //   Colors.indigo,
        //   Colors.yellow,
        //   Colors.orange
        // ];
        return ListTile(
          leading: (state.allContacts[index].avatar != null &&
                  state.allContacts[index].avatar.length > 0)
              ? CircleAvatar(
                  backgroundImage: MemoryImage(state.allContacts[index].avatar),
                )
              : Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: [
                        Colors.green,
                        Colors.indigo,
                      ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
                  child: CircleAvatar(
                      child: Text(state.allContacts[index].initials(),
                          style: TextStyle(color: Colors.white)),
                      backgroundColor: Colors.transparent)),
          // CircleAvatar(
          //   radius: 20,
          //   foregroundColor: Theme.of(context).primaryColor,
          //   backgroundColor: Colors.grey,
          //   backgroundImage: MemoryImage(state.allContacts[index].avatar)),
          title: Text(state.allContacts[index].displayName,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
          subtitle: Text('hey there i am using whatsapp',
              style: TextStyle(color: Colors.grey)),
        );
      });
    });
  }
}
