import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notebook.g.dart';

@JsonSerializable()
class Notebook extends Equatable {
  const Notebook({
    required this.id,
    required this.userId,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Notebook.fromJson(Map<String, dynamic> json) => _$NotebookFromJson(json);

  final String id;
  final String userId;
  final String title;
  final DateTime createdAt;
  final DateTime updatedAt;

  Map<String, dynamic> toJson() => _$NotebookToJson(this);

  @override
  List<Object?> get props => [id, userId, title, createdAt, updatedAt];
}
