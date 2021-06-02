
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app_clone/core/custom_widgets/contact_card.dart';
import 'package:whats_app_clone/core/model/contact_model.dart';
import 'package:whats_app_clone/features/create_group/presentation/widgets/create_group_app_bar.dart';
import 'package:whats_app_clone/features/create_group/presentation/widgets/selected_contact_view.dart';
import 'package:whats_app_clone/features/select_contact/presentation/bloc/select_contact_bloc.dart';

class CreateGroupScreen extends StatefulWidget {
  CreateGroupScreen() : super();

  @override
  _CreateGroupScreenState createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  List<ContactModel?> selectedList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CreateGroupAppBar(),
        body: BlocBuilder<SelectContactBloc, SelectContactState>(
          builder: (context, state) {
            return state.map(initial: (state) {
              return Center(child: CircularProgressIndicator());
            }, completed: (state) {
              return Stack(
                children: [
                  ListView.builder(
                      itemCount: state.allContacts.allContactList.length + 1,
                      //shrinkWrap: true,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Container(
                            height: selectedList.length > 0 ? 100 : 10,
                          );
                        }
                        return InkWell(
                          onTap: () {
                            if (!state
                                .allContacts.allContactList[index].isSelected) {
                              setState(() {
                                state.allContacts.allContactList[index]
                                    .isSelected = true;
                                selectedList.add(
                                    state.allContacts.allContactList[index]);
                              });
                            } else {
                              setState(() {
                                state.allContacts.allContactList[index]
                                    .isSelected = false;
                                selectedList.remove(
                                    state.allContacts.allContactList[index]);
                              });
                            }
                          },
                          child: ContactCard(
                            contact: state.allContacts.allContactList[index],
                            
                          ),
                        );
                      }),
                  if (selectedList.length > 0)
                    SelectedContactView(selectedContacts: selectedList)
                ],
              );
            });
          },
        ));
  }
}
