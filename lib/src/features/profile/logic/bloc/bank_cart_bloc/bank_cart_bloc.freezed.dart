// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_cart_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BankCartEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchPaymentMethods,
    required TResult Function(int id) addBankCard,
    required TResult Function() fetchCards,
    required TResult Function(int id) removeCard,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchPaymentMethods,
    TResult? Function(int id)? addBankCard,
    TResult? Function()? fetchCards,
    TResult? Function(int id)? removeCard,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchPaymentMethods,
    TResult Function(int id)? addBankCard,
    TResult Function()? fetchCards,
    TResult Function(int id)? removeCard,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchPaymentMethods value) fetchPaymentMethods,
    required TResult Function(_AddBankCard value) addBankCard,
    required TResult Function(_FetchCards value) fetchCards,
    required TResult Function(_RemoveCard value) removeCard,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult? Function(_AddBankCard value)? addBankCard,
    TResult? Function(_FetchCards value)? fetchCards,
    TResult? Function(_RemoveCard value)? removeCard,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult Function(_AddBankCard value)? addBankCard,
    TResult Function(_FetchCards value)? fetchCards,
    TResult Function(_RemoveCard value)? removeCard,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankCartEventCopyWith<$Res> {
  factory $BankCartEventCopyWith(
          BankCartEvent value, $Res Function(BankCartEvent) then) =
      _$BankCartEventCopyWithImpl<$Res, BankCartEvent>;
}

/// @nodoc
class _$BankCartEventCopyWithImpl<$Res, $Val extends BankCartEvent>
    implements $BankCartEventCopyWith<$Res> {
  _$BankCartEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchPaymentMethodsImplCopyWith<$Res> {
  factory _$$FetchPaymentMethodsImplCopyWith(_$FetchPaymentMethodsImpl value,
          $Res Function(_$FetchPaymentMethodsImpl) then) =
      __$$FetchPaymentMethodsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchPaymentMethodsImplCopyWithImpl<$Res>
    extends _$BankCartEventCopyWithImpl<$Res, _$FetchPaymentMethodsImpl>
    implements _$$FetchPaymentMethodsImplCopyWith<$Res> {
  __$$FetchPaymentMethodsImplCopyWithImpl(_$FetchPaymentMethodsImpl _value,
      $Res Function(_$FetchPaymentMethodsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchPaymentMethodsImpl implements _FetchPaymentMethods {
  const _$FetchPaymentMethodsImpl();

  @override
  String toString() {
    return 'BankCartEvent.fetchPaymentMethods()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchPaymentMethodsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchPaymentMethods,
    required TResult Function(int id) addBankCard,
    required TResult Function() fetchCards,
    required TResult Function(int id) removeCard,
  }) {
    return fetchPaymentMethods();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchPaymentMethods,
    TResult? Function(int id)? addBankCard,
    TResult? Function()? fetchCards,
    TResult? Function(int id)? removeCard,
  }) {
    return fetchPaymentMethods?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchPaymentMethods,
    TResult Function(int id)? addBankCard,
    TResult Function()? fetchCards,
    TResult Function(int id)? removeCard,
    required TResult orElse(),
  }) {
    if (fetchPaymentMethods != null) {
      return fetchPaymentMethods();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchPaymentMethods value) fetchPaymentMethods,
    required TResult Function(_AddBankCard value) addBankCard,
    required TResult Function(_FetchCards value) fetchCards,
    required TResult Function(_RemoveCard value) removeCard,
  }) {
    return fetchPaymentMethods(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult? Function(_AddBankCard value)? addBankCard,
    TResult? Function(_FetchCards value)? fetchCards,
    TResult? Function(_RemoveCard value)? removeCard,
  }) {
    return fetchPaymentMethods?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult Function(_AddBankCard value)? addBankCard,
    TResult Function(_FetchCards value)? fetchCards,
    TResult Function(_RemoveCard value)? removeCard,
    required TResult orElse(),
  }) {
    if (fetchPaymentMethods != null) {
      return fetchPaymentMethods(this);
    }
    return orElse();
  }
}

abstract class _FetchPaymentMethods implements BankCartEvent {
  const factory _FetchPaymentMethods() = _$FetchPaymentMethodsImpl;
}

/// @nodoc
abstract class _$$AddBankCardImplCopyWith<$Res> {
  factory _$$AddBankCardImplCopyWith(
          _$AddBankCardImpl value, $Res Function(_$AddBankCardImpl) then) =
      __$$AddBankCardImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$AddBankCardImplCopyWithImpl<$Res>
    extends _$BankCartEventCopyWithImpl<$Res, _$AddBankCardImpl>
    implements _$$AddBankCardImplCopyWith<$Res> {
  __$$AddBankCardImplCopyWithImpl(
      _$AddBankCardImpl _value, $Res Function(_$AddBankCardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$AddBankCardImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AddBankCardImpl implements _AddBankCard {
  const _$AddBankCardImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'BankCartEvent.addBankCard(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddBankCardImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddBankCardImplCopyWith<_$AddBankCardImpl> get copyWith =>
      __$$AddBankCardImplCopyWithImpl<_$AddBankCardImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchPaymentMethods,
    required TResult Function(int id) addBankCard,
    required TResult Function() fetchCards,
    required TResult Function(int id) removeCard,
  }) {
    return addBankCard(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchPaymentMethods,
    TResult? Function(int id)? addBankCard,
    TResult? Function()? fetchCards,
    TResult? Function(int id)? removeCard,
  }) {
    return addBankCard?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchPaymentMethods,
    TResult Function(int id)? addBankCard,
    TResult Function()? fetchCards,
    TResult Function(int id)? removeCard,
    required TResult orElse(),
  }) {
    if (addBankCard != null) {
      return addBankCard(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchPaymentMethods value) fetchPaymentMethods,
    required TResult Function(_AddBankCard value) addBankCard,
    required TResult Function(_FetchCards value) fetchCards,
    required TResult Function(_RemoveCard value) removeCard,
  }) {
    return addBankCard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult? Function(_AddBankCard value)? addBankCard,
    TResult? Function(_FetchCards value)? fetchCards,
    TResult? Function(_RemoveCard value)? removeCard,
  }) {
    return addBankCard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult Function(_AddBankCard value)? addBankCard,
    TResult Function(_FetchCards value)? fetchCards,
    TResult Function(_RemoveCard value)? removeCard,
    required TResult orElse(),
  }) {
    if (addBankCard != null) {
      return addBankCard(this);
    }
    return orElse();
  }
}

abstract class _AddBankCard implements BankCartEvent {
  const factory _AddBankCard({required final int id}) = _$AddBankCardImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$AddBankCardImplCopyWith<_$AddBankCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchCardsImplCopyWith<$Res> {
  factory _$$FetchCardsImplCopyWith(
          _$FetchCardsImpl value, $Res Function(_$FetchCardsImpl) then) =
      __$$FetchCardsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchCardsImplCopyWithImpl<$Res>
    extends _$BankCartEventCopyWithImpl<$Res, _$FetchCardsImpl>
    implements _$$FetchCardsImplCopyWith<$Res> {
  __$$FetchCardsImplCopyWithImpl(
      _$FetchCardsImpl _value, $Res Function(_$FetchCardsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchCardsImpl implements _FetchCards {
  const _$FetchCardsImpl();

  @override
  String toString() {
    return 'BankCartEvent.fetchCards()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchCardsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchPaymentMethods,
    required TResult Function(int id) addBankCard,
    required TResult Function() fetchCards,
    required TResult Function(int id) removeCard,
  }) {
    return fetchCards();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchPaymentMethods,
    TResult? Function(int id)? addBankCard,
    TResult? Function()? fetchCards,
    TResult? Function(int id)? removeCard,
  }) {
    return fetchCards?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchPaymentMethods,
    TResult Function(int id)? addBankCard,
    TResult Function()? fetchCards,
    TResult Function(int id)? removeCard,
    required TResult orElse(),
  }) {
    if (fetchCards != null) {
      return fetchCards();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchPaymentMethods value) fetchPaymentMethods,
    required TResult Function(_AddBankCard value) addBankCard,
    required TResult Function(_FetchCards value) fetchCards,
    required TResult Function(_RemoveCard value) removeCard,
  }) {
    return fetchCards(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult? Function(_AddBankCard value)? addBankCard,
    TResult? Function(_FetchCards value)? fetchCards,
    TResult? Function(_RemoveCard value)? removeCard,
  }) {
    return fetchCards?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult Function(_AddBankCard value)? addBankCard,
    TResult Function(_FetchCards value)? fetchCards,
    TResult Function(_RemoveCard value)? removeCard,
    required TResult orElse(),
  }) {
    if (fetchCards != null) {
      return fetchCards(this);
    }
    return orElse();
  }
}

abstract class _FetchCards implements BankCartEvent {
  const factory _FetchCards() = _$FetchCardsImpl;
}

/// @nodoc
abstract class _$$RemoveCardImplCopyWith<$Res> {
  factory _$$RemoveCardImplCopyWith(
          _$RemoveCardImpl value, $Res Function(_$RemoveCardImpl) then) =
      __$$RemoveCardImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$RemoveCardImplCopyWithImpl<$Res>
    extends _$BankCartEventCopyWithImpl<$Res, _$RemoveCardImpl>
    implements _$$RemoveCardImplCopyWith<$Res> {
  __$$RemoveCardImplCopyWithImpl(
      _$RemoveCardImpl _value, $Res Function(_$RemoveCardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$RemoveCardImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RemoveCardImpl implements _RemoveCard {
  const _$RemoveCardImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'BankCartEvent.removeCard(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveCardImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveCardImplCopyWith<_$RemoveCardImpl> get copyWith =>
      __$$RemoveCardImplCopyWithImpl<_$RemoveCardImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchPaymentMethods,
    required TResult Function(int id) addBankCard,
    required TResult Function() fetchCards,
    required TResult Function(int id) removeCard,
  }) {
    return removeCard(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchPaymentMethods,
    TResult? Function(int id)? addBankCard,
    TResult? Function()? fetchCards,
    TResult? Function(int id)? removeCard,
  }) {
    return removeCard?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchPaymentMethods,
    TResult Function(int id)? addBankCard,
    TResult Function()? fetchCards,
    TResult Function(int id)? removeCard,
    required TResult orElse(),
  }) {
    if (removeCard != null) {
      return removeCard(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchPaymentMethods value) fetchPaymentMethods,
    required TResult Function(_AddBankCard value) addBankCard,
    required TResult Function(_FetchCards value) fetchCards,
    required TResult Function(_RemoveCard value) removeCard,
  }) {
    return removeCard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult? Function(_AddBankCard value)? addBankCard,
    TResult? Function(_FetchCards value)? fetchCards,
    TResult? Function(_RemoveCard value)? removeCard,
  }) {
    return removeCard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchPaymentMethods value)? fetchPaymentMethods,
    TResult Function(_AddBankCard value)? addBankCard,
    TResult Function(_FetchCards value)? fetchCards,
    TResult Function(_RemoveCard value)? removeCard,
    required TResult orElse(),
  }) {
    if (removeCard != null) {
      return removeCard(this);
    }
    return orElse();
  }
}

abstract class _RemoveCard implements BankCartEvent {
  const factory _RemoveCard({required final int id}) = _$RemoveCardImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$RemoveCardImplCopyWith<_$RemoveCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BankCartState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PaymentMethod paymentMethod) successPaymentMehods,
    required TResult Function(AddBankCardResponse data) successAdd,
    required TResult Function(CardsModel cards) successCards,
    required TResult Function() loadingRemove,
    required TResult Function() successRemove,
    required TResult Function() updateData,
    required TResult Function(String message) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PaymentMethod paymentMethod)? successPaymentMehods,
    TResult? Function(AddBankCardResponse data)? successAdd,
    TResult? Function(CardsModel cards)? successCards,
    TResult? Function()? loadingRemove,
    TResult? Function()? successRemove,
    TResult? Function()? updateData,
    TResult? Function(String message)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PaymentMethod paymentMethod)? successPaymentMehods,
    TResult Function(AddBankCardResponse data)? successAdd,
    TResult Function(CardsModel cards)? successCards,
    TResult Function()? loadingRemove,
    TResult Function()? successRemove,
    TResult Function()? updateData,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SuccessPaymentMehods value) successPaymentMehods,
    required TResult Function(_SuccessAdd value) successAdd,
    required TResult Function(_SuccessCards value) successCards,
    required TResult Function(_LoadingRemove value) loadingRemove,
    required TResult Function(_SuccessRemove value) successRemove,
    required TResult Function(_UpdateData value) updateData,
    required TResult Function(_Failed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SuccessPaymentMehods value)? successPaymentMehods,
    TResult? Function(_SuccessAdd value)? successAdd,
    TResult? Function(_SuccessCards value)? successCards,
    TResult? Function(_LoadingRemove value)? loadingRemove,
    TResult? Function(_SuccessRemove value)? successRemove,
    TResult? Function(_UpdateData value)? updateData,
    TResult? Function(_Failed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SuccessPaymentMehods value)? successPaymentMehods,
    TResult Function(_SuccessAdd value)? successAdd,
    TResult Function(_SuccessCards value)? successCards,
    TResult Function(_LoadingRemove value)? loadingRemove,
    TResult Function(_SuccessRemove value)? successRemove,
    TResult Function(_UpdateData value)? updateData,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankCartStateCopyWith<$Res> {
  factory $BankCartStateCopyWith(
          BankCartState value, $Res Function(BankCartState) then) =
      _$BankCartStateCopyWithImpl<$Res, BankCartState>;
}

/// @nodoc
class _$BankCartStateCopyWithImpl<$Res, $Val extends BankCartState>
    implements $BankCartStateCopyWith<$Res> {
  _$BankCartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$BankCartStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'BankCartState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PaymentMethod paymentMethod) successPaymentMehods,
    required TResult Function(AddBankCardResponse data) successAdd,
    required TResult Function(CardsModel cards) successCards,
    required TResult Function() loadingRemove,
    required TResult Function() successRemove,
    required TResult Function() updateData,
    required TResult Function(String message) failed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PaymentMethod paymentMethod)? successPaymentMehods,
    TResult? Function(AddBankCardResponse data)? successAdd,
    TResult? Function(CardsModel cards)? successCards,
    TResult? Function()? loadingRemove,
    TResult? Function()? successRemove,
    TResult? Function()? updateData,
    TResult? Function(String message)? failed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PaymentMethod paymentMethod)? successPaymentMehods,
    TResult Function(AddBankCardResponse data)? successAdd,
    TResult Function(CardsModel cards)? successCards,
    TResult Function()? loadingRemove,
    TResult Function()? successRemove,
    TResult Function()? updateData,
    TResult Function(String message)? failed,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_SuccessPaymentMehods value) successPaymentMehods,
    required TResult Function(_SuccessAdd value) successAdd,
    required TResult Function(_SuccessCards value) successCards,
    required TResult Function(_LoadingRemove value) loadingRemove,
    required TResult Function(_SuccessRemove value) successRemove,
    required TResult Function(_UpdateData value) updateData,
    required TResult Function(_Failed value) failed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SuccessPaymentMehods value)? successPaymentMehods,
    TResult? Function(_SuccessAdd value)? successAdd,
    TResult? Function(_SuccessCards value)? successCards,
    TResult? Function(_LoadingRemove value)? loadingRemove,
    TResult? Function(_SuccessRemove value)? successRemove,
    TResult? Function(_UpdateData value)? updateData,
    TResult? Function(_Failed value)? failed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SuccessPaymentMehods value)? successPaymentMehods,
    TResult Function(_SuccessAdd value)? successAdd,
    TResult Function(_SuccessCards value)? successCards,
    TResult Function(_LoadingRemove value)? loadingRemove,
    TResult Function(_SuccessRemove value)? successRemove,
    TResult Function(_UpdateData value)? updateData,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements BankCartState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$BankCartStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'BankCartState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PaymentMethod paymentMethod) successPaymentMehods,
    required TResult Function(AddBankCardResponse data) successAdd,
    required TResult Function(CardsModel cards) successCards,
    required TResult Function() loadingRemove,
    required TResult Function() successRemove,
    required TResult Function() updateData,
    required TResult Function(String message) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PaymentMethod paymentMethod)? successPaymentMehods,
    TResult? Function(AddBankCardResponse data)? successAdd,
    TResult? Function(CardsModel cards)? successCards,
    TResult? Function()? loadingRemove,
    TResult? Function()? successRemove,
    TResult? Function()? updateData,
    TResult? Function(String message)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PaymentMethod paymentMethod)? successPaymentMehods,
    TResult Function(AddBankCardResponse data)? successAdd,
    TResult Function(CardsModel cards)? successCards,
    TResult Function()? loadingRemove,
    TResult Function()? successRemove,
    TResult Function()? updateData,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SuccessPaymentMehods value) successPaymentMehods,
    required TResult Function(_SuccessAdd value) successAdd,
    required TResult Function(_SuccessCards value) successCards,
    required TResult Function(_LoadingRemove value) loadingRemove,
    required TResult Function(_SuccessRemove value) successRemove,
    required TResult Function(_UpdateData value) updateData,
    required TResult Function(_Failed value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SuccessPaymentMehods value)? successPaymentMehods,
    TResult? Function(_SuccessAdd value)? successAdd,
    TResult? Function(_SuccessCards value)? successCards,
    TResult? Function(_LoadingRemove value)? loadingRemove,
    TResult? Function(_SuccessRemove value)? successRemove,
    TResult? Function(_UpdateData value)? updateData,
    TResult? Function(_Failed value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SuccessPaymentMehods value)? successPaymentMehods,
    TResult Function(_SuccessAdd value)? successAdd,
    TResult Function(_SuccessCards value)? successCards,
    TResult Function(_LoadingRemove value)? loadingRemove,
    TResult Function(_SuccessRemove value)? successRemove,
    TResult Function(_UpdateData value)? updateData,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements BankCartState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessPaymentMehodsImplCopyWith<$Res> {
  factory _$$SuccessPaymentMehodsImplCopyWith(_$SuccessPaymentMehodsImpl value,
          $Res Function(_$SuccessPaymentMehodsImpl) then) =
      __$$SuccessPaymentMehodsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PaymentMethod paymentMethod});
}

/// @nodoc
class __$$SuccessPaymentMehodsImplCopyWithImpl<$Res>
    extends _$BankCartStateCopyWithImpl<$Res, _$SuccessPaymentMehodsImpl>
    implements _$$SuccessPaymentMehodsImplCopyWith<$Res> {
  __$$SuccessPaymentMehodsImplCopyWithImpl(_$SuccessPaymentMehodsImpl _value,
      $Res Function(_$SuccessPaymentMehodsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentMethod = null,
  }) {
    return _then(_$SuccessPaymentMehodsImpl(
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
    ));
  }
}

/// @nodoc

class _$SuccessPaymentMehodsImpl implements _SuccessPaymentMehods {
  const _$SuccessPaymentMehodsImpl({required this.paymentMethod});

  @override
  final PaymentMethod paymentMethod;

  @override
  String toString() {
    return 'BankCartState.successPaymentMehods(paymentMethod: $paymentMethod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessPaymentMehodsImpl &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paymentMethod);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessPaymentMehodsImplCopyWith<_$SuccessPaymentMehodsImpl>
      get copyWith =>
          __$$SuccessPaymentMehodsImplCopyWithImpl<_$SuccessPaymentMehodsImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PaymentMethod paymentMethod) successPaymentMehods,
    required TResult Function(AddBankCardResponse data) successAdd,
    required TResult Function(CardsModel cards) successCards,
    required TResult Function() loadingRemove,
    required TResult Function() successRemove,
    required TResult Function() updateData,
    required TResult Function(String message) failed,
  }) {
    return successPaymentMehods(paymentMethod);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PaymentMethod paymentMethod)? successPaymentMehods,
    TResult? Function(AddBankCardResponse data)? successAdd,
    TResult? Function(CardsModel cards)? successCards,
    TResult? Function()? loadingRemove,
    TResult? Function()? successRemove,
    TResult? Function()? updateData,
    TResult? Function(String message)? failed,
  }) {
    return successPaymentMehods?.call(paymentMethod);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PaymentMethod paymentMethod)? successPaymentMehods,
    TResult Function(AddBankCardResponse data)? successAdd,
    TResult Function(CardsModel cards)? successCards,
    TResult Function()? loadingRemove,
    TResult Function()? successRemove,
    TResult Function()? updateData,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (successPaymentMehods != null) {
      return successPaymentMehods(paymentMethod);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SuccessPaymentMehods value) successPaymentMehods,
    required TResult Function(_SuccessAdd value) successAdd,
    required TResult Function(_SuccessCards value) successCards,
    required TResult Function(_LoadingRemove value) loadingRemove,
    required TResult Function(_SuccessRemove value) successRemove,
    required TResult Function(_UpdateData value) updateData,
    required TResult Function(_Failed value) failed,
  }) {
    return successPaymentMehods(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SuccessPaymentMehods value)? successPaymentMehods,
    TResult? Function(_SuccessAdd value)? successAdd,
    TResult? Function(_SuccessCards value)? successCards,
    TResult? Function(_LoadingRemove value)? loadingRemove,
    TResult? Function(_SuccessRemove value)? successRemove,
    TResult? Function(_UpdateData value)? updateData,
    TResult? Function(_Failed value)? failed,
  }) {
    return successPaymentMehods?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SuccessPaymentMehods value)? successPaymentMehods,
    TResult Function(_SuccessAdd value)? successAdd,
    TResult Function(_SuccessCards value)? successCards,
    TResult Function(_LoadingRemove value)? loadingRemove,
    TResult Function(_SuccessRemove value)? successRemove,
    TResult Function(_UpdateData value)? updateData,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (successPaymentMehods != null) {
      return successPaymentMehods(this);
    }
    return orElse();
  }
}

abstract class _SuccessPaymentMehods implements BankCartState {
  const factory _SuccessPaymentMehods(
          {required final PaymentMethod paymentMethod}) =
      _$SuccessPaymentMehodsImpl;

  PaymentMethod get paymentMethod;
  @JsonKey(ignore: true)
  _$$SuccessPaymentMehodsImplCopyWith<_$SuccessPaymentMehodsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessAddImplCopyWith<$Res> {
  factory _$$SuccessAddImplCopyWith(
          _$SuccessAddImpl value, $Res Function(_$SuccessAddImpl) then) =
      __$$SuccessAddImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AddBankCardResponse data});
}

/// @nodoc
class __$$SuccessAddImplCopyWithImpl<$Res>
    extends _$BankCartStateCopyWithImpl<$Res, _$SuccessAddImpl>
    implements _$$SuccessAddImplCopyWith<$Res> {
  __$$SuccessAddImplCopyWithImpl(
      _$SuccessAddImpl _value, $Res Function(_$SuccessAddImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$SuccessAddImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AddBankCardResponse,
    ));
  }
}

/// @nodoc

class _$SuccessAddImpl implements _SuccessAdd {
  const _$SuccessAddImpl({required this.data});

  @override
  final AddBankCardResponse data;

  @override
  String toString() {
    return 'BankCartState.successAdd(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessAddImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessAddImplCopyWith<_$SuccessAddImpl> get copyWith =>
      __$$SuccessAddImplCopyWithImpl<_$SuccessAddImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PaymentMethod paymentMethod) successPaymentMehods,
    required TResult Function(AddBankCardResponse data) successAdd,
    required TResult Function(CardsModel cards) successCards,
    required TResult Function() loadingRemove,
    required TResult Function() successRemove,
    required TResult Function() updateData,
    required TResult Function(String message) failed,
  }) {
    return successAdd(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PaymentMethod paymentMethod)? successPaymentMehods,
    TResult? Function(AddBankCardResponse data)? successAdd,
    TResult? Function(CardsModel cards)? successCards,
    TResult? Function()? loadingRemove,
    TResult? Function()? successRemove,
    TResult? Function()? updateData,
    TResult? Function(String message)? failed,
  }) {
    return successAdd?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PaymentMethod paymentMethod)? successPaymentMehods,
    TResult Function(AddBankCardResponse data)? successAdd,
    TResult Function(CardsModel cards)? successCards,
    TResult Function()? loadingRemove,
    TResult Function()? successRemove,
    TResult Function()? updateData,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (successAdd != null) {
      return successAdd(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SuccessPaymentMehods value) successPaymentMehods,
    required TResult Function(_SuccessAdd value) successAdd,
    required TResult Function(_SuccessCards value) successCards,
    required TResult Function(_LoadingRemove value) loadingRemove,
    required TResult Function(_SuccessRemove value) successRemove,
    required TResult Function(_UpdateData value) updateData,
    required TResult Function(_Failed value) failed,
  }) {
    return successAdd(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SuccessPaymentMehods value)? successPaymentMehods,
    TResult? Function(_SuccessAdd value)? successAdd,
    TResult? Function(_SuccessCards value)? successCards,
    TResult? Function(_LoadingRemove value)? loadingRemove,
    TResult? Function(_SuccessRemove value)? successRemove,
    TResult? Function(_UpdateData value)? updateData,
    TResult? Function(_Failed value)? failed,
  }) {
    return successAdd?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SuccessPaymentMehods value)? successPaymentMehods,
    TResult Function(_SuccessAdd value)? successAdd,
    TResult Function(_SuccessCards value)? successCards,
    TResult Function(_LoadingRemove value)? loadingRemove,
    TResult Function(_SuccessRemove value)? successRemove,
    TResult Function(_UpdateData value)? updateData,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (successAdd != null) {
      return successAdd(this);
    }
    return orElse();
  }
}

abstract class _SuccessAdd implements BankCartState {
  const factory _SuccessAdd({required final AddBankCardResponse data}) =
      _$SuccessAddImpl;

  AddBankCardResponse get data;
  @JsonKey(ignore: true)
  _$$SuccessAddImplCopyWith<_$SuccessAddImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessCardsImplCopyWith<$Res> {
  factory _$$SuccessCardsImplCopyWith(
          _$SuccessCardsImpl value, $Res Function(_$SuccessCardsImpl) then) =
      __$$SuccessCardsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CardsModel cards});
}

/// @nodoc
class __$$SuccessCardsImplCopyWithImpl<$Res>
    extends _$BankCartStateCopyWithImpl<$Res, _$SuccessCardsImpl>
    implements _$$SuccessCardsImplCopyWith<$Res> {
  __$$SuccessCardsImplCopyWithImpl(
      _$SuccessCardsImpl _value, $Res Function(_$SuccessCardsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cards = null,
  }) {
    return _then(_$SuccessCardsImpl(
      cards: null == cards
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as CardsModel,
    ));
  }
}

/// @nodoc

class _$SuccessCardsImpl implements _SuccessCards {
  const _$SuccessCardsImpl({required this.cards});

  @override
  final CardsModel cards;

  @override
  String toString() {
    return 'BankCartState.successCards(cards: $cards)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessCardsImpl &&
            (identical(other.cards, cards) || other.cards == cards));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cards);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessCardsImplCopyWith<_$SuccessCardsImpl> get copyWith =>
      __$$SuccessCardsImplCopyWithImpl<_$SuccessCardsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PaymentMethod paymentMethod) successPaymentMehods,
    required TResult Function(AddBankCardResponse data) successAdd,
    required TResult Function(CardsModel cards) successCards,
    required TResult Function() loadingRemove,
    required TResult Function() successRemove,
    required TResult Function() updateData,
    required TResult Function(String message) failed,
  }) {
    return successCards(cards);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PaymentMethod paymentMethod)? successPaymentMehods,
    TResult? Function(AddBankCardResponse data)? successAdd,
    TResult? Function(CardsModel cards)? successCards,
    TResult? Function()? loadingRemove,
    TResult? Function()? successRemove,
    TResult? Function()? updateData,
    TResult? Function(String message)? failed,
  }) {
    return successCards?.call(cards);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PaymentMethod paymentMethod)? successPaymentMehods,
    TResult Function(AddBankCardResponse data)? successAdd,
    TResult Function(CardsModel cards)? successCards,
    TResult Function()? loadingRemove,
    TResult Function()? successRemove,
    TResult Function()? updateData,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (successCards != null) {
      return successCards(cards);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SuccessPaymentMehods value) successPaymentMehods,
    required TResult Function(_SuccessAdd value) successAdd,
    required TResult Function(_SuccessCards value) successCards,
    required TResult Function(_LoadingRemove value) loadingRemove,
    required TResult Function(_SuccessRemove value) successRemove,
    required TResult Function(_UpdateData value) updateData,
    required TResult Function(_Failed value) failed,
  }) {
    return successCards(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SuccessPaymentMehods value)? successPaymentMehods,
    TResult? Function(_SuccessAdd value)? successAdd,
    TResult? Function(_SuccessCards value)? successCards,
    TResult? Function(_LoadingRemove value)? loadingRemove,
    TResult? Function(_SuccessRemove value)? successRemove,
    TResult? Function(_UpdateData value)? updateData,
    TResult? Function(_Failed value)? failed,
  }) {
    return successCards?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SuccessPaymentMehods value)? successPaymentMehods,
    TResult Function(_SuccessAdd value)? successAdd,
    TResult Function(_SuccessCards value)? successCards,
    TResult Function(_LoadingRemove value)? loadingRemove,
    TResult Function(_SuccessRemove value)? successRemove,
    TResult Function(_UpdateData value)? updateData,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (successCards != null) {
      return successCards(this);
    }
    return orElse();
  }
}

abstract class _SuccessCards implements BankCartState {
  const factory _SuccessCards({required final CardsModel cards}) =
      _$SuccessCardsImpl;

  CardsModel get cards;
  @JsonKey(ignore: true)
  _$$SuccessCardsImplCopyWith<_$SuccessCardsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingRemoveImplCopyWith<$Res> {
  factory _$$LoadingRemoveImplCopyWith(
          _$LoadingRemoveImpl value, $Res Function(_$LoadingRemoveImpl) then) =
      __$$LoadingRemoveImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingRemoveImplCopyWithImpl<$Res>
    extends _$BankCartStateCopyWithImpl<$Res, _$LoadingRemoveImpl>
    implements _$$LoadingRemoveImplCopyWith<$Res> {
  __$$LoadingRemoveImplCopyWithImpl(
      _$LoadingRemoveImpl _value, $Res Function(_$LoadingRemoveImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingRemoveImpl implements _LoadingRemove {
  const _$LoadingRemoveImpl();

  @override
  String toString() {
    return 'BankCartState.loadingRemove()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingRemoveImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PaymentMethod paymentMethod) successPaymentMehods,
    required TResult Function(AddBankCardResponse data) successAdd,
    required TResult Function(CardsModel cards) successCards,
    required TResult Function() loadingRemove,
    required TResult Function() successRemove,
    required TResult Function() updateData,
    required TResult Function(String message) failed,
  }) {
    return loadingRemove();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PaymentMethod paymentMethod)? successPaymentMehods,
    TResult? Function(AddBankCardResponse data)? successAdd,
    TResult? Function(CardsModel cards)? successCards,
    TResult? Function()? loadingRemove,
    TResult? Function()? successRemove,
    TResult? Function()? updateData,
    TResult? Function(String message)? failed,
  }) {
    return loadingRemove?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PaymentMethod paymentMethod)? successPaymentMehods,
    TResult Function(AddBankCardResponse data)? successAdd,
    TResult Function(CardsModel cards)? successCards,
    TResult Function()? loadingRemove,
    TResult Function()? successRemove,
    TResult Function()? updateData,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (loadingRemove != null) {
      return loadingRemove();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SuccessPaymentMehods value) successPaymentMehods,
    required TResult Function(_SuccessAdd value) successAdd,
    required TResult Function(_SuccessCards value) successCards,
    required TResult Function(_LoadingRemove value) loadingRemove,
    required TResult Function(_SuccessRemove value) successRemove,
    required TResult Function(_UpdateData value) updateData,
    required TResult Function(_Failed value) failed,
  }) {
    return loadingRemove(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SuccessPaymentMehods value)? successPaymentMehods,
    TResult? Function(_SuccessAdd value)? successAdd,
    TResult? Function(_SuccessCards value)? successCards,
    TResult? Function(_LoadingRemove value)? loadingRemove,
    TResult? Function(_SuccessRemove value)? successRemove,
    TResult? Function(_UpdateData value)? updateData,
    TResult? Function(_Failed value)? failed,
  }) {
    return loadingRemove?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SuccessPaymentMehods value)? successPaymentMehods,
    TResult Function(_SuccessAdd value)? successAdd,
    TResult Function(_SuccessCards value)? successCards,
    TResult Function(_LoadingRemove value)? loadingRemove,
    TResult Function(_SuccessRemove value)? successRemove,
    TResult Function(_UpdateData value)? updateData,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (loadingRemove != null) {
      return loadingRemove(this);
    }
    return orElse();
  }
}

abstract class _LoadingRemove implements BankCartState {
  const factory _LoadingRemove() = _$LoadingRemoveImpl;
}

/// @nodoc
abstract class _$$SuccessRemoveImplCopyWith<$Res> {
  factory _$$SuccessRemoveImplCopyWith(
          _$SuccessRemoveImpl value, $Res Function(_$SuccessRemoveImpl) then) =
      __$$SuccessRemoveImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessRemoveImplCopyWithImpl<$Res>
    extends _$BankCartStateCopyWithImpl<$Res, _$SuccessRemoveImpl>
    implements _$$SuccessRemoveImplCopyWith<$Res> {
  __$$SuccessRemoveImplCopyWithImpl(
      _$SuccessRemoveImpl _value, $Res Function(_$SuccessRemoveImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuccessRemoveImpl implements _SuccessRemove {
  const _$SuccessRemoveImpl();

  @override
  String toString() {
    return 'BankCartState.successRemove()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessRemoveImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PaymentMethod paymentMethod) successPaymentMehods,
    required TResult Function(AddBankCardResponse data) successAdd,
    required TResult Function(CardsModel cards) successCards,
    required TResult Function() loadingRemove,
    required TResult Function() successRemove,
    required TResult Function() updateData,
    required TResult Function(String message) failed,
  }) {
    return successRemove();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PaymentMethod paymentMethod)? successPaymentMehods,
    TResult? Function(AddBankCardResponse data)? successAdd,
    TResult? Function(CardsModel cards)? successCards,
    TResult? Function()? loadingRemove,
    TResult? Function()? successRemove,
    TResult? Function()? updateData,
    TResult? Function(String message)? failed,
  }) {
    return successRemove?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PaymentMethod paymentMethod)? successPaymentMehods,
    TResult Function(AddBankCardResponse data)? successAdd,
    TResult Function(CardsModel cards)? successCards,
    TResult Function()? loadingRemove,
    TResult Function()? successRemove,
    TResult Function()? updateData,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (successRemove != null) {
      return successRemove();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SuccessPaymentMehods value) successPaymentMehods,
    required TResult Function(_SuccessAdd value) successAdd,
    required TResult Function(_SuccessCards value) successCards,
    required TResult Function(_LoadingRemove value) loadingRemove,
    required TResult Function(_SuccessRemove value) successRemove,
    required TResult Function(_UpdateData value) updateData,
    required TResult Function(_Failed value) failed,
  }) {
    return successRemove(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SuccessPaymentMehods value)? successPaymentMehods,
    TResult? Function(_SuccessAdd value)? successAdd,
    TResult? Function(_SuccessCards value)? successCards,
    TResult? Function(_LoadingRemove value)? loadingRemove,
    TResult? Function(_SuccessRemove value)? successRemove,
    TResult? Function(_UpdateData value)? updateData,
    TResult? Function(_Failed value)? failed,
  }) {
    return successRemove?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SuccessPaymentMehods value)? successPaymentMehods,
    TResult Function(_SuccessAdd value)? successAdd,
    TResult Function(_SuccessCards value)? successCards,
    TResult Function(_LoadingRemove value)? loadingRemove,
    TResult Function(_SuccessRemove value)? successRemove,
    TResult Function(_UpdateData value)? updateData,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (successRemove != null) {
      return successRemove(this);
    }
    return orElse();
  }
}

abstract class _SuccessRemove implements BankCartState {
  const factory _SuccessRemove() = _$SuccessRemoveImpl;
}

/// @nodoc
abstract class _$$UpdateDataImplCopyWith<$Res> {
  factory _$$UpdateDataImplCopyWith(
          _$UpdateDataImpl value, $Res Function(_$UpdateDataImpl) then) =
      __$$UpdateDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdateDataImplCopyWithImpl<$Res>
    extends _$BankCartStateCopyWithImpl<$Res, _$UpdateDataImpl>
    implements _$$UpdateDataImplCopyWith<$Res> {
  __$$UpdateDataImplCopyWithImpl(
      _$UpdateDataImpl _value, $Res Function(_$UpdateDataImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UpdateDataImpl implements _UpdateData {
  const _$UpdateDataImpl();

  @override
  String toString() {
    return 'BankCartState.updateData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UpdateDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PaymentMethod paymentMethod) successPaymentMehods,
    required TResult Function(AddBankCardResponse data) successAdd,
    required TResult Function(CardsModel cards) successCards,
    required TResult Function() loadingRemove,
    required TResult Function() successRemove,
    required TResult Function() updateData,
    required TResult Function(String message) failed,
  }) {
    return updateData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PaymentMethod paymentMethod)? successPaymentMehods,
    TResult? Function(AddBankCardResponse data)? successAdd,
    TResult? Function(CardsModel cards)? successCards,
    TResult? Function()? loadingRemove,
    TResult? Function()? successRemove,
    TResult? Function()? updateData,
    TResult? Function(String message)? failed,
  }) {
    return updateData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PaymentMethod paymentMethod)? successPaymentMehods,
    TResult Function(AddBankCardResponse data)? successAdd,
    TResult Function(CardsModel cards)? successCards,
    TResult Function()? loadingRemove,
    TResult Function()? successRemove,
    TResult Function()? updateData,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (updateData != null) {
      return updateData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SuccessPaymentMehods value) successPaymentMehods,
    required TResult Function(_SuccessAdd value) successAdd,
    required TResult Function(_SuccessCards value) successCards,
    required TResult Function(_LoadingRemove value) loadingRemove,
    required TResult Function(_SuccessRemove value) successRemove,
    required TResult Function(_UpdateData value) updateData,
    required TResult Function(_Failed value) failed,
  }) {
    return updateData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SuccessPaymentMehods value)? successPaymentMehods,
    TResult? Function(_SuccessAdd value)? successAdd,
    TResult? Function(_SuccessCards value)? successCards,
    TResult? Function(_LoadingRemove value)? loadingRemove,
    TResult? Function(_SuccessRemove value)? successRemove,
    TResult? Function(_UpdateData value)? updateData,
    TResult? Function(_Failed value)? failed,
  }) {
    return updateData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SuccessPaymentMehods value)? successPaymentMehods,
    TResult Function(_SuccessAdd value)? successAdd,
    TResult Function(_SuccessCards value)? successCards,
    TResult Function(_LoadingRemove value)? loadingRemove,
    TResult Function(_SuccessRemove value)? successRemove,
    TResult Function(_UpdateData value)? updateData,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (updateData != null) {
      return updateData(this);
    }
    return orElse();
  }
}

abstract class _UpdateData implements BankCartState {
  const factory _UpdateData() = _$UpdateDataImpl;
}

/// @nodoc
abstract class _$$FailedImplCopyWith<$Res> {
  factory _$$FailedImplCopyWith(
          _$FailedImpl value, $Res Function(_$FailedImpl) then) =
      __$$FailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FailedImplCopyWithImpl<$Res>
    extends _$BankCartStateCopyWithImpl<$Res, _$FailedImpl>
    implements _$$FailedImplCopyWith<$Res> {
  __$$FailedImplCopyWithImpl(
      _$FailedImpl _value, $Res Function(_$FailedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FailedImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailedImpl implements _Failed {
  const _$FailedImpl({this.message = 'Произошла ошибка'});

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'BankCartState.failed(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      __$$FailedImplCopyWithImpl<_$FailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PaymentMethod paymentMethod) successPaymentMehods,
    required TResult Function(AddBankCardResponse data) successAdd,
    required TResult Function(CardsModel cards) successCards,
    required TResult Function() loadingRemove,
    required TResult Function() successRemove,
    required TResult Function() updateData,
    required TResult Function(String message) failed,
  }) {
    return failed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PaymentMethod paymentMethod)? successPaymentMehods,
    TResult? Function(AddBankCardResponse data)? successAdd,
    TResult? Function(CardsModel cards)? successCards,
    TResult? Function()? loadingRemove,
    TResult? Function()? successRemove,
    TResult? Function()? updateData,
    TResult? Function(String message)? failed,
  }) {
    return failed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PaymentMethod paymentMethod)? successPaymentMehods,
    TResult Function(AddBankCardResponse data)? successAdd,
    TResult Function(CardsModel cards)? successCards,
    TResult Function()? loadingRemove,
    TResult Function()? successRemove,
    TResult Function()? updateData,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SuccessPaymentMehods value) successPaymentMehods,
    required TResult Function(_SuccessAdd value) successAdd,
    required TResult Function(_SuccessCards value) successCards,
    required TResult Function(_LoadingRemove value) loadingRemove,
    required TResult Function(_SuccessRemove value) successRemove,
    required TResult Function(_UpdateData value) updateData,
    required TResult Function(_Failed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SuccessPaymentMehods value)? successPaymentMehods,
    TResult? Function(_SuccessAdd value)? successAdd,
    TResult? Function(_SuccessCards value)? successCards,
    TResult? Function(_LoadingRemove value)? loadingRemove,
    TResult? Function(_SuccessRemove value)? successRemove,
    TResult? Function(_UpdateData value)? updateData,
    TResult? Function(_Failed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SuccessPaymentMehods value)? successPaymentMehods,
    TResult Function(_SuccessAdd value)? successAdd,
    TResult Function(_SuccessCards value)? successCards,
    TResult Function(_LoadingRemove value)? loadingRemove,
    TResult Function(_SuccessRemove value)? successRemove,
    TResult Function(_UpdateData value)? updateData,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _Failed implements BankCartState {
  const factory _Failed({final String message}) = _$FailedImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
