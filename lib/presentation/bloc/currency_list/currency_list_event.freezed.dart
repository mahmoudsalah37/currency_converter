// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_list_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CurrencyListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCurrencies,
    required TResult Function(String query) searchCurrency,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCurrencies,
    TResult? Function(String query)? searchCurrency,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCurrencies,
    TResult Function(String query)? searchCurrency,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCurrencies value) loadCurrencies,
    required TResult Function(SearchCurrency value) searchCurrency,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCurrencies value)? loadCurrencies,
    TResult? Function(SearchCurrency value)? searchCurrency,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCurrencies value)? loadCurrencies,
    TResult Function(SearchCurrency value)? searchCurrency,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyListEventCopyWith<$Res> {
  factory $CurrencyListEventCopyWith(
          CurrencyListEvent value, $Res Function(CurrencyListEvent) then) =
      _$CurrencyListEventCopyWithImpl<$Res, CurrencyListEvent>;
}

/// @nodoc
class _$CurrencyListEventCopyWithImpl<$Res, $Val extends CurrencyListEvent>
    implements $CurrencyListEventCopyWith<$Res> {
  _$CurrencyListEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadCurrenciesImplCopyWith<$Res> {
  factory _$$LoadCurrenciesImplCopyWith(_$LoadCurrenciesImpl value,
          $Res Function(_$LoadCurrenciesImpl) then) =
      __$$LoadCurrenciesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadCurrenciesImplCopyWithImpl<$Res>
    extends _$CurrencyListEventCopyWithImpl<$Res, _$LoadCurrenciesImpl>
    implements _$$LoadCurrenciesImplCopyWith<$Res> {
  __$$LoadCurrenciesImplCopyWithImpl(
      _$LoadCurrenciesImpl _value, $Res Function(_$LoadCurrenciesImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadCurrenciesImpl implements LoadCurrencies {
  const _$LoadCurrenciesImpl();

  @override
  String toString() {
    return 'CurrencyListEvent.loadCurrencies()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadCurrenciesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCurrencies,
    required TResult Function(String query) searchCurrency,
  }) {
    return loadCurrencies();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCurrencies,
    TResult? Function(String query)? searchCurrency,
  }) {
    return loadCurrencies?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCurrencies,
    TResult Function(String query)? searchCurrency,
    required TResult orElse(),
  }) {
    if (loadCurrencies != null) {
      return loadCurrencies();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCurrencies value) loadCurrencies,
    required TResult Function(SearchCurrency value) searchCurrency,
  }) {
    return loadCurrencies(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCurrencies value)? loadCurrencies,
    TResult? Function(SearchCurrency value)? searchCurrency,
  }) {
    return loadCurrencies?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCurrencies value)? loadCurrencies,
    TResult Function(SearchCurrency value)? searchCurrency,
    required TResult orElse(),
  }) {
    if (loadCurrencies != null) {
      return loadCurrencies(this);
    }
    return orElse();
  }
}

abstract class LoadCurrencies implements CurrencyListEvent {
  const factory LoadCurrencies() = _$LoadCurrenciesImpl;
}

/// @nodoc
abstract class _$$SearchCurrencyImplCopyWith<$Res> {
  factory _$$SearchCurrencyImplCopyWith(_$SearchCurrencyImpl value,
          $Res Function(_$SearchCurrencyImpl) then) =
      __$$SearchCurrencyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$SearchCurrencyImplCopyWithImpl<$Res>
    extends _$CurrencyListEventCopyWithImpl<$Res, _$SearchCurrencyImpl>
    implements _$$SearchCurrencyImplCopyWith<$Res> {
  __$$SearchCurrencyImplCopyWithImpl(
      _$SearchCurrencyImpl _value, $Res Function(_$SearchCurrencyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$SearchCurrencyImpl(
      null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchCurrencyImpl implements SearchCurrency {
  const _$SearchCurrencyImpl(this.query);

  @override
  final String query;

  @override
  String toString() {
    return 'CurrencyListEvent.searchCurrency(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchCurrencyImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchCurrencyImplCopyWith<_$SearchCurrencyImpl> get copyWith =>
      __$$SearchCurrencyImplCopyWithImpl<_$SearchCurrencyImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCurrencies,
    required TResult Function(String query) searchCurrency,
  }) {
    return searchCurrency(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadCurrencies,
    TResult? Function(String query)? searchCurrency,
  }) {
    return searchCurrency?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCurrencies,
    TResult Function(String query)? searchCurrency,
    required TResult orElse(),
  }) {
    if (searchCurrency != null) {
      return searchCurrency(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCurrencies value) loadCurrencies,
    required TResult Function(SearchCurrency value) searchCurrency,
  }) {
    return searchCurrency(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCurrencies value)? loadCurrencies,
    TResult? Function(SearchCurrency value)? searchCurrency,
  }) {
    return searchCurrency?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCurrencies value)? loadCurrencies,
    TResult Function(SearchCurrency value)? searchCurrency,
    required TResult orElse(),
  }) {
    if (searchCurrency != null) {
      return searchCurrency(this);
    }
    return orElse();
  }
}

abstract class SearchCurrency implements CurrencyListEvent {
  const factory SearchCurrency(final String query) = _$SearchCurrencyImpl;

  String get query;
  @JsonKey(ignore: true)
  _$$SearchCurrencyImplCopyWith<_$SearchCurrencyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
