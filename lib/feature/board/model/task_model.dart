import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';

part 'task_model.g.dart';

@freezed
class TaskModel with _$TaskModel {
  const factory TaskModel({
    required int id,
    @JsonKey(name: 'user_id') required int userId,
    required String title,
    @JsonKey(name: 'due_on') required DateTime dueOn,
    required String status,
    List<String>? categories,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) => _$TaskModelFromJson(json);
}
