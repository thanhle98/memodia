// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemoImage _$MemoImageFromJson(Map<String, dynamic> json) {
  return MemoImage(
    hashcode: json['hashcode'] as String,
    filePath: json['filePath'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$MemoImageToJson(MemoImage instance) => <String, dynamic>{
      'hashcode': instance.hashcode,
      'filePath': instance.filePath,
      'url': instance.url,
    };
