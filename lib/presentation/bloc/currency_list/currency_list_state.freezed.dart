// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CurrencyListState {
  List<Currency> get allCurrencies => throw _privateConstructorUsedError;
  List<Currency> get filteredCurrencies => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CurrencyListStateCopyWith<CurrencyListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyListStateCopyWith<$Res> {
  factory $CurrencyListStateCopyWith(
          CurrencyListState value, $Res Function(CurrencyListState) then) =
      _$CurrencyListStateCopyWithImpl<$Res, CurrencyListState>;
  @useResult
  $Res call(
      {List<Currency> allCurrencies,
      List<Currency> filteredCurrencies,
      bool isLoading,
      String? error});
}

/// @nodoc
class _$CurrencyListStateCopyWithImpl<$Res, $Val extends CurrencyListState>
    implements $CurrencyListStateCopyWith<$Res> {
  _$CurrencyListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allCurrencies = null,
    Object? filteredCurrencies = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      allCurrencies: null == allCurrencies
          ? _value.allCurrencies
          : allCurrencies // ignore: cast_nullable_to_non_nullable
              as List<Currency>,
      filteredCurrencies: null == filteredCurrencies
          ? _value.filteredCurrencies
          : filteredCurrencies // ignore: cast_nullable_to_non_nullable
              as List<Currency>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrencyListStateImplCopyWith<$Res>
    implements $CurrencyListStateCopyWith<$Res> {
  factory _$$CurrencyListStateImplCopyWith(_$CurrencyListStateImpl value,
          $Res Function(_$CurrencyListStateImpl) then) =
      __$$CurrencyListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Currency> allCurrencies,
      List<Currency> filteredCurrencies,
      bool isLoading,
      String? error});
}

/// @nodoc
class __$$CurrencyListStateImplCopyWithImpl<$Res>
    extends _$CurrencyListStateCopyWithImpl<$Res, _$CurrencyListStateImpl>
    implements _$$CurrencyListStateImplCopyWith<$Res> {
  __$$CurrencyListStateImplCopyWithImpl(_$CurrencyListStateImpl _value,
      $Res Function(_$CurrencyListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allCurrencies = null,
    Object? filteredCurrencies = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$CurrencyListStateImpl(
      allCurrencies: null == allCurrencies
          ? _value._allCurrencies
          : allCurrencies // ignore: cast_nullable_to_non_nullable
              as List<Currency>,
      filteredCurrencies: null == filteredCurrencies
          ? _value._filteredCurrencies
          : filteredCurrencies // ignore: cast_nullable_to_non_nullable
              as List<Currency>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CurrencyListStateImpl implements _CurrencyListState {
  const _$CurrencyListStateImpl(
      {required final List<Currency> allCurrencies,
      required final List<Currency> filteredCurrencies,
      required this.isLoading,
      required this.error})
      : _allCurrencies = allCurrencies,
        _filteredCurrencies = filteredCurrencies;

  final List<Currency> _allCurrencies;
  @override
  List<Currency> get allCurrencies {
    if (_allCurrencies is EqualUnmodifiableListView) return _allCurrencies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allCurrencies);
  }

  final List<Currency> _filteredCurrencies;
  @override
  List<Currency> get filteredCurrencies {
    if (_filteredCurrencies is EqualUnmodifiableListView)
      return _filteredCurrencies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredCurrencies);
  }

  @override
  final bool isLoading;
  @override
  final String? error;

  @override
  String toString() {
    return 'CurrencyListState(allCurrencies: $allCurrencies, filteredCurrencies: $filteredCurrencies, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrencyListStateImpl &&
            const DeepCollectionEquality()
                .equals(other._allCurrencies, _allCurrencies) &&
            const DeepCollectionEquality()
                .equals(other._filteredCurrencies, _filteredCurrencies) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_allCurrencies),
      const DeepCollectionEquality().hash(_filteredCurrencies),
      isLoading,
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrencyListStateImplCopyWith<_$CurrencyListStateImpl> get copyWith =>
      __$$CurrencyListStateImplCopyWithImpl<_$CurrencyListStateImpl>(
          this, _$identity);
}

abstract class _CurrencyListState implements CurrencyListState {
  const factory _CurrencyListState(
      {required final List<Currency> allCurrencies,
      required final List<Currency> filteredCurrencies,
      required final bool isLoading,
      required final String? error}) = _$CurrencyListStateImpl;

  @override
  List<Currency> get allCurrencies;
  @override
  List<Currency> get filteredCurrencies;
  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$CurrencyListStateImplCopyWith<_$CurrencyListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
