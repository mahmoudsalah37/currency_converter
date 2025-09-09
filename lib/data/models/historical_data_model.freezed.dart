// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'historical_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HistoricalDataModel _$HistoricalDataModelFromJson(Map<String, dynamic> json) {
  return _HistoricalDataModel.fromJson(json);
}

/// @nodoc
mixin _$HistoricalDataModel {
  DateTime get date => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoricalDataModelCopyWith<HistoricalDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoricalDataModelCopyWith<$Res> {
  factory $HistoricalDataModelCopyWith(
          HistoricalDataModel value, $Res Function(HistoricalDataModel) then) =
      _$HistoricalDataModelCopyWithImpl<$Res, HistoricalDataModel>;
  @useResult
  $Res call({DateTime date, double rate});
}

/// @nodoc
class _$HistoricalDataModelCopyWithImpl<$Res, $Val extends HistoricalDataModel>
    implements $HistoricalDataModelCopyWith<$Res> {
  _$HistoricalDataModelCopyWithImpl(this._value, this._then);

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
abstract class _$$HistoricalDataModelImplCopyWith<$Res>
    implements $HistoricalDataModelCopyWith<$Res> {
  factory _$$HistoricalDataModelImplCopyWith(_$HistoricalDataModelImpl value,
          $Res Function(_$HistoricalDataModelImpl) then) =
      __$$HistoricalDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, double rate});
}

/// @nodoc
class __$$HistoricalDataModelImplCopyWithImpl<$Res>
    extends _$HistoricalDataModelCopyWithImpl<$Res, _$HistoricalDataModelImpl>
    implements _$$HistoricalDataModelImplCopyWith<$Res> {
  __$$HistoricalDataModelImplCopyWithImpl(_$HistoricalDataModelImpl _value,
      $Res Function(_$HistoricalDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? rate = null,
  }) {
    return _then(_$HistoricalDataModelImpl(
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
class _$HistoricalDataModelImpl implements _HistoricalDataModel {
  const _$HistoricalDataModelImpl({required this.date, required this.rate});

  factory _$HistoricalDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HistoricalDataModelImplFromJson(json);

  @override
  final DateTime date;
  @override
  final double rate;

  @override
  String toString() {
    return 'HistoricalDataModel(date: $date, rate: $rate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoricalDataModelImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.rate, rate) || other.rate == rate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, rate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoricalDataModelImplCopyWith<_$HistoricalDataModelImpl> get copyWith =>
      __$$HistoricalDataModelImplCopyWithImpl<_$HistoricalDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HistoricalDataModelImplToJson(
      this,
    );
  }
}

abstract class _HistoricalDataModel implements HistoricalDataModel {
  const factory _HistoricalDataModel(
      {required final DateTime date,
      required final double rate}) = _$HistoricalDataModelImpl;

  factory _HistoricalDataModel.fromJson(Map<String, dynamic> json) =
      _$HistoricalDataModelImpl.fromJson;

  @override
  DateTime get date;
  @override
  double get rate;
  @override
  @JsonKey(ignore: true)
  _$$HistoricalDataModelImplCopyWith<_$HistoricalDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
