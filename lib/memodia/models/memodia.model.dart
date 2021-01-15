import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:memodia/memodia/models/image.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'memodia.model.g.dart';

@JsonSerializable(explicitToJson: true)
class Memodia {
  String id;
  String userId;
  List<MemoImage> images;
  String description;

  Memodia({this.id, this.userId, this.images, this.description});

  factory Memodia.fromJson(Map<String, dynamic> json) => _$MemodiaFromJson(json);
  Map<String, dynamic> toJson() => _$MemodiaToJson(this);

  factory Memodia.fromSnapshot(DocumentSnapshot snap) {
    return Memodia(
      id: snap.documentID,
      userId: snap.data["userId"],
      description: snap.data["description"],
      images: snap.data["images"].map<MemoImage>((mI) {
        return MemoImage.fromJson(mI);
      }).toList(),
    );
  }
}
