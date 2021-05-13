import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:whats_app_clone/domain/entities/response/contact_list_response.dart';
import 'package:whats_app_clone/domain/repositiries/select_contact_repo.dart';

part 'select_contact_event.dart';
part 'select_contact_state.dart';
part 'select_contact_bloc.freezed.dart';

@injectable
class SelectContactBloc extends Bloc<SelectContactEvent, SelectContactState> {
  final SelectContactRepo repo;
  SelectContactBloc(this.repo) : super(SelectContactState.initial());

  @override
  Stream<SelectContactState> mapEventToState(
    SelectContactEvent event,
  ) async* {
    yield* event.map(getContactList: (e) async* {
      ContactListResponse response = await repo.getContactList();
      yield SelectContactState.completed(response.allContactList);
    });
  }
}
