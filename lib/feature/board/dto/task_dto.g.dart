// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskDto _$$_TaskDtoFromJson(Map<String, dynamic> json) => _$_TaskDto(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      title: json['title'] as String,
      dueOn: DateTime.parse(json['due_on'] as String),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$_TaskDtoToJson(_$_TaskDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'title': instance.title,
      'due_on': instance.dueOn.toIso8601String(),
      'status': instance.status,
    };
