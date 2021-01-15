// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memodia.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Memodia _$MemodiaFromJson(Map<String, dynamic> json) {
  return Memodia(
    id: json['id'] as String,
    userId: json['userId'] as String,
    images: (json['images'] as List)
        ?.map((e) =>
            e == null ? null : MemoImage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$MemodiaToJson(Memodia instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'images': instance.images?.map((e) => e?.toJson())?.toList(),
      'description': instance.description,
    };
