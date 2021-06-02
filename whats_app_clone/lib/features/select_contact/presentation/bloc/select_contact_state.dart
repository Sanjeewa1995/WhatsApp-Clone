part of 'select_contact_bloc.dart';

@freezed
abstract class SelectContactState with _$SelectContactState {
  const factory SelectContactState.initial() =
      _Initial;
  const factory SelectContactState.completed(ContactListResponse allContacts) = _Completed;
}

// abstract class SelectContactState extends Equatable {
//   @override
//   List<Object> get props => [];
// }

// class SelectContactInitial extends SelectContactState {}

// class SelectContactCompleted extends SelectContactState {
//   final List<Contact> allContact;

//   SelectContactCompleted({this.allContact});
// }
