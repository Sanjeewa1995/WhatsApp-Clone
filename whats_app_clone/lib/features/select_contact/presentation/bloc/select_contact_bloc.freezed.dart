// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'select_contact_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SelectContactEventTearOff {
  const _$SelectContactEventTearOff();

  GetContactList getContactList() {
    return const GetContactList();
  }
}

/// @nodoc
const $SelectContactEvent = _$SelectContactEventTearOff();

/// @nodoc
mixin _$SelectContactEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getContactList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getContactList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetContactList value) getContactList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetContactList value)? getContactList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectContactEventCopyWith<$Res> {
  factory $SelectContactEventCopyWith(
          SelectContactEvent value, $Res Function(SelectContactEvent) then) =
      _$SelectContactEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SelectContactEventCopyWithImpl<$Res>
    implements $SelectContactEventCopyWith<$Res> {
  _$SelectContactEventCopyWithImpl(this._value, this._then);

  final SelectContactEvent _value;
  // ignore: unused_field
  final $Res Function(SelectContactEvent) _then;
}

/// @nodoc
abstract class $GetContactListCopyWith<$Res> {
  factory $GetContactListCopyWith(
          GetContactList value, $Res Function(GetContactList) then) =
      _$GetContactListCopyWithImpl<$Res>;
}

/// @nodoc
class _$GetContactListCopyWithImpl<$Res>
    extends _$SelectContactEventCopyWithImpl<$Res>
    implements $GetContactListCopyWith<$Res> {
  _$GetContactListCopyWithImpl(
      GetContactList _value, $Res Function(GetContactList) _then)
      : super(_value, (v) => _then(v as GetContactList));

  @override
  GetContactList get _value => super._value as GetContactList;
}

/// @nodoc

class _$GetContactList implements GetContactList {
  const _$GetContactList();

  @override
  String toString() {
    return 'SelectContactEvent.getContactList()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GetContactList);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getContactList,
  }) {
    return getContactList();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getContactList,
    required TResult orElse(),
  }) {
    if (getContactList != null) {
      return getContactList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetContactList value) getContactList,
  }) {
    return getContactList(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetContactList value)? getContactList,
    required TResult orElse(),
  }) {
    if (getContactList != null) {
      return getContactList(this);
    }
    return orElse();
  }
}

abstract class GetContactList implements SelectContactEvent {
  const factory GetContactList() = _$GetContactList;
}

/// @nodoc
class _$SelectContactStateTearOff {
  const _$SelectContactStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _Completed completed(ContactListResponse allContacts) {
    return _Completed(
      allContacts,
    );
  }
}

/// @nodoc
const $SelectContactState = _$SelectContactStateTearOff();

/// @nodoc
mixin _$SelectContactState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(ContactListResponse allContacts) completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ContactListResponse allContacts)? completed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Completed value) completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Completed value)? completed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectContactStateCopyWith<$Res> {
  factory $SelectContactStateCopyWith(
          SelectContactState value, $Res Function(SelectContactState) then) =
      _$SelectContactStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SelectContactStateCopyWithImpl<$Res>
    implements $SelectContactStateCopyWith<$Res> {
  _$SelectContactStateCopyWithImpl(this._value, this._then);

  final SelectContactState _value;
  // ignore: unused_field
  final $Res Function(SelectContactState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$SelectContactStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'SelectContactState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(ContactListResponse allContacts) completed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ContactListResponse allContacts)? completed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Completed value) completed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Completed value)? completed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SelectContactState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$CompletedCopyWith<$Res> {
  factory _$CompletedCopyWith(
          _Completed value, $Res Function(_Completed) then) =
      __$CompletedCopyWithImpl<$Res>;
  $Res call({ContactListResponse allContacts});
}

/// @nodoc
class __$CompletedCopyWithImpl<$Res>
    extends _$SelectContactStateCopyWithImpl<$Res>
    implements _$CompletedCopyWith<$Res> {
  __$CompletedCopyWithImpl(_Completed _value, $Res Function(_Completed) _then)
      : super(_value, (v) => _then(v as _Completed));

  @override
  _Completed get _value => super._value as _Completed;

  @override
  $Res call({
    Object? allContacts = freezed,
  }) {
    return _then(_Completed(
      allContacts == freezed
          ? _value.allContacts
          : allContacts // ignore: cast_nullable_to_non_nullable
              as ContactListResponse,
    ));
  }
}

/// @nodoc

class _$_Completed implements _Completed {
  const _$_Completed(this.allContacts);

  @override
  final ContactListResponse allContacts;

  @override
  String toString() {
    return 'SelectContactState.completed(allContacts: $allContacts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Completed &&
            (identical(other.allContacts, allContacts) ||
                const DeepCollectionEquality()
                    .equals(other.allContacts, allContacts)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(allContacts);

  @JsonKey(ignore: true)
  @override
  _$CompletedCopyWith<_Completed> get copyWith =>
      __$CompletedCopyWithImpl<_Completed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(ContactListResponse allContacts) completed,
  }) {
    return completed(allContacts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ContactListResponse allContacts)? completed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(allContacts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Completed value) completed,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Completed value)? completed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class _Completed implements SelectContactState {
  const factory _Completed(ContactListResponse allContacts) = _$_Completed;

  ContactListResponse get allContacts => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$CompletedCopyWith<_Completed> get copyWith =>
      throw _privateConstructorUsedError;
}
