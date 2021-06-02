part of 'select_contact_bloc.dart';

@freezed
abstract class SelectContactEvent with _$SelectContactEvent {
  const factory SelectContactEvent.getContactList() = GetContactList;
}