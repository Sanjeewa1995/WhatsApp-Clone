import 'package:flutter/material.dart';
import 'package:whats_app_clone/core/model/contact_model.dart';

class SelectedContactView extends StatefulWidget {
  final List<ContactModel?> selectedContacts;
  SelectedContactView({required this.selectedContacts}) : super();

  @override
  _SelectedContactViewState createState() => _SelectedContactViewState();
}

class _SelectedContactViewState extends State<SelectedContactView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            height: 90,
            color: Colors.white,
            margin: EdgeInsets.zero,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.selectedContacts.length,
                itemBuilder: (context, index) {
                  String name;
                  if (widget.selectedContacts[index]!.name.length <= 13) {
                    name = widget.selectedContacts[index]!.name;
                  } else {
                    name =
                        widget.selectedContacts[index]!.name.substring(0, 12) +
                            '...';
                  }
                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 60,
                          width: 63,
                          child: Stack(
                            children: [
                              (widget.selectedContacts[index]!.avatar.length >
                                      0)
                                  ? CircleAvatar(
                                      radius: 26,
                                      backgroundImage: MemoryImage(widget
                                          .selectedContacts[index]!.avatar),
                                    )
                                  : CircleAvatar(
                                      radius: 26,
                                      child: Icon(
                                        Icons.person,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                      backgroundColor:
                                          Colors.grey.withOpacity(0.5),
                                    ),
                              Positioned(
                                bottom: 2,
                                right: 2,
                                child: CircleAvatar(
                                  radius: 13,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    radius: 11,
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Text(name)
                      ],
                    ),
                  );
                }),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 1,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
