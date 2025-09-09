// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'historical_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HistoricalData _$HistoricalDataFromJson(Map<String, dynamic> json) {
  return _HistoricalData.fromJson(json);
}

/// @nodoc
mixin _$HistoricalData {
  DateTime get date => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoricalDataCopyWith<HistoricalData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoricalDataCopyWith<$Res> {
  factory $HistoricalDataCopyWith(
          HistoricalData value, $Res Function(HistoricalData) then) =
      _$HistoricalDataCopyWithImpl<$Res, HistoricalData>;
  @useResult
  $Res call({DateTime date, double rate});
}

/// @nodoc
class _$HistoricalDataCopyWithImpl<$Res, $Val extends HistoricalData>
    implements $HistoricalDataCopyWith<$Res> {
  _$HistoricalDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? rate = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HistoricalDataImplCopyWith<$Res>
    implements $HistoricalDataCopyWith<$Res> {
  factory _$$HistoricalDataImplCopyWith(_$HistoricalDataImpl value,
          $Res Function(_$HistoricalDataImpl) then) =
      __$$HistoricalDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, double rate});
}

/// @nodoc
class __$$HistoricalDataImplCopyWithImpl<$Res>
    extends _$HistoricalDataCopyWithImpl<$Res, _$HistoricalDataImpl>
    implements _$$HistoricalDataImplCopyWith<$Res> {
  __$$HistoricalDataImplCopyWithImpl(
      _$HistoricalDataImpl _value, $Res Function(_$HistoricalDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? rate = null,
  }) {
    return _then(_$HistoricalDataImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HistoricalDataImpl implements _HistoricalData {
  const _$HistoricalDataImpl({required this.date, required this.rate});

  factory _$HistoricalDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$HistoricalDataImplFromJson(json);

  @override
  final DateTime date;
  @override
  final double rate;

  @override
  String toString() {
    return 'HistoricalData(date: $date, rate: $rate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoricalDataImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.rate, rate) || other.rate == rate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, rate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoricalDataImplCopyWith<_$HistoricalDataImpl> get copyWith =>
      __$$HistoricalDataImplCopyWithImpl<_$HistoricalDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HistoricalDataImplToJson(
      this,
    );
  }
}

abstract class _HistoricalData implements HistoricalData {
  const factory _HistoricalData(
      {required final DateTime date,
      required final double rate}) = _$HistoricalDataImpl;

  factory _HistoricalData.fromJson(Map<String, dynamic> json) =
      _$HistoricalDataImpl.fromJson;

  @override
  DateTime get date;
  @override
  double get rate;
  @override
  @JsonKey(ignore: true)
  _$$HistoricalDataImplCopyWith<_$HistoricalDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
