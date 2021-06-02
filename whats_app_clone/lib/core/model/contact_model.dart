import 'dart:typed_data';

class ContactModel {
  final String name;
  final Uint8List avatar;
  final String initials;
  final bool hasAvatar;
  bool isSelected;

  ContactModel(
      {required this.name,
      required this.avatar,
      required this.hasAvatar,
      required this.initials,
      this.isSelected = false});
}
