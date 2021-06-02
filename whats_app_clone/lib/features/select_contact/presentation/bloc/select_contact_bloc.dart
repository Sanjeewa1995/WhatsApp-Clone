import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:whats_app_clone/domain/entities/response/contact_list_response.dart';
import 'package:whats_app_clone/domain/usecases/get_contacts_list.dart';

part 'select_contact_event.dart';
part 'select_contact_state.dart';
part 'select_contact_bloc.freezed.dart';

@injectable
class SelectContactBloc extends Bloc<SelectContactEvent, SelectContactState> {
  final GetContactListUseCase getContactListUseCase;
  SelectContactBloc(this.getContactListUseCase)
      : super(SelectContactState.initial());

  @override
  Stream<SelectContactState> mapEventToState(
    SelectContactEvent event,
  ) async* {
    yield* event.map(getContactList: (e) async* {
      ContactListResponse response =
          await getContactListUseCase.call(NoParams());
      yield SelectContactState.completed(response);
    });
  }
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
