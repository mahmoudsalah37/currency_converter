// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'converter_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConverterState {
  double get amount => throw _privateConstructorUsedError;
  Currency get fromCurrency => throw _privateConstructorUsedError;
  Currency get toCurrency => throw _privateConstructorUsedError;
  double get convertedAmount => throw _privateConstructorUsedError;
  List<HistoricalData> get historicalData => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConverterStateCopyWith<ConverterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConverterStateCopyWith<$Res> {
  factory $ConverterStateCopyWith(
          ConverterState value, $Res Function(ConverterState) then) =
      _$ConverterStateCopyWithImpl<$Res, ConverterState>;
  @useResult
  $Res call(
      {double amount,
      Currency fromCurrency,
      Currency toCurrency,
      double convertedAmount,
      List<HistoricalData> historicalData,
      bool isLoading,
      String? error});

  $CurrencyCopyWith<$Res> get fromCurrency;
  $CurrencyCopyWith<$Res> get toCurrency;
}

/// @nodoc
class _$ConverterStateCopyWithImpl<$Res, $Val extends ConverterState>
    implements $ConverterStateCopyWith<$Res> {
  _$ConverterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? fromCurrency = null,
    Object? toCurrency = null,
    Object? convertedAmount = null,
    Object? historicalData = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      fromCurrency: null == fromCurrency
          ? _value.fromCurrency
          : fromCurrency // ignore: cast_nullable_to_non_nullable
              as Currency,
      toCurrency: null == toCurrency
          ? _value.toCurrency
          : toCurrency // ignore: cast_nullable_to_non_nullable
              as Currency,
      convertedAmount: null == convertedAmount
          ? _value.convertedAmount
          : convertedAmount // ignore: cast_nullable_to_non_nullable
              as double,
      historicalData: null == historicalData
          ? _value.historicalData
          : historicalData // ignore: cast_nullable_to_non_nullable
              as List<HistoricalData>,
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

  @override
  @pragma('vm:prefer-inline')
  $CurrencyCopyWith<$Res> get fromCurrency {
    return $CurrencyCopyWith<$Res>(_value.fromCurrency, (value) {
      return _then(_value.copyWith(fromCurrency: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CurrencyCopyWith<$Res> get toCurrency {
    return $CurrencyCopyWith<$Res>(_value.toCurrency, (value) {
      return _then(_value.copyWith(toCurrency: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConverterStateImplCopyWith<$Res>
    implements $ConverterStateCopyWith<$Res> {
  factory _$$ConverterStateImplCopyWith(_$ConverterStateImpl value,
          $Res Function(_$ConverterStateImpl) then) =
      __$$ConverterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double amount,
      Currency fromCurrency,
      Currency toCurrency,
      double convertedAmount,
      List<HistoricalData> historicalData,
      bool isLoading,
      String? error});

  @override
  $CurrencyCopyWith<$Res> get fromCurrency;
  @override
  $CurrencyCopyWith<$Res> get toCurrency;
}

/// @nodoc
class __$$ConverterStateImplCopyWithImpl<$Res>
    extends _$ConverterStateCopyWithImpl<$Res, _$ConverterStateImpl>
    implements _$$ConverterStateImplCopyWith<$Res> {
  __$$ConverterStateImplCopyWithImpl(
      _$ConverterStateImpl _value, $Res Function(_$ConverterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? fromCurrency = null,
    Object? toCurrency = null,
    Object? convertedAmount = null,
    Object? historicalData = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$ConverterStateImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      fromCurrency: null == fromCurrency
          ? _value.fromCurrency
          : fromCurrency // ignore: cast_nullable_to_non_nullable
              as Currency,
      toCurrency: null == toCurrency
          ? _value.toCurrency
          : toCurrency // ignore: cast_nullable_to_non_nullable
              as Currency,
      convertedAmount: null == convertedAmount
          ? _value.convertedAmount
          : convertedAmount // ignore: cast_nullable_to_non_nullable
              as double,
      historicalData: null == historicalData
          ? _value._historicalData
          : historicalData // ignore: cast_nullable_to_non_nullable
              as List<HistoricalData>,
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

class _$ConverterStateImpl implements _ConverterState {
  const _$ConverterStateImpl(
      {required this.amount,
      required this.fromCurrency,
      required this.toCurrency,
      required this.convertedAmount,
      required final List<HistoricalData> historicalData,
      required this.isLoading,
      required this.error})
      : _historicalData = historicalData;

  @override
  final double amount;
  @override
  final Currency fromCurrency;
  @override
  final Currency toCurrency;
  @override
  final double convertedAmount;
  final List<HistoricalData> _historicalData;
  @override
  List<HistoricalData> get historicalData {
    if (_historicalData is EqualUnmodifiableListView) return _historicalData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_historicalData);
  }

  @override
  final bool isLoading;
  @override
  final String? error;

  @override
  String toString() {
    return 'ConverterState(amount: $amount, fromCurrency: $fromCurrency, toCurrency: $toCurrency, convertedAmount: $convertedAmount, historicalData: $historicalData, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConverterStateImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.fromCurrency, fromCurrency) ||
                other.fromCurrency == fromCurrency) &&
            (identical(other.toCurrency, toCurrency) ||
                other.toCurrency == toCurrency) &&
            (identical(other.convertedAmount, convertedAmount) ||
                other.convertedAmount == convertedAmount) &&
            const DeepCollectionEquality()
                .equals(other._historicalData, _historicalData) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      amount,
      fromCurrency,
      toCurrency,
      convertedAmount,
      const DeepCollectionEquality().hash(_historicalData),
      isLoading,
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConverterStateImplCopyWith<_$ConverterStateImpl> get copyWith =>
      __$$ConverterStateImplCopyWithImpl<_$ConverterStateImpl>(
          this, _$identity);
}

abstract class _ConverterState implements ConverterState {
  const factory _ConverterState(
      {required final double amount,
      required final Currency fromCurrency,
      required final Currency toCurrency,
      required final double convertedAmount,
      required final List<HistoricalData> historicalData,
      required final bool isLoading,
      required final String? error}) = _$ConverterStateImpl;

  @override
  double get amount;
  @override
  Currency get fromCurrency;
  @override
  Currency get toCurrency;
  @override
  double get convertedAmount;
  @override
  List<HistoricalData> get historicalData;
  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$ConverterStateImplCopyWith<_$ConverterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
