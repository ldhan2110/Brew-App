import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference _collectionReference = FirebaseFirestore.instance
      .collection('brews');

  Future updateUserData(
    String uid,
    String name,
    String sugars,
    int strength,
  ) async {
    return await _collectionReference.doc(uid).set({
      'name': name,
      'sugars': sugars,
      'strength': strength,
    });
  }

  // brew list from snapshot
  Stream<QuerySnapshot> get brews {
    return _collectionReference.snapshots();
  }
}
