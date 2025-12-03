import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notebook.g.dart';

@JsonSerializable()
class NotebookCreate extends Equatable {
  const NotebookCreate({required this.title});

  factory NotebookCreate.fromJson(Map<String, dynamic> json) =>
      _$NotebookCreateFromJson(json);

  final String title;

  Map<String, dynamic> toJson() => _$NotebookCreateToJson(this);

  @override
  List<Object?> get props => [title];
}

@JsonSerializable()
class NotebookById extends Equatable {
  const NotebookById({
    required this.id,
    required this.userId,
    required this.title,
  });

  factory NotebookById.fromJson(Map<String, dynamic> json) =>
      _$NotebookByIdFromJson(json);

  final String id;
  final String userId;
  final String title;

  Map<String, dynamic> toJson() => _$NotebookByIdToJson(this);

  @override
  List<Object?> get props => [title];
}
