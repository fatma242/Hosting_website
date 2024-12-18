import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference _groupsCollection =
      FirebaseFirestore.instance.collection('social_media_groups');

  Future<void> addGroup(String groupName, String groupType) async {
    await _groupsCollection.add({
      'name': groupName,
      'type': groupType,
      'created_at': Timestamp.now(),
    });
  }

  Stream<QuerySnapshot> getGroups() {
    return _groupsCollection.orderBy('created_at', descending: true).snapshots();
  }
}
