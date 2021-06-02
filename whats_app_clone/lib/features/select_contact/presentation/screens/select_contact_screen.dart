import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app_clone/core/custom_widgets/contact_card.dart';
import 'package:whats_app_clone/features/create_group/presentation/screnns/create_group_screen.dart';
import 'package:whats_app_clone/features/select_contact/presentation/widgets/new_contact.dart';
import 'package:whats_app_clone/features/select_contact/presentation/bloc/select_contact_bloc.dart';
import 'package:whats_app_clone/features/select_contact/presentation/widgets/new_group.dart';

class SelectContactScreen extends StatefulWidget {
  SelectContactScreen() : super();

  @override
  _SelectContactScreenState createState() => _SelectContactScreenState();
}

class _SelectContactScreenState extends State<SelectContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
          title: BlocBuilder<SelectContactBloc, SelectContactState>(
            builder: (context, state) {
              return state.map(initial: (state) {
                return Text('Select contact');
              }, completed: (state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select contact',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                        state.allContacts.allContactList.length.toString() +
                            ' contacts',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w400))
                  ],
                );
              });
            },
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
                size: 26,
              ),
              onPressed: () {},
            ),
            PopupMenuButton<String>(onSelected: (value) {
              print(value);
            }, itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text('Invite a friend'),
                  value: 'Invite a friend',
                ),
                PopupMenuItem(
                  child: Text('Contacts'),
                  value: 'Contacts',
                ),
                PopupMenuItem(
                  child: Text('Refresh'),
                  value: 'Refresh',
                ),
                PopupMenuItem(
                  child: Text('Help'),
                  value: 'Help',
                ),
              ];
            })
          ],
        ),
        body: BlocBuilder<SelectContactBloc, SelectContactState>(
          builder: (context, state) {
            return state.map(initial: (state) {
              return Center(child: CircularProgressIndicator());
            }, completed: (state) {
              print(state.allContacts.allContactList[0].name);
              return ListView.builder(
                  itemCount: state.allContacts.allContactList.length + 2,
                  //shrinkWrap: true,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    CreateGroupScreen()));
                          },
                          child: NewGroupCard());
                    } else if (index == 1) {
                      return NewContactCard();
                    } else {
                      return ContactCard(
                        contact: state.allContacts.allContactList[index],
                       // name: state.allContacts.allContactList[index].name,
                      );
                    }
                  });
            });
          },
        ));
  }
}
