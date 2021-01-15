// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memodia.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Memodia _$MemodiaFromJson(Map<String, dynamic> json) {
  return Memodia(
    images: (json['images'] as List)
        ?.map((e) =>
            e == null ? null : MemoImage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    description: json['description'] as String,
  )
    ..id = json['id'] as String
    ..userId = json['userId'] as String;
}

Map<String, dynamic> _$MemodiaToJson(Memodia instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'images': instance.images,
      'description': instance.description,
    };
