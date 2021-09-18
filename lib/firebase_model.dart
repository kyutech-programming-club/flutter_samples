import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FirebaseModel extends ChangeNotifier {
  String user = "ゲスト";

  final test = FirebaseFirestore.instance.collection('test');
  String text = "";

  Future<void> init() async {
    await getPostFromFirestore();
    notifyListeners();
  }

  Future<void> getPostFromFirestore() async {
    try {
      final doc = await test.doc(user).get();
      final data = doc.data();
      text = data!['text'];
      notifyListeners();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future post(String inputText) async {
    try {
      text = inputText;
      return test
          .doc(user)
          .set(
        <String, dynamic>{
          'text': text
        },
        SetOptions(merge: true),
      );
    } catch (e) {
      print(e);
    }
  }
}
