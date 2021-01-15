import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image.model.g.dart';

@JsonSerializable()
class MemoImage {
  String hashcode;
  String filePath;
  String url;

  MemoImage({this.hashcode, this.filePath, this.url});

  factory MemoImage.fromSnapshot(DocumentSnapshot snap) {
    return MemoImage(
      hashcode: snap.data["hashcode"],
      filePath: snap.data["filePath"],
      url: snap.data["url"],
    );
  }

  factory MemoImage.fromJson(Map<String, dynamic> json) => _$MemoImageFromJson(json);
  Map<String, dynamic> toJson() => _$MemoImageToJson(this);
}
