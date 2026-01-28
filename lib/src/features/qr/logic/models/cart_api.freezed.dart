// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_api.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CartApi {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, AddCartRequest body) addCart,
    required TResult Function() getCart,
    required TResult Function(ItemRequests data) updateItem,
    required TResult Function(CartItemsRequests body) deleteItems,
    required TResult Function(CartItemsRequests body) createOrders,
    required TResult Function(CheckoutRequests data) fetchChekout,
    required TResult Function(String id) fetchChekoutSubscription,
    required TResult Function(MenuCheckoutRequest body) fetchChekoutMenu,
    required TResult Function(PayRequest body) payByCart,
    required TResult Function(BonusRequest body) payBonus,
    required TResult Function(MenuCheckoutRequest body) payMenu,
    required TResult Function(CheckPromoRequest body) checkPromoCode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, AddCartRequest body)? addCart,
    TResult? Function()? getCart,
    TResult? Function(ItemRequests data)? updateItem,
    TResult? Function(CartItemsRequests body)? deleteItems,
    TResult? Function(CartItemsRequests body)? createOrders,
    TResult? Function(CheckoutRequests data)? fetchChekout,
    TResult? Function(String id)? fetchChekoutSubscription,
    TResult? Function(MenuCheckoutRequest body)? fetchChekoutMenu,
    TResult? Function(PayRequest body)? payByCart,
    TResult? Function(BonusRequest body)? payBonus,
    TResult? Function(MenuCheckoutRequest body)? payMenu,
    TResult? Function(CheckPromoRequest body)? checkPromoCode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, AddCartRequest body)? addCart,
    TResult Function()? getCart,
    TResult Function(ItemRequests data)? updateItem,
    TResult Function(CartItemsRequests body)? deleteItems,
    TResult Function(CartItemsRequests body)? createOrders,
    TResult Function(CheckoutRequests data)? fetchChekout,
    TResult Function(String id)? fetchChekoutSubscription,
    TResult Function(MenuCheckoutRequest body)? fetchChekoutMenu,
    TResult Function(PayRequest body)? payByCart,
    TResult Function(BonusRequest body)? payBonus,
    TResult Function(MenuCheckoutRequest body)? payMenu,
    TResult Function(CheckPromoRequest body)? checkPromoCode,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddCart value) addCart,
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_UpdateItem value) updateItem,
    required TResult Function(_DeleteItems value) deleteItems,
    required TResult Function(_CreateOrders value) createOrders,
    required TResult Function(_FetchChekout value) fetchChekout,
    required TResult Function(_FetchChekoutSubscription value)
        fetchChekoutSubscription,
    required TResult Function(_FetchChekoutMenu value) fetchChekoutMenu,
    required TResult Function(_PayByCart value) payByCart,
    required TResult Function(_PayBonus value) payBonus,
    required TResult Function(_PayMenu value) payMenu,
    required TResult Function(_CheckPromoCode value) checkPromoCode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddCart value)? addCart,
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_UpdateItem value)? updateItem,
    TResult? Function(_DeleteItems value)? deleteItems,
    TResult? Function(_CreateOrders value)? createOrders,
    TResult? Function(_FetchChekout value)? fetchChekout,
    TResult? Function(_FetchChekoutSubscription value)?
        fetchChekoutSubscription,
    TResult? Function(_FetchChekoutMenu value)? fetchChekoutMenu,
    TResult? Function(_PayByCart value)? payByCart,
    TResult? Function(_PayBonus value)? payBonus,
    TResult? Function(_PayMenu value)? payMenu,
    TResult? Function(_CheckPromoCode value)? checkPromoCode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddCart value)? addCart,
    TResult Function(_GetCart value)? getCart,
    TResult Function(_UpdateItem value)? updateItem,
    TResult Function(_DeleteItems value)? deleteItems,
    TResult Function(_CreateOrders value)? createOrders,
    TResult Function(_FetchChekout value)? fetchChekout,
    TResult Function(_FetchChekoutSubscription value)? fetchChekoutSubscription,
    TResult Function(_FetchChekoutMenu value)? fetchChekoutMenu,
    TResult Function(_PayByCart value)? payByCart,
    TResult Function(_PayBonus value)? payBonus,
    TResult Function(_PayMenu value)? payMenu,
    TResult Function(_CheckPromoCode value)? checkPromoCode,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartApiCopyWith<$Res> {
  factory $CartApiCopyWith(CartApi value, $Res Function(CartApi) then) =
      _$CartApiCopyWithImpl<$Res, CartApi>;
}

/// @nodoc
class _$CartApiCopyWithImpl<$Res, $Val extends CartApi>
    implements $CartApiCopyWith<$Res> {
  _$CartApiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AddCartImplCopyWith<$Res> {
  factory _$$AddCartImplCopyWith(
          _$AddCartImpl value, $Res Function(_$AddCartImpl) then) =
      __$$AddCartImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, AddCartRequest body});
}

/// @nodoc
class __$$AddCartImplCopyWithImpl<$Res>
    extends _$CartApiCopyWithImpl<$Res, _$AddCartImpl>
    implements _$$AddCartImplCopyWith<$Res> {
  __$$AddCartImplCopyWithImpl(
      _$AddCartImpl _value, $Res Function(_$AddCartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? body = null,
  }) {
    return _then(_$AddCartImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as AddCartRequest,
    ));
  }
}

/// @nodoc

class _$AddCartImpl extends _AddCart {
  const _$AddCartImpl({required this.id, required this.body}) : super._();

  @override
  final int id;
  @override
  final AddCartRequest body;

  @override
  String toString() {
    return 'CartApi.addCart(id: $id, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddCartImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.body, body) || other.body == body));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddCartImplCopyWith<_$AddCartImpl> get copyWith =>
      __$$AddCartImplCopyWithImpl<_$AddCartImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, AddCartRequest body) addCart,
    required TResult Function() getCart,
    required TResult Function(ItemRequests data) updateItem,
    required TResult Function(CartItemsRequests body) deleteItems,
    required TResult Function(CartItemsRequests body) createOrders,
    required TResult Function(CheckoutRequests data) fetchChekout,
    required TResult Function(String id) fetchChekoutSubscription,
    required TResult Function(MenuCheckoutRequest body) fetchChekoutMenu,
    required TResult Function(PayRequest body) payByCart,
    required TResult Function(BonusRequest body) payBonus,
    required TResult Function(MenuCheckoutRequest body) payMenu,
    required TResult Function(CheckPromoRequest body) checkPromoCode,
  }) {
    return addCart(id, body);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, AddCartRequest body)? addCart,
    TResult? Function()? getCart,
    TResult? Function(ItemRequests data)? updateItem,
    TResult? Function(CartItemsRequests body)? deleteItems,
    TResult? Function(CartItemsRequests body)? createOrders,
    TResult? Function(CheckoutRequests data)? fetchChekout,
    TResult? Function(String id)? fetchChekoutSubscription,
    TResult? Function(MenuCheckoutRequest body)? fetchChekoutMenu,
    TResult? Function(PayRequest body)? payByCart,
    TResult? Function(BonusRequest body)? payBonus,
    TResult? Function(MenuCheckoutRequest body)? payMenu,
    TResult? Function(CheckPromoRequest body)? checkPromoCode,
  }) {
    return addCart?.call(id, body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, AddCartRequest body)? addCart,
    TResult Function()? getCart,
    TResult Function(ItemRequests data)? updateItem,
    TResult Function(CartItemsRequests body)? deleteItems,
    TResult Function(CartItemsRequests body)? createOrders,
    TResult Function(CheckoutRequests data)? fetchChekout,
    TResult Function(String id)? fetchChekoutSubscription,
    TResult Function(MenuCheckoutRequest body)? fetchChekoutMenu,
    TResult Function(PayRequest body)? payByCart,
    TResult Function(BonusRequest body)? payBonus,
    TResult Function(MenuCheckoutRequest body)? payMenu,
    TResult Function(CheckPromoRequest body)? checkPromoCode,
    required TResult orElse(),
  }) {
    if (addCart != null) {
      return addCart(id, body);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddCart value) addCart,
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_UpdateItem value) updateItem,
    required TResult Function(_DeleteItems value) deleteItems,
    required TResult Function(_CreateOrders value) createOrders,
    required TResult Function(_FetchChekout value) fetchChekout,
    required TResult Function(_FetchChekoutSubscription value)
        fetchChekoutSubscription,
    required TResult Function(_FetchChekoutMenu value) fetchChekoutMenu,
    required TResult Function(_PayByCart value) payByCart,
    required TResult Function(_PayBonus value) payBonus,
    required TResult Function(_PayMenu value) payMenu,
    required TResult Function(_CheckPromoCode value) checkPromoCode,
  }) {
    return addCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddCart value)? addCart,
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_UpdateItem value)? updateItem,
    TResult? Function(_DeleteItems value)? deleteItems,
    TResult? Function(_CreateOrders value)? createOrders,
    TResult? Function(_FetchChekout value)? fetchChekout,
    TResult? Function(_FetchChekoutSubscription value)?
        fetchChekoutSubscription,
    TResult? Function(_FetchChekoutMenu value)? fetchChekoutMenu,
    TResult? Function(_PayByCart value)? payByCart,
    TResult? Function(_PayBonus value)? payBonus,
    TResult? Function(_PayMenu value)? payMenu,
    TResult? Function(_CheckPromoCode value)? checkPromoCode,
  }) {
    return addCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddCart value)? addCart,
    TResult Function(_GetCart value)? getCart,
    TResult Function(_UpdateItem value)? updateItem,
    TResult Function(_DeleteItems value)? deleteItems,
    TResult Function(_CreateOrders value)? createOrders,
    TResult Function(_FetchChekout value)? fetchChekout,
    TResult Function(_FetchChekoutSubscription value)? fetchChekoutSubscription,
    TResult Function(_FetchChekoutMenu value)? fetchChekoutMenu,
    TResult Function(_PayByCart value)? payByCart,
    TResult Function(_PayBonus value)? payBonus,
    TResult Function(_PayMenu value)? payMenu,
    TResult Function(_CheckPromoCode value)? checkPromoCode,
    required TResult orElse(),
  }) {
    if (addCart != null) {
      return addCart(this);
    }
    return orElse();
  }
}

abstract class _AddCart extends CartApi {
  const factory _AddCart(
      {required final int id,
      required final AddCartRequest body}) = _$AddCartImpl;
  const _AddCart._() : super._();

  int get id;
  AddCartRequest get body;
  @JsonKey(ignore: true)
  _$$AddCartImplCopyWith<_$AddCartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetCartImplCopyWith<$Res> {
  factory _$$GetCartImplCopyWith(
          _$GetCartImpl value, $Res Function(_$GetCartImpl) then) =
      __$$GetCartImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetCartImplCopyWithImpl<$Res>
    extends _$CartApiCopyWithImpl<$Res, _$GetCartImpl>
    implements _$$GetCartImplCopyWith<$Res> {
  __$$GetCartImplCopyWithImpl(
      _$GetCartImpl _value, $Res Function(_$GetCartImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetCartImpl extends _GetCart {
  const _$GetCartImpl() : super._();

  @override
  String toString() {
    return 'CartApi.getCart()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetCartImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, AddCartRequest body) addCart,
    required TResult Function() getCart,
    required TResult Function(ItemRequests data) updateItem,
    required TResult Function(CartItemsRequests body) deleteItems,
    required TResult Function(CartItemsRequests body) createOrders,
    required TResult Function(CheckoutRequests data) fetchChekout,
    required TResult Function(String id) fetchChekoutSubscription,
    required TResult Function(MenuCheckoutRequest body) fetchChekoutMenu,
    required TResult Function(PayRequest body) payByCart,
    required TResult Function(BonusRequest body) payBonus,
    required TResult Function(MenuCheckoutRequest body) payMenu,
    required TResult Function(CheckPromoRequest body) checkPromoCode,
  }) {
    return getCart();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, AddCartRequest body)? addCart,
    TResult? Function()? getCart,
    TResult? Function(ItemRequests data)? updateItem,
    TResult? Function(CartItemsRequests body)? deleteItems,
    TResult? Function(CartItemsRequests body)? createOrders,
    TResult? Function(CheckoutRequests data)? fetchChekout,
    TResult? Function(String id)? fetchChekoutSubscription,
    TResult? Function(MenuCheckoutRequest body)? fetchChekoutMenu,
    TResult? Function(PayRequest body)? payByCart,
    TResult? Function(BonusRequest body)? payBonus,
    TResult? Function(MenuCheckoutRequest body)? payMenu,
    TResult? Function(CheckPromoRequest body)? checkPromoCode,
  }) {
    return getCart?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, AddCartRequest body)? addCart,
    TResult Function()? getCart,
    TResult Function(ItemRequests data)? updateItem,
    TResult Function(CartItemsRequests body)? deleteItems,
    TResult Function(CartItemsRequests body)? createOrders,
    TResult Function(CheckoutRequests data)? fetchChekout,
    TResult Function(String id)? fetchChekoutSubscription,
    TResult Function(MenuCheckoutRequest body)? fetchChekoutMenu,
    TResult Function(PayRequest body)? payByCart,
    TResult Function(BonusRequest body)? payBonus,
    TResult Function(MenuCheckoutRequest body)? payMenu,
    TResult Function(CheckPromoRequest body)? checkPromoCode,
    required TResult orElse(),
  }) {
    if (getCart != null) {
      return getCart();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddCart value) addCart,
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_UpdateItem value) updateItem,
    required TResult Function(_DeleteItems value) deleteItems,
    required TResult Function(_CreateOrders value) createOrders,
    required TResult Function(_FetchChekout value) fetchChekout,
    required TResult Function(_FetchChekoutSubscription value)
        fetchChekoutSubscription,
    required TResult Function(_FetchChekoutMenu value) fetchChekoutMenu,
    required TResult Function(_PayByCart value) payByCart,
    required TResult Function(_PayBonus value) payBonus,
    required TResult Function(_PayMenu value) payMenu,
    required TResult Function(_CheckPromoCode value) checkPromoCode,
  }) {
    return getCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddCart value)? addCart,
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_UpdateItem value)? updateItem,
    TResult? Function(_DeleteItems value)? deleteItems,
    TResult? Function(_CreateOrders value)? createOrders,
    TResult? Function(_FetchChekout value)? fetchChekout,
    TResult? Function(_FetchChekoutSubscription value)?
        fetchChekoutSubscription,
    TResult? Function(_FetchChekoutMenu value)? fetchChekoutMenu,
    TResult? Function(_PayByCart value)? payByCart,
    TResult? Function(_PayBonus value)? payBonus,
    TResult? Function(_PayMenu value)? payMenu,
    TResult? Function(_CheckPromoCode value)? checkPromoCode,
  }) {
    return getCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddCart value)? addCart,
    TResult Function(_GetCart value)? getCart,
    TResult Function(_UpdateItem value)? updateItem,
    TResult Function(_DeleteItems value)? deleteItems,
    TResult Function(_CreateOrders value)? createOrders,
    TResult Function(_FetchChekout value)? fetchChekout,
    TResult Function(_FetchChekoutSubscription value)? fetchChekoutSubscription,
    TResult Function(_FetchChekoutMenu value)? fetchChekoutMenu,
    TResult Function(_PayByCart value)? payByCart,
    TResult Function(_PayBonus value)? payBonus,
    TResult Function(_PayMenu value)? payMenu,
    TResult Function(_CheckPromoCode value)? checkPromoCode,
    required TResult orElse(),
  }) {
    if (getCart != null) {
      return getCart(this);
    }
    return orElse();
  }
}

abstract class _GetCart extends CartApi {
  const factory _GetCart() = _$GetCartImpl;
  const _GetCart._() : super._();
}

/// @nodoc
abstract class _$$UpdateItemImplCopyWith<$Res> {
  factory _$$UpdateItemImplCopyWith(
          _$UpdateItemImpl value, $Res Function(_$UpdateItemImpl) then) =
      __$$UpdateItemImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ItemRequests data});
}

/// @nodoc
class __$$UpdateItemImplCopyWithImpl<$Res>
    extends _$CartApiCopyWithImpl<$Res, _$UpdateItemImpl>
    implements _$$UpdateItemImplCopyWith<$Res> {
  __$$UpdateItemImplCopyWithImpl(
      _$UpdateItemImpl _value, $Res Function(_$UpdateItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$UpdateItemImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ItemRequests,
    ));
  }
}

/// @nodoc

class _$UpdateItemImpl extends _UpdateItem {
  const _$UpdateItemImpl({required this.data}) : super._();

  @override
  final ItemRequests data;

  @override
  String toString() {
    return 'CartApi.updateItem(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateItemImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateItemImplCopyWith<_$UpdateItemImpl> get copyWith =>
      __$$UpdateItemImplCopyWithImpl<_$UpdateItemImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, AddCartRequest body) addCart,
    required TResult Function() getCart,
    required TResult Function(ItemRequests data) updateItem,
    required TResult Function(CartItemsRequests body) deleteItems,
    required TResult Function(CartItemsRequests body) createOrders,
    required TResult Function(CheckoutRequests data) fetchChekout,
    required TResult Function(String id) fetchChekoutSubscription,
    required TResult Function(MenuCheckoutRequest body) fetchChekoutMenu,
    required TResult Function(PayRequest body) payByCart,
    required TResult Function(BonusRequest body) payBonus,
    required TResult Function(MenuCheckoutRequest body) payMenu,
    required TResult Function(CheckPromoRequest body) checkPromoCode,
  }) {
    return updateItem(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, AddCartRequest body)? addCart,
    TResult? Function()? getCart,
    TResult? Function(ItemRequests data)? updateItem,
    TResult? Function(CartItemsRequests body)? deleteItems,
    TResult? Function(CartItemsRequests body)? createOrders,
    TResult? Function(CheckoutRequests data)? fetchChekout,
    TResult? Function(String id)? fetchChekoutSubscription,
    TResult? Function(MenuCheckoutRequest body)? fetchChekoutMenu,
    TResult? Function(PayRequest body)? payByCart,
    TResult? Function(BonusRequest body)? payBonus,
    TResult? Function(MenuCheckoutRequest body)? payMenu,
    TResult? Function(CheckPromoRequest body)? checkPromoCode,
  }) {
    return updateItem?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, AddCartRequest body)? addCart,
    TResult Function()? getCart,
    TResult Function(ItemRequests data)? updateItem,
    TResult Function(CartItemsRequests body)? deleteItems,
    TResult Function(CartItemsRequests body)? createOrders,
    TResult Function(CheckoutRequests data)? fetchChekout,
    TResult Function(String id)? fetchChekoutSubscription,
    TResult Function(MenuCheckoutRequest body)? fetchChekoutMenu,
    TResult Function(PayRequest body)? payByCart,
    TResult Function(BonusRequest body)? payBonus,
    TResult Function(MenuCheckoutRequest body)? payMenu,
    TResult Function(CheckPromoRequest body)? checkPromoCode,
    required TResult orElse(),
  }) {
    if (updateItem != null) {
      return updateItem(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddCart value) addCart,
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_UpdateItem value) updateItem,
    required TResult Function(_DeleteItems value) deleteItems,
    required TResult Function(_CreateOrders value) createOrders,
    required TResult Function(_FetchChekout value) fetchChekout,
    required TResult Function(_FetchChekoutSubscription value)
        fetchChekoutSubscription,
    required TResult Function(_FetchChekoutMenu value) fetchChekoutMenu,
    required TResult Function(_PayByCart value) payByCart,
    required TResult Function(_PayBonus value) payBonus,
    required TResult Function(_PayMenu value) payMenu,
    required TResult Function(_CheckPromoCode value) checkPromoCode,
  }) {
    return updateItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddCart value)? addCart,
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_UpdateItem value)? updateItem,
    TResult? Function(_DeleteItems value)? deleteItems,
    TResult? Function(_CreateOrders value)? createOrders,
    TResult? Function(_FetchChekout value)? fetchChekout,
    TResult? Function(_FetchChekoutSubscription value)?
        fetchChekoutSubscription,
    TResult? Function(_FetchChekoutMenu value)? fetchChekoutMenu,
    TResult? Function(_PayByCart value)? payByCart,
    TResult? Function(_PayBonus value)? payBonus,
    TResult? Function(_PayMenu value)? payMenu,
    TResult? Function(_CheckPromoCode value)? checkPromoCode,
  }) {
    return updateItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddCart value)? addCart,
    TResult Function(_GetCart value)? getCart,
    TResult Function(_UpdateItem value)? updateItem,
    TResult Function(_DeleteItems value)? deleteItems,
    TResult Function(_CreateOrders value)? createOrders,
    TResult Function(_FetchChekout value)? fetchChekout,
    TResult Function(_FetchChekoutSubscription value)? fetchChekoutSubscription,
    TResult Function(_FetchChekoutMenu value)? fetchChekoutMenu,
    TResult Function(_PayByCart value)? payByCart,
    TResult Function(_PayBonus value)? payBonus,
    TResult Function(_PayMenu value)? payMenu,
    TResult Function(_CheckPromoCode value)? checkPromoCode,
    required TResult orElse(),
  }) {
    if (updateItem != null) {
      return updateItem(this);
    }
    return orElse();
  }
}

abstract class _UpdateItem extends CartApi {
  const factory _UpdateItem({required final ItemRequests data}) =
      _$UpdateItemImpl;
  const _UpdateItem._() : super._();

  ItemRequests get data;
  @JsonKey(ignore: true)
  _$$UpdateItemImplCopyWith<_$UpdateItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteItemsImplCopyWith<$Res> {
  factory _$$DeleteItemsImplCopyWith(
          _$DeleteItemsImpl value, $Res Function(_$DeleteItemsImpl) then) =
      __$$DeleteItemsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CartItemsRequests body});
}

/// @nodoc
class __$$DeleteItemsImplCopyWithImpl<$Res>
    extends _$CartApiCopyWithImpl<$Res, _$DeleteItemsImpl>
    implements _$$DeleteItemsImplCopyWith<$Res> {
  __$$DeleteItemsImplCopyWithImpl(
      _$DeleteItemsImpl _value, $Res Function(_$DeleteItemsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
  }) {
    return _then(_$DeleteItemsImpl(
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as CartItemsRequests,
    ));
  }
}

/// @nodoc

class _$DeleteItemsImpl extends _DeleteItems {
  const _$DeleteItemsImpl({required this.body}) : super._();

  @override
  final CartItemsRequests body;

  @override
  String toString() {
    return 'CartApi.deleteItems(body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteItemsImpl &&
            (identical(other.body, body) || other.body == body));
  }

  @override
  int get hashCode => Object.hash(runtimeType, body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteItemsImplCopyWith<_$DeleteItemsImpl> get copyWith =>
      __$$DeleteItemsImplCopyWithImpl<_$DeleteItemsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, AddCartRequest body) addCart,
    required TResult Function() getCart,
    required TResult Function(ItemRequests data) updateItem,
    required TResult Function(CartItemsRequests body) deleteItems,
    required TResult Function(CartItemsRequests body) createOrders,
    required TResult Function(CheckoutRequests data) fetchChekout,
    required TResult Function(String id) fetchChekoutSubscription,
    required TResult Function(MenuCheckoutRequest body) fetchChekoutMenu,
    required TResult Function(PayRequest body) payByCart,
    required TResult Function(BonusRequest body) payBonus,
    required TResult Function(MenuCheckoutRequest body) payMenu,
    required TResult Function(CheckPromoRequest body) checkPromoCode,
  }) {
    return deleteItems(body);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, AddCartRequest body)? addCart,
    TResult? Function()? getCart,
    TResult? Function(ItemRequests data)? updateItem,
    TResult? Function(CartItemsRequests body)? deleteItems,
    TResult? Function(CartItemsRequests body)? createOrders,
    TResult? Function(CheckoutRequests data)? fetchChekout,
    TResult? Function(String id)? fetchChekoutSubscription,
    TResult? Function(MenuCheckoutRequest body)? fetchChekoutMenu,
    TResult? Function(PayRequest body)? payByCart,
    TResult? Function(BonusRequest body)? payBonus,
    TResult? Function(MenuCheckoutRequest body)? payMenu,
    TResult? Function(CheckPromoRequest body)? checkPromoCode,
  }) {
    return deleteItems?.call(body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, AddCartRequest body)? addCart,
    TResult Function()? getCart,
    TResult Function(ItemRequests data)? updateItem,
    TResult Function(CartItemsRequests body)? deleteItems,
    TResult Function(CartItemsRequests body)? createOrders,
    TResult Function(CheckoutRequests data)? fetchChekout,
    TResult Function(String id)? fetchChekoutSubscription,
    TResult Function(MenuCheckoutRequest body)? fetchChekoutMenu,
    TResult Function(PayRequest body)? payByCart,
    TResult Function(BonusRequest body)? payBonus,
    TResult Function(MenuCheckoutRequest body)? payMenu,
    TResult Function(CheckPromoRequest body)? checkPromoCode,
    required TResult orElse(),
  }) {
    if (deleteItems != null) {
      return deleteItems(body);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddCart value) addCart,
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_UpdateItem value) updateItem,
    required TResult Function(_DeleteItems value) deleteItems,
    required TResult Function(_CreateOrders value) createOrders,
    required TResult Function(_FetchChekout value) fetchChekout,
    required TResult Function(_FetchChekoutSubscription value)
        fetchChekoutSubscription,
    required TResult Function(_FetchChekoutMenu value) fetchChekoutMenu,
    required TResult Function(_PayByCart value) payByCart,
    required TResult Function(_PayBonus value) payBonus,
    required TResult Function(_PayMenu value) payMenu,
    required TResult Function(_CheckPromoCode value) checkPromoCode,
  }) {
    return deleteItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddCart value)? addCart,
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_UpdateItem value)? updateItem,
    TResult? Function(_DeleteItems value)? deleteItems,
    TResult? Function(_CreateOrders value)? createOrders,
    TResult? Function(_FetchChekout value)? fetchChekout,
    TResult? Function(_FetchChekoutSubscription value)?
        fetchChekoutSubscription,
    TResult? Function(_FetchChekoutMenu value)? fetchChekoutMenu,
    TResult? Function(_PayByCart value)? payByCart,
    TResult? Function(_PayBonus value)? payBonus,
    TResult? Function(_PayMenu value)? payMenu,
    TResult? Function(_CheckPromoCode value)? checkPromoCode,
  }) {
    return deleteItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddCart value)? addCart,
    TResult Function(_GetCart value)? getCart,
    TResult Function(_UpdateItem value)? updateItem,
    TResult Function(_DeleteItems value)? deleteItems,
    TResult Function(_CreateOrders value)? createOrders,
    TResult Function(_FetchChekout value)? fetchChekout,
    TResult Function(_FetchChekoutSubscription value)? fetchChekoutSubscription,
    TResult Function(_FetchChekoutMenu value)? fetchChekoutMenu,
    TResult Function(_PayByCart value)? payByCart,
    TResult Function(_PayBonus value)? payBonus,
    TResult Function(_PayMenu value)? payMenu,
    TResult Function(_CheckPromoCode value)? checkPromoCode,
    required TResult orElse(),
  }) {
    if (deleteItems != null) {
      return deleteItems(this);
    }
    return orElse();
  }
}

abstract class _DeleteItems extends CartApi {
  const factory _DeleteItems({required final CartItemsRequests body}) =
      _$DeleteItemsImpl;
  const _DeleteItems._() : super._();

  CartItemsRequests get body;
  @JsonKey(ignore: true)
  _$$DeleteItemsImplCopyWith<_$DeleteItemsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateOrdersImplCopyWith<$Res> {
  factory _$$CreateOrdersImplCopyWith(
          _$CreateOrdersImpl value, $Res Function(_$CreateOrdersImpl) then) =
      __$$CreateOrdersImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CartItemsRequests body});
}

/// @nodoc
class __$$CreateOrdersImplCopyWithImpl<$Res>
    extends _$CartApiCopyWithImpl<$Res, _$CreateOrdersImpl>
    implements _$$CreateOrdersImplCopyWith<$Res> {
  __$$CreateOrdersImplCopyWithImpl(
      _$CreateOrdersImpl _value, $Res Function(_$CreateOrdersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
  }) {
    return _then(_$CreateOrdersImpl(
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as CartItemsRequests,
    ));
  }
}

/// @nodoc

class _$CreateOrdersImpl extends _CreateOrders {
  const _$CreateOrdersImpl({required this.body}) : super._();

  @override
  final CartItemsRequests body;

  @override
  String toString() {
    return 'CartApi.createOrders(body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateOrdersImpl &&
            (identical(other.body, body) || other.body == body));
  }

  @override
  int get hashCode => Object.hash(runtimeType, body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateOrdersImplCopyWith<_$CreateOrdersImpl> get copyWith =>
      __$$CreateOrdersImplCopyWithImpl<_$CreateOrdersImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, AddCartRequest body) addCart,
    required TResult Function() getCart,
    required TResult Function(ItemRequests data) updateItem,
    required TResult Function(CartItemsRequests body) deleteItems,
    required TResult Function(CartItemsRequests body) createOrders,
    required TResult Function(CheckoutRequests data) fetchChekout,
    required TResult Function(String id) fetchChekoutSubscription,
    required TResult Function(MenuCheckoutRequest body) fetchChekoutMenu,
    required TResult Function(PayRequest body) payByCart,
    required TResult Function(BonusRequest body) payBonus,
    required TResult Function(MenuCheckoutRequest body) payMenu,
    required TResult Function(CheckPromoRequest body) checkPromoCode,
  }) {
    return createOrders(body);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, AddCartRequest body)? addCart,
    TResult? Function()? getCart,
    TResult? Function(ItemRequests data)? updateItem,
    TResult? Function(CartItemsRequests body)? deleteItems,
    TResult? Function(CartItemsRequests body)? createOrders,
    TResult? Function(CheckoutRequests data)? fetchChekout,
    TResult? Function(String id)? fetchChekoutSubscription,
    TResult? Function(MenuCheckoutRequest body)? fetchChekoutMenu,
    TResult? Function(PayRequest body)? payByCart,
    TResult? Function(BonusRequest body)? payBonus,
    TResult? Function(MenuCheckoutRequest body)? payMenu,
    TResult? Function(CheckPromoRequest body)? checkPromoCode,
  }) {
    return createOrders?.call(body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, AddCartRequest body)? addCart,
    TResult Function()? getCart,
    TResult Function(ItemRequests data)? updateItem,
    TResult Function(CartItemsRequests body)? deleteItems,
    TResult Function(CartItemsRequests body)? createOrders,
    TResult Function(CheckoutRequests data)? fetchChekout,
    TResult Function(String id)? fetchChekoutSubscription,
    TResult Function(MenuCheckoutRequest body)? fetchChekoutMenu,
    TResult Function(PayRequest body)? payByCart,
    TResult Function(BonusRequest body)? payBonus,
    TResult Function(MenuCheckoutRequest body)? payMenu,
    TResult Function(CheckPromoRequest body)? checkPromoCode,
    required TResult orElse(),
  }) {
    if (createOrders != null) {
      return createOrders(body);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddCart value) addCart,
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_UpdateItem value) updateItem,
    required TResult Function(_DeleteItems value) deleteItems,
    required TResult Function(_CreateOrders value) createOrders,
    required TResult Function(_FetchChekout value) fetchChekout,
    required TResult Function(_FetchChekoutSubscription value)
        fetchChekoutSubscription,
    required TResult Function(_FetchChekoutMenu value) fetchChekoutMenu,
    required TResult Function(_PayByCart value) payByCart,
    required TResult Function(_PayBonus value) payBonus,
    required TResult Function(_PayMenu value) payMenu,
    required TResult Function(_CheckPromoCode value) checkPromoCode,
  }) {
    return createOrders(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddCart value)? addCart,
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_UpdateItem value)? updateItem,
    TResult? Function(_DeleteItems value)? deleteItems,
    TResult? Function(_CreateOrders value)? createOrders,
    TResult? Function(_FetchChekout value)? fetchChekout,
    TResult? Function(_FetchChekoutSubscription value)?
        fetchChekoutSubscription,
    TResult? Function(_FetchChekoutMenu value)? fetchChekoutMenu,
    TResult? Function(_PayByCart value)? payByCart,
    TResult? Function(_PayBonus value)? payBonus,
    TResult? Function(_PayMenu value)? payMenu,
    TResult? Function(_CheckPromoCode value)? checkPromoCode,
  }) {
    return createOrders?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddCart value)? addCart,
    TResult Function(_GetCart value)? getCart,
    TResult Function(_UpdateItem value)? updateItem,
    TResult Function(_DeleteItems value)? deleteItems,
    TResult Function(_CreateOrders value)? createOrders,
    TResult Function(_FetchChekout value)? fetchChekout,
    TResult Function(_FetchChekoutSubscription value)? fetchChekoutSubscription,
    TResult Function(_FetchChekoutMenu value)? fetchChekoutMenu,
    TResult Function(_PayByCart value)? payByCart,
    TResult Function(_PayBonus value)? payBonus,
    TResult Function(_PayMenu value)? payMenu,
    TResult Function(_CheckPromoCode value)? checkPromoCode,
    required TResult orElse(),
  }) {
    if (createOrders != null) {
      return createOrders(this);
    }
    return orElse();
  }
}

abstract class _CreateOrders extends CartApi {
  const factory _CreateOrders({required final CartItemsRequests body}) =
      _$CreateOrdersImpl;
  const _CreateOrders._() : super._();

  CartItemsRequests get body;
  @JsonKey(ignore: true)
  _$$CreateOrdersImplCopyWith<_$CreateOrdersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchChekoutImplCopyWith<$Res> {
  factory _$$FetchChekoutImplCopyWith(
          _$FetchChekoutImpl value, $Res Function(_$FetchChekoutImpl) then) =
      __$$FetchChekoutImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CheckoutRequests data});
}

/// @nodoc
class __$$FetchChekoutImplCopyWithImpl<$Res>
    extends _$CartApiCopyWithImpl<$Res, _$FetchChekoutImpl>
    implements _$$FetchChekoutImplCopyWith<$Res> {
  __$$FetchChekoutImplCopyWithImpl(
      _$FetchChekoutImpl _value, $Res Function(_$FetchChekoutImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$FetchChekoutImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as CheckoutRequests,
    ));
  }
}

/// @nodoc

class _$FetchChekoutImpl extends _FetchChekout {
  const _$FetchChekoutImpl({required this.data}) : super._();

  @override
  final CheckoutRequests data;

  @override
  String toString() {
    return 'CartApi.fetchChekout(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchChekoutImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchChekoutImplCopyWith<_$FetchChekoutImpl> get copyWith =>
      __$$FetchChekoutImplCopyWithImpl<_$FetchChekoutImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, AddCartRequest body) addCart,
    required TResult Function() getCart,
    required TResult Function(ItemRequests data) updateItem,
    required TResult Function(CartItemsRequests body) deleteItems,
    required TResult Function(CartItemsRequests body) createOrders,
    required TResult Function(CheckoutRequests data) fetchChekout,
    required TResult Function(String id) fetchChekoutSubscription,
    required TResult Function(MenuCheckoutRequest body) fetchChekoutMenu,
    required TResult Function(PayRequest body) payByCart,
    required TResult Function(BonusRequest body) payBonus,
    required TResult Function(MenuCheckoutRequest body) payMenu,
    required TResult Function(CheckPromoRequest body) checkPromoCode,
  }) {
    return fetchChekout(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, AddCartRequest body)? addCart,
    TResult? Function()? getCart,
    TResult? Function(ItemRequests data)? updateItem,
    TResult? Function(CartItemsRequests body)? deleteItems,
    TResult? Function(CartItemsRequests body)? createOrders,
    TResult? Function(CheckoutRequests data)? fetchChekout,
    TResult? Function(String id)? fetchChekoutSubscription,
    TResult? Function(MenuCheckoutRequest body)? fetchChekoutMenu,
    TResult? Function(PayRequest body)? payByCart,
    TResult? Function(BonusRequest body)? payBonus,
    TResult? Function(MenuCheckoutRequest body)? payMenu,
    TResult? Function(CheckPromoRequest body)? checkPromoCode,
  }) {
    return fetchChekout?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, AddCartRequest body)? addCart,
    TResult Function()? getCart,
    TResult Function(ItemRequests data)? updateItem,
    TResult Function(CartItemsRequests body)? deleteItems,
    TResult Function(CartItemsRequests body)? createOrders,
    TResult Function(CheckoutRequests data)? fetchChekout,
    TResult Function(String id)? fetchChekoutSubscription,
    TResult Function(MenuCheckoutRequest body)? fetchChekoutMenu,
    TResult Function(PayRequest body)? payByCart,
    TResult Function(BonusRequest body)? payBonus,
    TResult Function(MenuCheckoutRequest body)? payMenu,
    TResult Function(CheckPromoRequest body)? checkPromoCode,
    required TResult orElse(),
  }) {
    if (fetchChekout != null) {
      return fetchChekout(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddCart value) addCart,
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_UpdateItem value) updateItem,
    required TResult Function(_DeleteItems value) deleteItems,
    required TResult Function(_CreateOrders value) createOrders,
    required TResult Function(_FetchChekout value) fetchChekout,
    required TResult Function(_FetchChekoutSubscription value)
        fetchChekoutSubscription,
    required TResult Function(_FetchChekoutMenu value) fetchChekoutMenu,
    required TResult Function(_PayByCart value) payByCart,
    required TResult Function(_PayBonus value) payBonus,
    required TResult Function(_PayMenu value) payMenu,
    required TResult Function(_CheckPromoCode value) checkPromoCode,
  }) {
    return fetchChekout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddCart value)? addCart,
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_UpdateItem value)? updateItem,
    TResult? Function(_DeleteItems value)? deleteItems,
    TResult? Function(_CreateOrders value)? createOrders,
    TResult? Function(_FetchChekout value)? fetchChekout,
    TResult? Function(_FetchChekoutSubscription value)?
        fetchChekoutSubscription,
    TResult? Function(_FetchChekoutMenu value)? fetchChekoutMenu,
    TResult? Function(_PayByCart value)? payByCart,
    TResult? Function(_PayBonus value)? payBonus,
    TResult? Function(_PayMenu value)? payMenu,
    TResult? Function(_CheckPromoCode value)? checkPromoCode,
  }) {
    return fetchChekout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddCart value)? addCart,
    TResult Function(_GetCart value)? getCart,
    TResult Function(_UpdateItem value)? updateItem,
    TResult Function(_DeleteItems value)? deleteItems,
    TResult Function(_CreateOrders value)? createOrders,
    TResult Function(_FetchChekout value)? fetchChekout,
    TResult Function(_FetchChekoutSubscription value)? fetchChekoutSubscription,
    TResult Function(_FetchChekoutMenu value)? fetchChekoutMenu,
    TResult Function(_PayByCart value)? payByCart,
    TResult Function(_PayBonus value)? payBonus,
    TResult Function(_PayMenu value)? payMenu,
    TResult Function(_CheckPromoCode value)? checkPromoCode,
    required TResult orElse(),
  }) {
    if (fetchChekout != null) {
      return fetchChekout(this);
    }
    return orElse();
  }
}

abstract class _FetchChekout extends CartApi {
  const factory _FetchChekout({required final CheckoutRequests data}) =
      _$FetchChekoutImpl;
  const _FetchChekout._() : super._();

  CheckoutRequests get data;
  @JsonKey(ignore: true)
  _$$FetchChekoutImplCopyWith<_$FetchChekoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchChekoutSubscriptionImplCopyWith<$Res> {
  factory _$$FetchChekoutSubscriptionImplCopyWith(
          _$FetchChekoutSubscriptionImpl value,
          $Res Function(_$FetchChekoutSubscriptionImpl) then) =
      __$$FetchChekoutSubscriptionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$FetchChekoutSubscriptionImplCopyWithImpl<$Res>
    extends _$CartApiCopyWithImpl<$Res, _$FetchChekoutSubscriptionImpl>
    implements _$$FetchChekoutSubscriptionImplCopyWith<$Res> {
  __$$FetchChekoutSubscriptionImplCopyWithImpl(
      _$FetchChekoutSubscriptionImpl _value,
      $Res Function(_$FetchChekoutSubscriptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$FetchChekoutSubscriptionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchChekoutSubscriptionImpl extends _FetchChekoutSubscription {
  const _$FetchChekoutSubscriptionImpl({required this.id}) : super._();

  @override
  final String id;

  @override
  String toString() {
    return 'CartApi.fetchChekoutSubscription(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchChekoutSubscriptionImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchChekoutSubscriptionImplCopyWith<_$FetchChekoutSubscriptionImpl>
      get copyWith => __$$FetchChekoutSubscriptionImplCopyWithImpl<
          _$FetchChekoutSubscriptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, AddCartRequest body) addCart,
    required TResult Function() getCart,
    required TResult Function(ItemRequests data) updateItem,
    required TResult Function(CartItemsRequests body) deleteItems,
    required TResult Function(CartItemsRequests body) createOrders,
    required TResult Function(CheckoutRequests data) fetchChekout,
    required TResult Function(String id) fetchChekoutSubscription,
    required TResult Function(MenuCheckoutRequest body) fetchChekoutMenu,
    required TResult Function(PayRequest body) payByCart,
    required TResult Function(BonusRequest body) payBonus,
    required TResult Function(MenuCheckoutRequest body) payMenu,
    required TResult Function(CheckPromoRequest body) checkPromoCode,
  }) {
    return fetchChekoutSubscription(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, AddCartRequest body)? addCart,
    TResult? Function()? getCart,
    TResult? Function(ItemRequests data)? updateItem,
    TResult? Function(CartItemsRequests body)? deleteItems,
    TResult? Function(CartItemsRequests body)? createOrders,
    TResult? Function(CheckoutRequests data)? fetchChekout,
    TResult? Function(String id)? fetchChekoutSubscription,
    TResult? Function(MenuCheckoutRequest body)? fetchChekoutMenu,
    TResult? Function(PayRequest body)? payByCart,
    TResult? Function(BonusRequest body)? payBonus,
    TResult? Function(MenuCheckoutRequest body)? payMenu,
    TResult? Function(CheckPromoRequest body)? checkPromoCode,
  }) {
    return fetchChekoutSubscription?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, AddCartRequest body)? addCart,
    TResult Function()? getCart,
    TResult Function(ItemRequests data)? updateItem,
    TResult Function(CartItemsRequests body)? deleteItems,
    TResult Function(CartItemsRequests body)? createOrders,
    TResult Function(CheckoutRequests data)? fetchChekout,
    TResult Function(String id)? fetchChekoutSubscription,
    TResult Function(MenuCheckoutRequest body)? fetchChekoutMenu,
    TResult Function(PayRequest body)? payByCart,
    TResult Function(BonusRequest body)? payBonus,
    TResult Function(MenuCheckoutRequest body)? payMenu,
    TResult Function(CheckPromoRequest body)? checkPromoCode,
    required TResult orElse(),
  }) {
    if (fetchChekoutSubscription != null) {
      return fetchChekoutSubscription(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddCart value) addCart,
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_UpdateItem value) updateItem,
    required TResult Function(_DeleteItems value) deleteItems,
    required TResult Function(_CreateOrders value) createOrders,
    required TResult Function(_FetchChekout value) fetchChekout,
    required TResult Function(_FetchChekoutSubscription value)
        fetchChekoutSubscription,
    required TResult Function(_FetchChekoutMenu value) fetchChekoutMenu,
    required TResult Function(_PayByCart value) payByCart,
    required TResult Function(_PayBonus value) payBonus,
    required TResult Function(_PayMenu value) payMenu,
    required TResult Function(_CheckPromoCode value) checkPromoCode,
  }) {
    return fetchChekoutSubscription(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddCart value)? addCart,
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_UpdateItem value)? updateItem,
    TResult? Function(_DeleteItems value)? deleteItems,
    TResult? Function(_CreateOrders value)? createOrders,
    TResult? Function(_FetchChekout value)? fetchChekout,
    TResult? Function(_FetchChekoutSubscription value)?
        fetchChekoutSubscription,
    TResult? Function(_FetchChekoutMenu value)? fetchChekoutMenu,
    TResult? Function(_PayByCart value)? payByCart,
    TResult? Function(_PayBonus value)? payBonus,
    TResult? Function(_PayMenu value)? payMenu,
    TResult? Function(_CheckPromoCode value)? checkPromoCode,
  }) {
    return fetchChekoutSubscription?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddCart value)? addCart,
    TResult Function(_GetCart value)? getCart,
    TResult Function(_UpdateItem value)? updateItem,
    TResult Function(_DeleteItems value)? deleteItems,
    TResult Function(_CreateOrders value)? createOrders,
    TResult Function(_FetchChekout value)? fetchChekout,
    TResult Function(_FetchChekoutSubscription value)? fetchChekoutSubscription,
    TResult Function(_FetchChekoutMenu value)? fetchChekoutMenu,
    TResult Function(_PayByCart value)? payByCart,
    TResult Function(_PayBonus value)? payBonus,
    TResult Function(_PayMenu value)? payMenu,
    TResult Function(_CheckPromoCode value)? checkPromoCode,
    required TResult orElse(),
  }) {
    if (fetchChekoutSubscription != null) {
      return fetchChekoutSubscription(this);
    }
    return orElse();
  }
}

abstract class _FetchChekoutSubscription extends CartApi {
  const factory _FetchChekoutSubscription({required final String id}) =
      _$FetchChekoutSubscriptionImpl;
  const _FetchChekoutSubscription._() : super._();

  String get id;
  @JsonKey(ignore: true)
  _$$FetchChekoutSubscriptionImplCopyWith<_$FetchChekoutSubscriptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchChekoutMenuImplCopyWith<$Res> {
  factory _$$FetchChekoutMenuImplCopyWith(_$FetchChekoutMenuImpl value,
          $Res Function(_$FetchChekoutMenuImpl) then) =
      __$$FetchChekoutMenuImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MenuCheckoutRequest body});
}

/// @nodoc
class __$$FetchChekoutMenuImplCopyWithImpl<$Res>
    extends _$CartApiCopyWithImpl<$Res, _$FetchChekoutMenuImpl>
    implements _$$FetchChekoutMenuImplCopyWith<$Res> {
  __$$FetchChekoutMenuImplCopyWithImpl(_$FetchChekoutMenuImpl _value,
      $Res Function(_$FetchChekoutMenuImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
  }) {
    return _then(_$FetchChekoutMenuImpl(
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as MenuCheckoutRequest,
    ));
  }
}

/// @nodoc

class _$FetchChekoutMenuImpl extends _FetchChekoutMenu {
  const _$FetchChekoutMenuImpl({required this.body}) : super._();

  @override
  final MenuCheckoutRequest body;

  @override
  String toString() {
    return 'CartApi.fetchChekoutMenu(body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchChekoutMenuImpl &&
            (identical(other.body, body) || other.body == body));
  }

  @override
  int get hashCode => Object.hash(runtimeType, body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchChekoutMenuImplCopyWith<_$FetchChekoutMenuImpl> get copyWith =>
      __$$FetchChekoutMenuImplCopyWithImpl<_$FetchChekoutMenuImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, AddCartRequest body) addCart,
    required TResult Function() getCart,
    required TResult Function(ItemRequests data) updateItem,
    required TResult Function(CartItemsRequests body) deleteItems,
    required TResult Function(CartItemsRequests body) createOrders,
    required TResult Function(CheckoutRequests data) fetchChekout,
    required TResult Function(String id) fetchChekoutSubscription,
    required TResult Function(MenuCheckoutRequest body) fetchChekoutMenu,
    required TResult Function(PayRequest body) payByCart,
    required TResult Function(BonusRequest body) payBonus,
    required TResult Function(MenuCheckoutRequest body) payMenu,
    required TResult Function(CheckPromoRequest body) checkPromoCode,
  }) {
    return fetchChekoutMenu(body);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, AddCartRequest body)? addCart,
    TResult? Function()? getCart,
    TResult? Function(ItemRequests data)? updateItem,
    TResult? Function(CartItemsRequests body)? deleteItems,
    TResult? Function(CartItemsRequests body)? createOrders,
    TResult? Function(CheckoutRequests data)? fetchChekout,
    TResult? Function(String id)? fetchChekoutSubscription,
    TResult? Function(MenuCheckoutRequest body)? fetchChekoutMenu,
    TResult? Function(PayRequest body)? payByCart,
    TResult? Function(BonusRequest body)? payBonus,
    TResult? Function(MenuCheckoutRequest body)? payMenu,
    TResult? Function(CheckPromoRequest body)? checkPromoCode,
  }) {
    return fetchChekoutMenu?.call(body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, AddCartRequest body)? addCart,
    TResult Function()? getCart,
    TResult Function(ItemRequests data)? updateItem,
    TResult Function(CartItemsRequests body)? deleteItems,
    TResult Function(CartItemsRequests body)? createOrders,
    TResult Function(CheckoutRequests data)? fetchChekout,
    TResult Function(String id)? fetchChekoutSubscription,
    TResult Function(MenuCheckoutRequest body)? fetchChekoutMenu,
    TResult Function(PayRequest body)? payByCart,
    TResult Function(BonusRequest body)? payBonus,
    TResult Function(MenuCheckoutRequest body)? payMenu,
    TResult Function(CheckPromoRequest body)? checkPromoCode,
    required TResult orElse(),
  }) {
    if (fetchChekoutMenu != null) {
      return fetchChekoutMenu(body);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddCart value) addCart,
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_UpdateItem value) updateItem,
    required TResult Function(_DeleteItems value) deleteItems,
    required TResult Function(_CreateOrders value) createOrders,
    required TResult Function(_FetchChekout value) fetchChekout,
    required TResult Function(_FetchChekoutSubscription value)
        fetchChekoutSubscription,
    required TResult Function(_FetchChekoutMenu value) fetchChekoutMenu,
    required TResult Function(_PayByCart value) payByCart,
    required TResult Function(_PayBonus value) payBonus,
    required TResult Function(_PayMenu value) payMenu,
    required TResult Function(_CheckPromoCode value) checkPromoCode,
  }) {
    return fetchChekoutMenu(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddCart value)? addCart,
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_UpdateItem value)? updateItem,
    TResult? Function(_DeleteItems value)? deleteItems,
    TResult? Function(_CreateOrders value)? createOrders,
    TResult? Function(_FetchChekout value)? fetchChekout,
    TResult? Function(_FetchChekoutSubscription value)?
        fetchChekoutSubscription,
    TResult? Function(_FetchChekoutMenu value)? fetchChekoutMenu,
    TResult? Function(_PayByCart value)? payByCart,
    TResult? Function(_PayBonus value)? payBonus,
    TResult? Function(_PayMenu value)? payMenu,
    TResult? Function(_CheckPromoCode value)? checkPromoCode,
  }) {
    return fetchChekoutMenu?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddCart value)? addCart,
    TResult Function(_GetCart value)? getCart,
    TResult Function(_UpdateItem value)? updateItem,
    TResult Function(_DeleteItems value)? deleteItems,
    TResult Function(_CreateOrders value)? createOrders,
    TResult Function(_FetchChekout value)? fetchChekout,
    TResult Function(_FetchChekoutSubscription value)? fetchChekoutSubscription,
    TResult Function(_FetchChekoutMenu value)? fetchChekoutMenu,
    TResult Function(_PayByCart value)? payByCart,
    TResult Function(_PayBonus value)? payBonus,
    TResult Function(_PayMenu value)? payMenu,
    TResult Function(_CheckPromoCode value)? checkPromoCode,
    required TResult orElse(),
  }) {
    if (fetchChekoutMenu != null) {
      return fetchChekoutMenu(this);
    }
    return orElse();
  }
}

abstract class _FetchChekoutMenu extends CartApi {
  const factory _FetchChekoutMenu({required final MenuCheckoutRequest body}) =
      _$FetchChekoutMenuImpl;
  const _FetchChekoutMenu._() : super._();

  MenuCheckoutRequest get body;
  @JsonKey(ignore: true)
  _$$FetchChekoutMenuImplCopyWith<_$FetchChekoutMenuImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PayByCartImplCopyWith<$Res> {
  factory _$$PayByCartImplCopyWith(
          _$PayByCartImpl value, $Res Function(_$PayByCartImpl) then) =
      __$$PayByCartImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PayRequest body});
}

/// @nodoc
class __$$PayByCartImplCopyWithImpl<$Res>
    extends _$CartApiCopyWithImpl<$Res, _$PayByCartImpl>
    implements _$$PayByCartImplCopyWith<$Res> {
  __$$PayByCartImplCopyWithImpl(
      _$PayByCartImpl _value, $Res Function(_$PayByCartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
  }) {
    return _then(_$PayByCartImpl(
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as PayRequest,
    ));
  }
}

/// @nodoc

class _$PayByCartImpl extends _PayByCart {
  const _$PayByCartImpl({required this.body}) : super._();

  @override
  final PayRequest body;

  @override
  String toString() {
    return 'CartApi.payByCart(body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PayByCartImpl &&
            (identical(other.body, body) || other.body == body));
  }

  @override
  int get hashCode => Object.hash(runtimeType, body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PayByCartImplCopyWith<_$PayByCartImpl> get copyWith =>
      __$$PayByCartImplCopyWithImpl<_$PayByCartImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, AddCartRequest body) addCart,
    required TResult Function() getCart,
    required TResult Function(ItemRequests data) updateItem,
    required TResult Function(CartItemsRequests body) deleteItems,
    required TResult Function(CartItemsRequests body) createOrders,
    required TResult Function(CheckoutRequests data) fetchChekout,
    required TResult Function(String id) fetchChekoutSubscription,
    required TResult Function(MenuCheckoutRequest body) fetchChekoutMenu,
    required TResult Function(PayRequest body) payByCart,
    required TResult Function(BonusRequest body) payBonus,
    required TResult Function(MenuCheckoutRequest body) payMenu,
    required TResult Function(CheckPromoRequest body) checkPromoCode,
  }) {
    return payByCart(body);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, AddCartRequest body)? addCart,
    TResult? Function()? getCart,
    TResult? Function(ItemRequests data)? updateItem,
    TResult? Function(CartItemsRequests body)? deleteItems,
    TResult? Function(CartItemsRequests body)? createOrders,
    TResult? Function(CheckoutRequests data)? fetchChekout,
    TResult? Function(String id)? fetchChekoutSubscription,
    TResult? Function(MenuCheckoutRequest body)? fetchChekoutMenu,
    TResult? Function(PayRequest body)? payByCart,
    TResult? Function(BonusRequest body)? payBonus,
    TResult? Function(MenuCheckoutRequest body)? payMenu,
    TResult? Function(CheckPromoRequest body)? checkPromoCode,
  }) {
    return payByCart?.call(body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, AddCartRequest body)? addCart,
    TResult Function()? getCart,
    TResult Function(ItemRequests data)? updateItem,
    TResult Function(CartItemsRequests body)? deleteItems,
    TResult Function(CartItemsRequests body)? createOrders,
    TResult Function(CheckoutRequests data)? fetchChekout,
    TResult Function(String id)? fetchChekoutSubscription,
    TResult Function(MenuCheckoutRequest body)? fetchChekoutMenu,
    TResult Function(PayRequest body)? payByCart,
    TResult Function(BonusRequest body)? payBonus,
    TResult Function(MenuCheckoutRequest body)? payMenu,
    TResult Function(CheckPromoRequest body)? checkPromoCode,
    required TResult orElse(),
  }) {
    if (payByCart != null) {
      return payByCart(body);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddCart value) addCart,
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_UpdateItem value) updateItem,
    required TResult Function(_DeleteItems value) deleteItems,
    required TResult Function(_CreateOrders value) createOrders,
    required TResult Function(_FetchChekout value) fetchChekout,
    required TResult Function(_FetchChekoutSubscription value)
        fetchChekoutSubscription,
    required TResult Function(_FetchChekoutMenu value) fetchChekoutMenu,
    required TResult Function(_PayByCart value) payByCart,
    required TResult Function(_PayBonus value) payBonus,
    required TResult Function(_PayMenu value) payMenu,
    required TResult Function(_CheckPromoCode value) checkPromoCode,
  }) {
    return payByCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddCart value)? addCart,
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_UpdateItem value)? updateItem,
    TResult? Function(_DeleteItems value)? deleteItems,
    TResult? Function(_CreateOrders value)? createOrders,
    TResult? Function(_FetchChekout value)? fetchChekout,
    TResult? Function(_FetchChekoutSubscription value)?
        fetchChekoutSubscription,
    TResult? Function(_FetchChekoutMenu value)? fetchChekoutMenu,
    TResult? Function(_PayByCart value)? payByCart,
    TResult? Function(_PayBonus value)? payBonus,
    TResult? Function(_PayMenu value)? payMenu,
    TResult? Function(_CheckPromoCode value)? checkPromoCode,
  }) {
    return payByCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddCart value)? addCart,
    TResult Function(_GetCart value)? getCart,
    TResult Function(_UpdateItem value)? updateItem,
    TResult Function(_DeleteItems value)? deleteItems,
    TResult Function(_CreateOrders value)? createOrders,
    TResult Function(_FetchChekout value)? fetchChekout,
    TResult Function(_FetchChekoutSubscription value)? fetchChekoutSubscription,
    TResult Function(_FetchChekoutMenu value)? fetchChekoutMenu,
    TResult Function(_PayByCart value)? payByCart,
    TResult Function(_PayBonus value)? payBonus,
    TResult Function(_PayMenu value)? payMenu,
    TResult Function(_CheckPromoCode value)? checkPromoCode,
    required TResult orElse(),
  }) {
    if (payByCart != null) {
      return payByCart(this);
    }
    return orElse();
  }
}

abstract class _PayByCart extends CartApi {
  const factory _PayByCart({required final PayRequest body}) = _$PayByCartImpl;
  const _PayByCart._() : super._();

  PayRequest get body;
  @JsonKey(ignore: true)
  _$$PayByCartImplCopyWith<_$PayByCartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PayBonusImplCopyWith<$Res> {
  factory _$$PayBonusImplCopyWith(
          _$PayBonusImpl value, $Res Function(_$PayBonusImpl) then) =
      __$$PayBonusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BonusRequest body});
}

/// @nodoc
class __$$PayBonusImplCopyWithImpl<$Res>
    extends _$CartApiCopyWithImpl<$Res, _$PayBonusImpl>
    implements _$$PayBonusImplCopyWith<$Res> {
  __$$PayBonusImplCopyWithImpl(
      _$PayBonusImpl _value, $Res Function(_$PayBonusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
  }) {
    return _then(_$PayBonusImpl(
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as BonusRequest,
    ));
  }
}

/// @nodoc

class _$PayBonusImpl extends _PayBonus {
  const _$PayBonusImpl({required this.body}) : super._();

  @override
  final BonusRequest body;

  @override
  String toString() {
    return 'CartApi.payBonus(body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PayBonusImpl &&
            (identical(other.body, body) || other.body == body));
  }

  @override
  int get hashCode => Object.hash(runtimeType, body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PayBonusImplCopyWith<_$PayBonusImpl> get copyWith =>
      __$$PayBonusImplCopyWithImpl<_$PayBonusImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, AddCartRequest body) addCart,
    required TResult Function() getCart,
    required TResult Function(ItemRequests data) updateItem,
    required TResult Function(CartItemsRequests body) deleteItems,
    required TResult Function(CartItemsRequests body) createOrders,
    required TResult Function(CheckoutRequests data) fetchChekout,
    required TResult Function(String id) fetchChekoutSubscription,
    required TResult Function(MenuCheckoutRequest body) fetchChekoutMenu,
    required TResult Function(PayRequest body) payByCart,
    required TResult Function(BonusRequest body) payBonus,
    required TResult Function(MenuCheckoutRequest body) payMenu,
    required TResult Function(CheckPromoRequest body) checkPromoCode,
  }) {
    return payBonus(body);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, AddCartRequest body)? addCart,
    TResult? Function()? getCart,
    TResult? Function(ItemRequests data)? updateItem,
    TResult? Function(CartItemsRequests body)? deleteItems,
    TResult? Function(CartItemsRequests body)? createOrders,
    TResult? Function(CheckoutRequests data)? fetchChekout,
    TResult? Function(String id)? fetchChekoutSubscription,
    TResult? Function(MenuCheckoutRequest body)? fetchChekoutMenu,
    TResult? Function(PayRequest body)? payByCart,
    TResult? Function(BonusRequest body)? payBonus,
    TResult? Function(MenuCheckoutRequest body)? payMenu,
    TResult? Function(CheckPromoRequest body)? checkPromoCode,
  }) {
    return payBonus?.call(body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, AddCartRequest body)? addCart,
    TResult Function()? getCart,
    TResult Function(ItemRequests data)? updateItem,
    TResult Function(CartItemsRequests body)? deleteItems,
    TResult Function(CartItemsRequests body)? createOrders,
    TResult Function(CheckoutRequests data)? fetchChekout,
    TResult Function(String id)? fetchChekoutSubscription,
    TResult Function(MenuCheckoutRequest body)? fetchChekoutMenu,
    TResult Function(PayRequest body)? payByCart,
    TResult Function(BonusRequest body)? payBonus,
    TResult Function(MenuCheckoutRequest body)? payMenu,
    TResult Function(CheckPromoRequest body)? checkPromoCode,
    required TResult orElse(),
  }) {
    if (payBonus != null) {
      return payBonus(body);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddCart value) addCart,
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_UpdateItem value) updateItem,
    required TResult Function(_DeleteItems value) deleteItems,
    required TResult Function(_CreateOrders value) createOrders,
    required TResult Function(_FetchChekout value) fetchChekout,
    required TResult Function(_FetchChekoutSubscription value)
        fetchChekoutSubscription,
    required TResult Function(_FetchChekoutMenu value) fetchChekoutMenu,
    required TResult Function(_PayByCart value) payByCart,
    required TResult Function(_PayBonus value) payBonus,
    required TResult Function(_PayMenu value) payMenu,
    required TResult Function(_CheckPromoCode value) checkPromoCode,
  }) {
    return payBonus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddCart value)? addCart,
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_UpdateItem value)? updateItem,
    TResult? Function(_DeleteItems value)? deleteItems,
    TResult? Function(_CreateOrders value)? createOrders,
    TResult? Function(_FetchChekout value)? fetchChekout,
    TResult? Function(_FetchChekoutSubscription value)?
        fetchChekoutSubscription,
    TResult? Function(_FetchChekoutMenu value)? fetchChekoutMenu,
    TResult? Function(_PayByCart value)? payByCart,
    TResult? Function(_PayBonus value)? payBonus,
    TResult? Function(_PayMenu value)? payMenu,
    TResult? Function(_CheckPromoCode value)? checkPromoCode,
  }) {
    return payBonus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddCart value)? addCart,
    TResult Function(_GetCart value)? getCart,
    TResult Function(_UpdateItem value)? updateItem,
    TResult Function(_DeleteItems value)? deleteItems,
    TResult Function(_CreateOrders value)? createOrders,
    TResult Function(_FetchChekout value)? fetchChekout,
    TResult Function(_FetchChekoutSubscription value)? fetchChekoutSubscription,
    TResult Function(_FetchChekoutMenu value)? fetchChekoutMenu,
    TResult Function(_PayByCart value)? payByCart,
    TResult Function(_PayBonus value)? payBonus,
    TResult Function(_PayMenu value)? payMenu,
    TResult Function(_CheckPromoCode value)? checkPromoCode,
    required TResult orElse(),
  }) {
    if (payBonus != null) {
      return payBonus(this);
    }
    return orElse();
  }
}

abstract class _PayBonus extends CartApi {
  const factory _PayBonus({required final BonusRequest body}) = _$PayBonusImpl;
  const _PayBonus._() : super._();

  BonusRequest get body;
  @JsonKey(ignore: true)
  _$$PayBonusImplCopyWith<_$PayBonusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PayMenuImplCopyWith<$Res> {
  factory _$$PayMenuImplCopyWith(
          _$PayMenuImpl value, $Res Function(_$PayMenuImpl) then) =
      __$$PayMenuImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MenuCheckoutRequest body});
}

/// @nodoc
class __$$PayMenuImplCopyWithImpl<$Res>
    extends _$CartApiCopyWithImpl<$Res, _$PayMenuImpl>
    implements _$$PayMenuImplCopyWith<$Res> {
  __$$PayMenuImplCopyWithImpl(
      _$PayMenuImpl _value, $Res Function(_$PayMenuImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
  }) {
    return _then(_$PayMenuImpl(
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as MenuCheckoutRequest,
    ));
  }
}

/// @nodoc

class _$PayMenuImpl extends _PayMenu {
  const _$PayMenuImpl({required this.body}) : super._();

  @override
  final MenuCheckoutRequest body;

  @override
  String toString() {
    return 'CartApi.payMenu(body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PayMenuImpl &&
            (identical(other.body, body) || other.body == body));
  }

  @override
  int get hashCode => Object.hash(runtimeType, body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PayMenuImplCopyWith<_$PayMenuImpl> get copyWith =>
      __$$PayMenuImplCopyWithImpl<_$PayMenuImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, AddCartRequest body) addCart,
    required TResult Function() getCart,
    required TResult Function(ItemRequests data) updateItem,
    required TResult Function(CartItemsRequests body) deleteItems,
    required TResult Function(CartItemsRequests body) createOrders,
    required TResult Function(CheckoutRequests data) fetchChekout,
    required TResult Function(String id) fetchChekoutSubscription,
    required TResult Function(MenuCheckoutRequest body) fetchChekoutMenu,
    required TResult Function(PayRequest body) payByCart,
    required TResult Function(BonusRequest body) payBonus,
    required TResult Function(MenuCheckoutRequest body) payMenu,
    required TResult Function(CheckPromoRequest body) checkPromoCode,
  }) {
    return payMenu(body);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, AddCartRequest body)? addCart,
    TResult? Function()? getCart,
    TResult? Function(ItemRequests data)? updateItem,
    TResult? Function(CartItemsRequests body)? deleteItems,
    TResult? Function(CartItemsRequests body)? createOrders,
    TResult? Function(CheckoutRequests data)? fetchChekout,
    TResult? Function(String id)? fetchChekoutSubscription,
    TResult? Function(MenuCheckoutRequest body)? fetchChekoutMenu,
    TResult? Function(PayRequest body)? payByCart,
    TResult? Function(BonusRequest body)? payBonus,
    TResult? Function(MenuCheckoutRequest body)? payMenu,
    TResult? Function(CheckPromoRequest body)? checkPromoCode,
  }) {
    return payMenu?.call(body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, AddCartRequest body)? addCart,
    TResult Function()? getCart,
    TResult Function(ItemRequests data)? updateItem,
    TResult Function(CartItemsRequests body)? deleteItems,
    TResult Function(CartItemsRequests body)? createOrders,
    TResult Function(CheckoutRequests data)? fetchChekout,
    TResult Function(String id)? fetchChekoutSubscription,
    TResult Function(MenuCheckoutRequest body)? fetchChekoutMenu,
    TResult Function(PayRequest body)? payByCart,
    TResult Function(BonusRequest body)? payBonus,
    TResult Function(MenuCheckoutRequest body)? payMenu,
    TResult Function(CheckPromoRequest body)? checkPromoCode,
    required TResult orElse(),
  }) {
    if (payMenu != null) {
      return payMenu(body);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddCart value) addCart,
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_UpdateItem value) updateItem,
    required TResult Function(_DeleteItems value) deleteItems,
    required TResult Function(_CreateOrders value) createOrders,
    required TResult Function(_FetchChekout value) fetchChekout,
    required TResult Function(_FetchChekoutSubscription value)
        fetchChekoutSubscription,
    required TResult Function(_FetchChekoutMenu value) fetchChekoutMenu,
    required TResult Function(_PayByCart value) payByCart,
    required TResult Function(_PayBonus value) payBonus,
    required TResult Function(_PayMenu value) payMenu,
    required TResult Function(_CheckPromoCode value) checkPromoCode,
  }) {
    return payMenu(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddCart value)? addCart,
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_UpdateItem value)? updateItem,
    TResult? Function(_DeleteItems value)? deleteItems,
    TResult? Function(_CreateOrders value)? createOrders,
    TResult? Function(_FetchChekout value)? fetchChekout,
    TResult? Function(_FetchChekoutSubscription value)?
        fetchChekoutSubscription,
    TResult? Function(_FetchChekoutMenu value)? fetchChekoutMenu,
    TResult? Function(_PayByCart value)? payByCart,
    TResult? Function(_PayBonus value)? payBonus,
    TResult? Function(_PayMenu value)? payMenu,
    TResult? Function(_CheckPromoCode value)? checkPromoCode,
  }) {
    return payMenu?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddCart value)? addCart,
    TResult Function(_GetCart value)? getCart,
    TResult Function(_UpdateItem value)? updateItem,
    TResult Function(_DeleteItems value)? deleteItems,
    TResult Function(_CreateOrders value)? createOrders,
    TResult Function(_FetchChekout value)? fetchChekout,
    TResult Function(_FetchChekoutSubscription value)? fetchChekoutSubscription,
    TResult Function(_FetchChekoutMenu value)? fetchChekoutMenu,
    TResult Function(_PayByCart value)? payByCart,
    TResult Function(_PayBonus value)? payBonus,
    TResult Function(_PayMenu value)? payMenu,
    TResult Function(_CheckPromoCode value)? checkPromoCode,
    required TResult orElse(),
  }) {
    if (payMenu != null) {
      return payMenu(this);
    }
    return orElse();
  }
}

abstract class _PayMenu extends CartApi {
  const factory _PayMenu({required final MenuCheckoutRequest body}) =
      _$PayMenuImpl;
  const _PayMenu._() : super._();

  MenuCheckoutRequest get body;
  @JsonKey(ignore: true)
  _$$PayMenuImplCopyWith<_$PayMenuImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckPromoCodeImplCopyWith<$Res> {
  factory _$$CheckPromoCodeImplCopyWith(_$CheckPromoCodeImpl value,
          $Res Function(_$CheckPromoCodeImpl) then) =
      __$$CheckPromoCodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CheckPromoRequest body});
}

/// @nodoc
class __$$CheckPromoCodeImplCopyWithImpl<$Res>
    extends _$CartApiCopyWithImpl<$Res, _$CheckPromoCodeImpl>
    implements _$$CheckPromoCodeImplCopyWith<$Res> {
  __$$CheckPromoCodeImplCopyWithImpl(
      _$CheckPromoCodeImpl _value, $Res Function(_$CheckPromoCodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
  }) {
    return _then(_$CheckPromoCodeImpl(
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as CheckPromoRequest,
    ));
  }
}

/// @nodoc

class _$CheckPromoCodeImpl extends _CheckPromoCode {
  const _$CheckPromoCodeImpl({required this.body}) : super._();

  @override
  final CheckPromoRequest body;

  @override
  String toString() {
    return 'CartApi.checkPromoCode(body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckPromoCodeImpl &&
            (identical(other.body, body) || other.body == body));
  }

  @override
  int get hashCode => Object.hash(runtimeType, body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckPromoCodeImplCopyWith<_$CheckPromoCodeImpl> get copyWith =>
      __$$CheckPromoCodeImplCopyWithImpl<_$CheckPromoCodeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, AddCartRequest body) addCart,
    required TResult Function() getCart,
    required TResult Function(ItemRequests data) updateItem,
    required TResult Function(CartItemsRequests body) deleteItems,
    required TResult Function(CartItemsRequests body) createOrders,
    required TResult Function(CheckoutRequests data) fetchChekout,
    required TResult Function(String id) fetchChekoutSubscription,
    required TResult Function(MenuCheckoutRequest body) fetchChekoutMenu,
    required TResult Function(PayRequest body) payByCart,
    required TResult Function(BonusRequest body) payBonus,
    required TResult Function(MenuCheckoutRequest body) payMenu,
    required TResult Function(CheckPromoRequest body) checkPromoCode,
  }) {
    return checkPromoCode(body);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, AddCartRequest body)? addCart,
    TResult? Function()? getCart,
    TResult? Function(ItemRequests data)? updateItem,
    TResult? Function(CartItemsRequests body)? deleteItems,
    TResult? Function(CartItemsRequests body)? createOrders,
    TResult? Function(CheckoutRequests data)? fetchChekout,
    TResult? Function(String id)? fetchChekoutSubscription,
    TResult? Function(MenuCheckoutRequest body)? fetchChekoutMenu,
    TResult? Function(PayRequest body)? payByCart,
    TResult? Function(BonusRequest body)? payBonus,
    TResult? Function(MenuCheckoutRequest body)? payMenu,
    TResult? Function(CheckPromoRequest body)? checkPromoCode,
  }) {
    return checkPromoCode?.call(body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, AddCartRequest body)? addCart,
    TResult Function()? getCart,
    TResult Function(ItemRequests data)? updateItem,
    TResult Function(CartItemsRequests body)? deleteItems,
    TResult Function(CartItemsRequests body)? createOrders,
    TResult Function(CheckoutRequests data)? fetchChekout,
    TResult Function(String id)? fetchChekoutSubscription,
    TResult Function(MenuCheckoutRequest body)? fetchChekoutMenu,
    TResult Function(PayRequest body)? payByCart,
    TResult Function(BonusRequest body)? payBonus,
    TResult Function(MenuCheckoutRequest body)? payMenu,
    TResult Function(CheckPromoRequest body)? checkPromoCode,
    required TResult orElse(),
  }) {
    if (checkPromoCode != null) {
      return checkPromoCode(body);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddCart value) addCart,
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_UpdateItem value) updateItem,
    required TResult Function(_DeleteItems value) deleteItems,
    required TResult Function(_CreateOrders value) createOrders,
    required TResult Function(_FetchChekout value) fetchChekout,
    required TResult Function(_FetchChekoutSubscription value)
        fetchChekoutSubscription,
    required TResult Function(_FetchChekoutMenu value) fetchChekoutMenu,
    required TResult Function(_PayByCart value) payByCart,
    required TResult Function(_PayBonus value) payBonus,
    required TResult Function(_PayMenu value) payMenu,
    required TResult Function(_CheckPromoCode value) checkPromoCode,
  }) {
    return checkPromoCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddCart value)? addCart,
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_UpdateItem value)? updateItem,
    TResult? Function(_DeleteItems value)? deleteItems,
    TResult? Function(_CreateOrders value)? createOrders,
    TResult? Function(_FetchChekout value)? fetchChekout,
    TResult? Function(_FetchChekoutSubscription value)?
        fetchChekoutSubscription,
    TResult? Function(_FetchChekoutMenu value)? fetchChekoutMenu,
    TResult? Function(_PayByCart value)? payByCart,
    TResult? Function(_PayBonus value)? payBonus,
    TResult? Function(_PayMenu value)? payMenu,
    TResult? Function(_CheckPromoCode value)? checkPromoCode,
  }) {
    return checkPromoCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddCart value)? addCart,
    TResult Function(_GetCart value)? getCart,
    TResult Function(_UpdateItem value)? updateItem,
    TResult Function(_DeleteItems value)? deleteItems,
    TResult Function(_CreateOrders value)? createOrders,
    TResult Function(_FetchChekout value)? fetchChekout,
    TResult Function(_FetchChekoutSubscription value)? fetchChekoutSubscription,
    TResult Function(_FetchChekoutMenu value)? fetchChekoutMenu,
    TResult Function(_PayByCart value)? payByCart,
    TResult Function(_PayBonus value)? payBonus,
    TResult Function(_PayMenu value)? payMenu,
    TResult Function(_CheckPromoCode value)? checkPromoCode,
    required TResult orElse(),
  }) {
    if (checkPromoCode != null) {
      return checkPromoCode(this);
    }
    return orElse();
  }
}

abstract class _CheckPromoCode extends CartApi {
  const factory _CheckPromoCode({required final CheckPromoRequest body}) =
      _$CheckPromoCodeImpl;
  const _CheckPromoCode._() : super._();

  CheckPromoRequest get body;
  @JsonKey(ignore: true)
  _$$CheckPromoCodeImplCopyWith<_$CheckPromoCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
