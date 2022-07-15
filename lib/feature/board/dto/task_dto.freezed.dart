// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'task_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaskDto _$TaskDtoFromJson(Map<String, dynamic> json) {
  return _TaskDto.fromJson(json);
}

/// @nodoc
mixin _$TaskDto {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'due_on')
  DateTime get dueOn => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskDtoCopyWith<TaskDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskDtoCopyWith<$Res> {
  factory $TaskDtoCopyWith(TaskDto value, $Res Function(TaskDto) then) =
      _$TaskDtoCopyWithImpl<$Res>;
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') int userId,
      String title,
      @JsonKey(name: 'due_on') DateTime dueOn,
      String status});
}

/// @nodoc
class _$TaskDtoCopyWithImpl<$Res> implements $TaskDtoCopyWith<$Res> {
  _$TaskDtoCopyWithImpl(this._value, this._then);

  final TaskDto _value;
  // ignore: unused_field
  final $Res Function(TaskDto) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? title = freezed,
    Object? dueOn = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      dueOn: dueOn == freezed
          ? _value.dueOn
          : dueOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_TaskDtoCopyWith<$Res> implements $TaskDtoCopyWith<$Res> {
  factory _$$_TaskDtoCopyWith(
          _$_TaskDto value, $Res Function(_$_TaskDto) then) =
      __$$_TaskDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') int userId,
      String title,
      @JsonKey(name: 'due_on') DateTime dueOn,
      String status});
}

/// @nodoc
class __$$_TaskDtoCopyWithImpl<$Res> extends _$TaskDtoCopyWithImpl<$Res>
    implements _$$_TaskDtoCopyWith<$Res> {
  __$$_TaskDtoCopyWithImpl(_$_TaskDto _value, $Res Function(_$_TaskDto) _then)
      : super(_value, (v) => _then(v as _$_TaskDto));

  @override
  _$_TaskDto get _value => super._value as _$_TaskDto;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? title = freezed,
    Object? dueOn = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_TaskDto(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      dueOn: dueOn == freezed
          ? _value.dueOn
          : dueOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TaskDto implements _TaskDto {
  const _$_TaskDto(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      required this.title,
      @JsonKey(name: 'due_on') required this.dueOn,
      required this.status});

  factory _$_TaskDto.fromJson(Map<String, dynamic> json) =>
      _$$_TaskDtoFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  final String title;
  @override
  @JsonKey(name: 'due_on')
  final DateTime dueOn;
  @override
  final String status;

  @override
  String toString() {
    return 'TaskDto(id: $id, userId: $userId, title: $title, dueOn: $dueOn, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskDto &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.dueOn, dueOn) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(dueOn),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_TaskDtoCopyWith<_$_TaskDto> get copyWith =>
      __$$_TaskDtoCopyWithImpl<_$_TaskDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskDtoToJson(this);
  }
}

abstract class _TaskDto implements TaskDto {
  const factory _TaskDto(
      {required final int id,
      @JsonKey(name: 'user_id') required final int userId,
      required final String title,
      @JsonKey(name: 'due_on') required final DateTime dueOn,
      required final String status}) = _$_TaskDto;

  factory _TaskDto.fromJson(Map<String, dynamic> json) = _$_TaskDto.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  String get title;
  @override
  @JsonKey(name: 'due_on')
  DateTime get dueOn;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$_TaskDtoCopyWith<_$_TaskDto> get copyWith =>
      throw _privateConstructorUsedError;
}
