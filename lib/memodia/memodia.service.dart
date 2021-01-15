import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:memodia/memodia/models/image.model.dart';
import 'package:memodia/memodia/models/memodia.model.dart';

class MemodiaService {
  CollectionReference memodiasRef = Firestore.instance.collection("memodias");

  Stream<Iterable<Memodia>> findAll(userId) {
    return memodiasRef
        .where("user_id", isEqualTo: userId)
        .snapshots()
        .map((ss) => ss.documents.map((doc) => Memodia.fromSnapshot(doc)).toList());
  }

  Future<Memodia> findOne(String id) async {
    var result = await memodiasRef.document(id).get();
    return Memodia.fromSnapshot(result);
  }

  Future<Memodia> addOne(String userId, String description, List<MemoImage> images) async {
    var result = await memodiasRef
        .add({"user_id": userId, "description": description, "images": images.map((i) => i.toJson()).toList()});
    return Memodia(id: result.documentID, description: description, images: images);
  }

  Future<void> updateOne(Memodia memodia) async {
    memodiasRef.document(memodia.id).updateData(memodia.toJson());
  }

  Future<void> deleteOne(String id) {
    return memodiasRef.document(id).delete();
  }
}
