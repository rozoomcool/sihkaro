import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notebook.g.dart';

@JsonSerializable()
class NotebookCreate extends Equatable {
  const NotebookCreate({
    required this.title,
  });

  factory NotebookCreate.fromJson(Map<String, dynamic> json) => _$NotebookCreateFromJson(json);

  final String title;

  Map<String, dynamic> toJson() => _$NotebookCreateToJson(this);

  @override
  List<Object?> get props => [title];
}
