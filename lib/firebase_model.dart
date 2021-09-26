import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_samples/type.dart';

Future<Types?> getFromFirebase(String collectionName) async {
  final collection = FirebaseFirestore.instance.collection(collectionName);
  try {
    final doc = await collection.doc('ゲスト').get();
    return Types(doc);
  } catch (e) {
    print(e);
    return null;
  }
}

Future postToFirebase(String collectionName, String fieldName, dynamic data) async {
  final collection = FirebaseFirestore.instance.collection(collectionName);
  try {
    return collection
        .doc('ゲスト')
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