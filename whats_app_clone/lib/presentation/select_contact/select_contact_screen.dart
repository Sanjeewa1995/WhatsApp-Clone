import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app_clone/core/injection/injection.dart';
import 'package:whats_app_clone/presentation/select_contact/bloc/select_contact_bloc.dart';
import 'package:whats_app_clone/presentation/select_contact/widgets/contact_list.dart';
import 'package:whats_app_clone/presentation/select_contact/widgets/new_group.dart';

class SelectContactScreen extends StatefulWidget {
  SelectContactScreen({Key key}) : super(key: key);

  @override
  _SelectContactScreenState createState() => _SelectContactScreenState();
}

class _SelectContactScreenState extends State<SelectContactScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<SelectContactBloc>()
          ..add(const SelectContactEvent.getContactList()),
        child: Scaffold(
            appBar: AppBar(
              leading:
                  IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
              title: BlocBuilder<SelectContactBloc, SelectContactState>(
                builder: (context, state) {
                  return state.map(initial: (state) {
                    return Text('no');
                  }, completed: (state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Select contact'),
                        SizedBox(height: 3),
                        Text(state.allContacts[1].displayName,
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w400))
                      ],
                    );
                  });
                },
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
                IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
              ],
            ),
            body: Column(
              children: [
                NewGroup(),
                Container(
                  height: MediaQuery.of(context).size.height - 150,
                  child: ContactList(),
                ),
              ],
            )));
  }
}
