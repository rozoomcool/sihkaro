// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notebook.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotebookCreate _$NotebookCreateFromJson(Map<String, dynamic> json) =>
    NotebookCreate(title: json['title'] as String);

Map<String, dynamic> _$NotebookCreateToJson(NotebookCreate instance) =>
    <String, dynamic>{'title': instance.title};

NotebookById _$NotebookByIdFromJson(Map<String, dynamic> json) => NotebookById(
  id: json['id'] as String,
  userId: json['userId'] as String,
  title: json['title'] as String,
);

Map<String, dynamic> _$NotebookByIdToJson(NotebookById instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
    };
