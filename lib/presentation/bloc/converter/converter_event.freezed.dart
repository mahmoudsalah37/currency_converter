// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'converter_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConverterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String amount) amountChanged,
    required TResult Function(Currency currency) fromCurrencyChanged,
    required TResult Function(Currency currency) toCurrencyChanged,
    required TResult Function() swapCurrencies,
    required TResult Function() fetchRate,
    required TResult Function() fetchHistoricalData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String amount)? amountChanged,
    TResult? Function(Currency currency)? fromCurrencyChanged,
    TResult? Function(Currency currency)? toCurrencyChanged,
    TResult? Function()? swapCurrencies,
    TResult? Function()? fetchRate,
    TResult? Function()? fetchHistoricalData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String amount)? amountChanged,
    TResult Function(Currency currency)? fromCurrencyChanged,
    TResult Function(Currency currency)? toCurrencyChanged,
    TResult Function()? swapCurrencies,
    TResult Function()? fetchRate,
    TResult Function()? fetchHistoricalData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AmountChanged value) amountChanged,
    required TResult Function(FromCurrencyChanged value) fromCurrencyChanged,
    required TResult Function(ToCurrencyChanged value) toCurrencyChanged,
    required TResult Function(SwapCurrencies value) swapCurrencies,
    required TResult Function(FetchRate value) fetchRate,
    required TResult Function(FetchHistoricalData value) fetchHistoricalData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AmountChanged value)? amountChanged,
    TResult? Function(FromCurrencyChanged value)? fromCurrencyChanged,
    TResult? Function(ToCurrencyChanged value)? toCurrencyChanged,
    TResult? Function(SwapCurrencies value)? swapCurrencies,
    TResult? Function(FetchRate value)? fetchRate,
    TResult? Function(FetchHistoricalData value)? fetchHistoricalData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AmountChanged value)? amountChanged,
    TResult Function(FromCurrencyChanged value)? fromCurrencyChanged,
    TResult Function(ToCurrencyChanged value)? toCurrencyChanged,
    TResult Function(SwapCurrencies value)? swapCurrencies,
    TResult Function(FetchRate value)? fetchRate,
    TResult Function(FetchHistoricalData value)? fetchHistoricalData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConverterEventCopyWith<$Res> {
  factory $ConverterEventCopyWith(
          ConverterEvent value, $Res Function(ConverterEvent) then) =
      _$ConverterEventCopyWithImpl<$Res, ConverterEvent>;
}

/// @nodoc
class _$ConverterEventCopyWithImpl<$Res, $Val extends ConverterEvent>
    implements $ConverterEventCopyWith<$Res> {
  _$ConverterEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AmountChangedImplCopyWith<$Res> {
  factory _$$AmountChangedImplCopyWith(
          _$AmountChangedImpl value, $Res Function(_$AmountChangedImpl) then) =
      __$$AmountChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String amount});
}

/// @nodoc
class __$$AmountChangedImplCopyWithImpl<$Res>
    extends _$ConverterEventCopyWithImpl<$Res, _$AmountChangedImpl>
    implements _$$AmountChangedImplCopyWith<$Res> {
  __$$AmountChangedImplCopyWithImpl(
      _$AmountChangedImpl _value, $Res Function(_$AmountChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
  }) {
    return _then(_$AmountChangedImpl(
      null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AmountChangedImpl implements AmountChanged {
  const _$AmountChangedImpl(this.amount);

  @override
  final String amount;

  @override
  String toString() {
    return 'ConverterEvent.amountChanged(amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AmountChangedImpl &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AmountChangedImplCopyWith<_$AmountChangedImpl> get copyWith =>
      __$$AmountChangedImplCopyWithImpl<_$AmountChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String amount) amountChanged,
    required TResult Function(Currency currency) fromCurrencyChanged,
    required TResult Function(Currency currency) toCurrencyChanged,
    required TResult Function() swapCurrencies,
    required TResult Function() fetchRate,
    required TResult Function() fetchHistoricalData,
  }) {
    return amountChanged(amount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String amount)? amountChanged,
    TResult? Function(Currency currency)? fromCurrencyChanged,
    TResult? Function(Currency currency)? toCurrencyChanged,
    TResult? Function()? swapCurrencies,
    TResult? Function()? fetchRate,
    TResult? Function()? fetchHistoricalData,
  }) {
    return amountChanged?.call(amount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String amount)? amountChanged,
    TResult Function(Currency currency)? fromCurrencyChanged,
    TResult Function(Currency currency)? toCurrencyChanged,
    TResult Function()? swapCurrencies,
    TResult Function()? fetchRate,
    TResult Function()? fetchHistoricalData,
    required TResult orElse(),
  }) {
    if (amountChanged != null) {
      return amountChanged(amount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AmountChanged value) amountChanged,
    required TResult Function(FromCurrencyChanged value) fromCurrencyChanged,
    required TResult Function(ToCurrencyChanged value) toCurrencyChanged,
    required TResult Function(SwapCurrencies value) swapCurrencies,
    required TResult Function(FetchRate value) fetchRate,
    required TResult Function(FetchHistoricalData value) fetchHistoricalData,
  }) {
    return amountChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AmountChanged value)? amountChanged,
    TResult? Function(FromCurrencyChanged value)? fromCurrencyChanged,
    TResult? Function(ToCurrencyChanged value)? toCurrencyChanged,
    TResult? Function(SwapCurrencies value)? swapCurrencies,
    TResult? Function(FetchRate value)? fetchRate,
    TResult? Function(FetchHistoricalData value)? fetchHistoricalData,
  }) {
    return amountChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AmountChanged value)? amountChanged,
    TResult Function(FromCurrencyChanged value)? fromCurrencyChanged,
    TResult Function(ToCurrencyChanged value)? toCurrencyChanged,
    TResult Function(SwapCurrencies value)? swapCurrencies,
    TResult Function(FetchRate value)? fetchRate,
    TResult Function(FetchHistoricalData value)? fetchHistoricalData,
    required TResult orElse(),
  }) {
    if (amountChanged != null) {
      return amountChanged(this);
    }
    return orElse();
  }
}

abstract class AmountChanged implements ConverterEvent {
  const factory AmountChanged(final String amount) = _$AmountChangedImpl;

  String get amount;
  @JsonKey(ignore: true)
  _$$AmountChangedImplCopyWith<_$AmountChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FromCurrencyChangedImplCopyWith<$Res> {
  factory _$$FromCurrencyChangedImplCopyWith(_$FromCurrencyChangedImpl value,
          $Res Function(_$FromCurrencyChangedImpl) then) =
      __$$FromCurrencyChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Currency currency});

  $CurrencyCopyWith<$Res> get currency;
}

/// @nodoc
class __$$FromCurrencyChangedImplCopyWithImpl<$Res>
    extends _$ConverterEventCopyWithImpl<$Res, _$FromCurrencyChangedImpl>
    implements _$$FromCurrencyChangedImplCopyWith<$Res> {
  __$$FromCurrencyChangedImplCopyWithImpl(_$FromCurrencyChangedImpl _value,
      $Res Function(_$FromCurrencyChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = null,
  }) {
    return _then(_$FromCurrencyChangedImpl(
      null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CurrencyCopyWith<$Res> get currency {
    return $CurrencyCopyWith<$Res>(_value.currency, (value) {
      return _then(_value.copyWith(currency: value));
    });
  }
}

/// @nodoc

class _$FromCurrencyChangedImpl implements FromCurrencyChanged {
  const _$FromCurrencyChangedImpl(this.currency);

  @override
  final Currency currency;

  @override
  String toString() {
    return 'ConverterEvent.fromCurrencyChanged(currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FromCurrencyChangedImpl &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FromCurrencyChangedImplCopyWith<_$FromCurrencyChangedImpl> get copyWith =>
      __$$FromCurrencyChangedImplCopyWithImpl<_$FromCurrencyChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String amount) amountChanged,
    required TResult Function(Currency currency) fromCurrencyChanged,
    required TResult Function(Currency currency) toCurrencyChanged,
    required TResult Function() swapCurrencies,
    required TResult Function() fetchRate,
    required TResult Function() fetchHistoricalData,
  }) {
    return fromCurrencyChanged(currency);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String amount)? amountChanged,
    TResult? Function(Currency currency)? fromCurrencyChanged,
    TResult? Function(Currency currency)? toCurrencyChanged,
    TResult? Function()? swapCurrencies,
    TResult? Function()? fetchRate,
    TResult? Function()? fetchHistoricalData,
  }) {
    return fromCurrencyChanged?.call(currency);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String amount)? amountChanged,
    TResult Function(Currency currency)? fromCurrencyChanged,
    TResult Function(Currency currency)? toCurrencyChanged,
    TResult Function()? swapCurrencies,
    TResult Function()? fetchRate,
    TResult Function()? fetchHistoricalData,
    required TResult orElse(),
  }) {
    if (fromCurrencyChanged != null) {
      return fromCurrencyChanged(currency);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AmountChanged value) amountChanged,
    required TResult Function(FromCurrencyChanged value) fromCurrencyChanged,
    required TResult Function(ToCurrencyChanged value) toCurrencyChanged,
    required TResult Function(SwapCurrencies value) swapCurrencies,
    required TResult Function(FetchRate value) fetchRate,
    required TResult Function(FetchHistoricalData value) fetchHistoricalData,
  }) {
    return fromCurrencyChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AmountChanged value)? amountChanged,
    TResult? Function(FromCurrencyChanged value)? fromCurrencyChanged,
    TResult? Function(ToCurrencyChanged value)? toCurrencyChanged,
    TResult? Function(SwapCurrencies value)? swapCurrencies,
    TResult? Function(FetchRate value)? fetchRate,
    TResult? Function(FetchHistoricalData value)? fetchHistoricalData,
  }) {
    return fromCurrencyChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AmountChanged value)? amountChanged,
    TResult Function(FromCurrencyChanged value)? fromCurrencyChanged,
    TResult Function(ToCurrencyChanged value)? toCurrencyChanged,
    TResult Function(SwapCurrencies value)? swapCurrencies,
    TResult Function(FetchRate value)? fetchRate,
    TResult Function(FetchHistoricalData value)? fetchHistoricalData,
    required TResult orElse(),
  }) {
    if (fromCurrencyChanged != null) {
      return fromCurrencyChanged(this);
    }
    return orElse();
  }
}

abstract class FromCurrencyChanged implements ConverterEvent {
  const factory FromCurrencyChanged(final Currency currency) =
      _$FromCurrencyChangedImpl;

  Currency get currency;
  @JsonKey(ignore: true)
  _$$FromCurrencyChangedImplCopyWith<_$FromCurrencyChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToCurrencyChangedImplCopyWith<$Res> {
  factory _$$ToCurrencyChangedImplCopyWith(_$ToCurrencyChangedImpl value,
          $Res Function(_$ToCurrencyChangedImpl) then) =
      __$$ToCurrencyChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Currency currency});

  $CurrencyCopyWith<$Res> get currency;
}

/// @nodoc
class __$$ToCurrencyChangedImplCopyWithImpl<$Res>
    extends _$ConverterEventCopyWithImpl<$Res, _$ToCurrencyChangedImpl>
    implements _$$ToCurrencyChangedImplCopyWith<$Res> {
  __$$ToCurrencyChangedImplCopyWithImpl(_$ToCurrencyChangedImpl _value,
      $Res Function(_$ToCurrencyChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = null,
  }) {
    return _then(_$ToCurrencyChangedImpl(
      null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CurrencyCopyWith<$Res> get currency {
    return $CurrencyCopyWith<$Res>(_value.currency, (value) {
      return _then(_value.copyWith(currency: value));
    });
  }
}

/// @nodoc

class _$ToCurrencyChangedImpl implements ToCurrencyChanged {
  const _$ToCurrencyChangedImpl(this.currency);

  @override
  final Currency currency;

  @override
  String toString() {
    return 'ConverterEvent.toCurrencyChanged(currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToCurrencyChangedImpl &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToCurrencyChangedImplCopyWith<_$ToCurrencyChangedImpl> get copyWith =>
      __$$ToCurrencyChangedImplCopyWithImpl<_$ToCurrencyChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String amount) amountChanged,
    required TResult Function(Currency currency) fromCurrencyChanged,
    required TResult Function(Currency currency) toCurrencyChanged,
    required TResult Function() swapCurrencies,
    required TResult Function() fetchRate,
    required TResult Function() fetchHistoricalData,
  }) {
    return toCurrencyChanged(currency);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String amount)? amountChanged,
    TResult? Function(Currency currency)? fromCurrencyChanged,
    TResult? Function(Currency currency)? toCurrencyChanged,
    TResult? Function()? swapCurrencies,
    TResult? Function()? fetchRate,
    TResult? Function()? fetchHistoricalData,
  }) {
    return toCurrencyChanged?.call(currency);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String amount)? amountChanged,
    TResult Function(Currency currency)? fromCurrencyChanged,
    TResult Function(Currency currency)? toCurrencyChanged,
    TResult Function()? swapCurrencies,
    TResult Function()? fetchRate,
    TResult Function()? fetchHistoricalData,
    required TResult orElse(),
  }) {
    if (toCurrencyChanged != null) {
      return toCurrencyChanged(currency);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AmountChanged value) amountChanged,
    required TResult Function(FromCurrencyChanged value) fromCurrencyChanged,
    required TResult Function(ToCurrencyChanged value) toCurrencyChanged,
    required TResult Function(SwapCurrencies value) swapCurrencies,
    required TResult Function(FetchRate value) fetchRate,
    required TResult Function(FetchHistoricalData value) fetchHistoricalData,
  }) {
    return toCurrencyChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AmountChanged value)? amountChanged,
    TResult? Function(FromCurrencyChanged value)? fromCurrencyChanged,
    TResult? Function(ToCurrencyChanged value)? toCurrencyChanged,
    TResult? Function(SwapCurrencies value)? swapCurrencies,
    TResult? Function(FetchRate value)? fetchRate,
    TResult? Function(FetchHistoricalData value)? fetchHistoricalData,
  }) {
    return toCurrencyChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AmountChanged value)? amountChanged,
    TResult Function(FromCurrencyChanged value)? fromCurrencyChanged,
    TResult Function(ToCurrencyChanged value)? toCurrencyChanged,
    TResult Function(SwapCurrencies value)? swapCurrencies,
    TResult Function(FetchRate value)? fetchRate,
    TResult Function(FetchHistoricalData value)? fetchHistoricalData,
    required TResult orElse(),
  }) {
    if (toCurrencyChanged != null) {
      return toCurrencyChanged(this);
    }
    return orElse();
  }
}

abstract class ToCurrencyChanged implements ConverterEvent {
  const factory ToCurrencyChanged(final Currency currency) =
      _$ToCurrencyChangedImpl;

  Currency get currency;
  @JsonKey(ignore: true)
  _$$ToCurrencyChangedImplCopyWith<_$ToCurrencyChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SwapCurrenciesImplCopyWith<$Res> {
  factory _$$SwapCurrenciesImplCopyWith(_$SwapCurrenciesImpl value,
          $Res Function(_$SwapCurrenciesImpl) then) =
      __$$SwapCurrenciesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SwapCurrenciesImplCopyWithImpl<$Res>
    extends _$ConverterEventCopyWithImpl<$Res, _$SwapCurrenciesImpl>
    implements _$$SwapCurrenciesImplCopyWith<$Res> {
  __$$SwapCurrenciesImplCopyWithImpl(
      _$SwapCurrenciesImpl _value, $Res Function(_$SwapCurrenciesImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SwapCurrenciesImpl implements SwapCurrencies {
  const _$SwapCurrenciesImpl();

  @override
  String toString() {
    return 'ConverterEvent.swapCurrencies()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SwapCurrenciesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String amount) amountChanged,
    required TResult Function(Currency currency) fromCurrencyChanged,
    required TResult Function(Currency currency) toCurrencyChanged,
    required TResult Function() swapCurrencies,
    required TResult Function() fetchRate,
    required TResult Function() fetchHistoricalData,
  }) {
    return swapCurrencies();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String amount)? amountChanged,
    TResult? Function(Currency currency)? fromCurrencyChanged,
    TResult? Function(Currency currency)? toCurrencyChanged,
    TResult? Function()? swapCurrencies,
    TResult? Function()? fetchRate,
    TResult? Function()? fetchHistoricalData,
  }) {
    return swapCurrencies?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String amount)? amountChanged,
    TResult Function(Currency currency)? fromCurrencyChanged,
    TResult Function(Currency currency)? toCurrencyChanged,
    TResult Function()? swapCurrencies,
    TResult Function()? fetchRate,
    TResult Function()? fetchHistoricalData,
    required TResult orElse(),
  }) {
    if (swapCurrencies != null) {
      return swapCurrencies();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AmountChanged value) amountChanged,
    required TResult Function(FromCurrencyChanged value) fromCurrencyChanged,
    required TResult Function(ToCurrencyChanged value) toCurrencyChanged,
    required TResult Function(SwapCurrencies value) swapCurrencies,
    required TResult Function(FetchRate value) fetchRate,
    required TResult Function(FetchHistoricalData value) fetchHistoricalData,
  }) {
    return swapCurrencies(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AmountChanged value)? amountChanged,
    TResult? Function(FromCurrencyChanged value)? fromCurrencyChanged,
    TResult? Function(ToCurrencyChanged value)? toCurrencyChanged,
    TResult? Function(SwapCurrencies value)? swapCurrencies,
    TResult? Function(FetchRate value)? fetchRate,
    TResult? Function(FetchHistoricalData value)? fetchHistoricalData,
  }) {
    return swapCurrencies?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AmountChanged value)? amountChanged,
    TResult Function(FromCurrencyChanged value)? fromCurrencyChanged,
    TResult Function(ToCurrencyChanged value)? toCurrencyChanged,
    TResult Function(SwapCurrencies value)? swapCurrencies,
    TResult Function(FetchRate value)? fetchRate,
    TResult Function(FetchHistoricalData value)? fetchHistoricalData,
    required TResult orElse(),
  }) {
    if (swapCurrencies != null) {
      return swapCurrencies(this);
    }
    return orElse();
  }
}

abstract class SwapCurrencies implements ConverterEvent {
  const factory SwapCurrencies() = _$SwapCurrenciesImpl;
}

/// @nodoc
abstract class _$$FetchRateImplCopyWith<$Res> {
  factory _$$FetchRateImplCopyWith(
          _$FetchRateImpl value, $Res Function(_$FetchRateImpl) then) =
      __$$FetchRateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchRateImplCopyWithImpl<$Res>
    extends _$ConverterEventCopyWithImpl<$Res, _$FetchRateImpl>
    implements _$$FetchRateImplCopyWith<$Res> {
  __$$FetchRateImplCopyWithImpl(
      _$FetchRateImpl _value, $Res Function(_$FetchRateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchRateImpl implements FetchRate {
  const _$FetchRateImpl();

  @override
  String toString() {
    return 'ConverterEvent.fetchRate()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchRateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String amount) amountChanged,
    required TResult Function(Currency currency) fromCurrencyChanged,
    required TResult Function(Currency currency) toCurrencyChanged,
    required TResult Function() swapCurrencies,
    required TResult Function() fetchRate,
    required TResult Function() fetchHistoricalData,
  }) {
    return fetchRate();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String amount)? amountChanged,
    TResult? Function(Currency currency)? fromCurrencyChanged,
    TResult? Function(Currency currency)? toCurrencyChanged,
    TResult? Function()? swapCurrencies,
    TResult? Function()? fetchRate,
    TResult? Function()? fetchHistoricalData,
  }) {
    return fetchRate?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String amount)? amountChanged,
    TResult Function(Currency currency)? fromCurrencyChanged,
    TResult Function(Currency currency)? toCurrencyChanged,
    TResult Function()? swapCurrencies,
    TResult Function()? fetchRate,
    TResult Function()? fetchHistoricalData,
    required TResult orElse(),
  }) {
    if (fetchRate != null) {
      return fetchRate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AmountChanged value) amountChanged,
    required TResult Function(FromCurrencyChanged value) fromCurrencyChanged,
    required TResult Function(ToCurrencyChanged value) toCurrencyChanged,
    required TResult Function(SwapCurrencies value) swapCurrencies,
    required TResult Function(FetchRate value) fetchRate,
    required TResult Function(FetchHistoricalData value) fetchHistoricalData,
  }) {
    return fetchRate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AmountChanged value)? amountChanged,
    TResult? Function(FromCurrencyChanged value)? fromCurrencyChanged,
    TResult? Function(ToCurrencyChanged value)? toCurrencyChanged,
    TResult? Function(SwapCurrencies value)? swapCurrencies,
    TResult? Function(FetchRate value)? fetchRate,
    TResult? Function(FetchHistoricalData value)? fetchHistoricalData,
  }) {
    return fetchRate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AmountChanged value)? amountChanged,
    TResult Function(FromCurrencyChanged value)? fromCurrencyChanged,
    TResult Function(ToCurrencyChanged value)? toCurrencyChanged,
    TResult Function(SwapCurrencies value)? swapCurrencies,
    TResult Function(FetchRate value)? fetchRate,
    TResult Function(FetchHistoricalData value)? fetchHistoricalData,
    required TResult orElse(),
  }) {
    if (fetchRate != null) {
      return fetchRate(this);
    }
    return orElse();
  }
}

abstract class FetchRate implements ConverterEvent {
  const factory FetchRate() = _$FetchRateImpl;
}

/// @nodoc
abstract class _$$FetchHistoricalDataImplCopyWith<$Res> {
  factory _$$FetchHistoricalDataImplCopyWith(_$FetchHistoricalDataImpl value,
          $Res Function(_$FetchHistoricalDataImpl) then) =
      __$$FetchHistoricalDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchHistoricalDataImplCopyWithImpl<$Res>
    extends _$ConverterEventCopyWithImpl<$Res, _$FetchHistoricalDataImpl>
    implements _$$FetchHistoricalDataImplCopyWith<$Res> {
  __$$FetchHistoricalDataImplCopyWithImpl(_$FetchHistoricalDataImpl _value,
      $Res Function(_$FetchHistoricalDataImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchHistoricalDataImpl implements FetchHistoricalData {
  const _$FetchHistoricalDataImpl();

  @override
  String toString() {
    return 'ConverterEvent.fetchHistoricalData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchHistoricalDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String amount) amountChanged,
    required TResult Function(Currency currency) fromCurrencyChanged,
    required TResult Function(Currency currency) toCurrencyChanged,
    required TResult Function() swapCurrencies,
    required TResult Function() fetchRate,
    required TResult Function() fetchHistoricalData,
  }) {
    return fetchHistoricalData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String amount)? amountChanged,
    TResult? Function(Currency currency)? fromCurrencyChanged,
    TResult? Function(Currency currency)? toCurrencyChanged,
    TResult? Function()? swapCurrencies,
    TResult? Function()? fetchRate,
    TResult? Function()? fetchHistoricalData,
  }) {
    return fetchHistoricalData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String amount)? amountChanged,
    TResult Function(Currency currency)? fromCurrencyChanged,
    TResult Function(Currency currency)? toCurrencyChanged,
    TResult Function()? swapCurrencies,
    TResult Function()? fetchRate,
    TResult Function()? fetchHistoricalData,
    required TResult orElse(),
  }) {
    if (fetchHistoricalData != null) {
      return fetchHistoricalData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AmountChanged value) amountChanged,
    required TResult Function(FromCurrencyChanged value) fromCurrencyChanged,
    required TResult Function(ToCurrencyChanged value) toCurrencyChanged,
    required TResult Function(SwapCurrencies value) swapCurrencies,
    required TResult Function(FetchRate value) fetchRate,
    required TResult Function(FetchHistoricalData value) fetchHistoricalData,
  }) {
    return fetchHistoricalData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AmountChanged value)? amountChanged,
    TResult? Function(FromCurrencyChanged value)? fromCurrencyChanged,
    TResult? Function(ToCurrencyChanged value)? toCurrencyChanged,
    TResult? Function(SwapCurrencies value)? swapCurrencies,
    TResult? Function(FetchRate value)? fetchRate,
    TResult? Function(FetchHistoricalData value)? fetchHistoricalData,
  }) {
    return fetchHistoricalData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AmountChanged value)? amountChanged,
    TResult Function(FromCurrencyChanged value)? fromCurrencyChanged,
    TResult Function(ToCurrencyChanged value)? toCurrencyChanged,
    TResult Function(SwapCurrencies value)? swapCurrencies,
    TResult Function(FetchRate value)? fetchRate,
    TResult Function(FetchHistoricalData value)? fetchHistoricalData,
    required TResult orElse(),
  }) {
    if (fetchHistoricalData != null) {
      return fetchHistoricalData(this);
    }
    return orElse();
  }
}

abstract class FetchHistoricalData implements ConverterEvent {
  const factory FetchHistoricalData() = _$FetchHistoricalDataImpl;
}
