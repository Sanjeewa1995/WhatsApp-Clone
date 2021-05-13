part of 'select_contact_bloc.dart';

@freezed
abstract class SelectContactState with _$SelectContactState {
  const factory SelectContactState.initial() =
      _Initial;
  const factory SelectContactState.completed(List<Contact> allContacts) = _Completed;
}
