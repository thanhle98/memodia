import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:memodia/memodia/models/image.model.dart';
import 'package:memodia/memodia/models/memodia.model.dart';

class MemodiaService {
  CollectionReference memodiasRef = Firestore.instance.collection("memodias");

  Stream<Iterable<Memodia>> findAll(userId) {
    return memodiasRef
        .where("userId", isEqualTo: userId)
        .snapshots()
        .map((ss) => ss.documents.map((doc) => Memodia.fromSnapshot(doc)).toList());
  }

  Future<Memodia> findOne(String id) async {
    var result = await memodiasRef.document(id).get();
    return Memodia.fromSnapshot(result);
  }

  Future<Memodia> addOne(String userId, String description, List<MemoImage> images) async {
    var result = await memodiasRef
        .add({"userId": userId, "description": description, "images": images.map((i) => i.toJson()).toList()});
    return Memodia(id: result.documentID, description: description, images: images);
  }

  Future<void> updateOne(Memodia memodia) async {
    print(memodia.toJson());
    memodiasRef.document(memodia.id).updateData(memodia.toJson());
  }

  Future<void> deleteOne(Memodia memodia) {
    return memodiasRef.document(memodia.id).delete();
  }

  // MemoImage Storage Service
  Future<MemoImage> uploadFile(MemoImage memoImage) async {
    StorageReference storageReference = FirebaseStorage.instance.ref().child('memodias/${memoImage.hashcode}');
    StorageUploadTask uploadTask = storageReference.putFile(File(memoImage.filePath));
    await uploadTask.onComplete;
    print('File Uploaded');
    String downloadUrl = await storageReference.getDownloadURL();
    memoImage.url = downloadUrl;
    return memoImage;
  }
}
