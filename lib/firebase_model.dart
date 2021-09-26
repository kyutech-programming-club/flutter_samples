import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FirebaseModel extends ChangeNotifier {
  String user = "ゲスト";

  Future<void> init() async {
    await getFromFirebase('test');
    notifyListeners();
  }

  Future<void> getFromFirebase(String collectionName) async {
    final collection = FirebaseFirestore.instance.collection(collectionName);
    String text = "";
    try {
      final doc = await collection.doc(user).get();
      final data = doc.data();
      text = data!['text'];
      notifyListeners();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future postToFirebase(String collectionName, String fieldName, dynamic data) async {
    final collection = FirebaseFirestore.instance.collection(collectionName);
    try {
      return collection
          .doc(user)
          .set(
        <String, dynamic>{
          fieldName: data
        },
        SetOptions(merge: true),
      );
    } catch (e) {
      print(e);
    }
  }
}
