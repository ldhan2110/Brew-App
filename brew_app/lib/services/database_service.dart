import 'package:brew_app/models/brew.dart';
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
    await _collectionReference.doc(uid).set({
      'name': name,
      'sugars': sugars,
      'strength': strength,
    });
  }

  List<BrewModel> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return BrewModel(
        name: doc['name'] ?? 'No Name',
        sugars: doc['sugars'] ?? '0',
        strength: doc['strength'] ?? 100,
      );
    }).toList();
  }

  Stream<List<BrewModel>> get brews {
    return _collectionReference.snapshots().map(_brewListFromSnapshot);
  }
}
