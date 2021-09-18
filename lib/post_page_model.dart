import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class PostPageModel extends ChangeNotifier {
  String user = "ゲスト";
  DateTime now = DateTime.now();

  final users = FirebaseFirestore.instance.collection('users');
  List<Map<String, dynamic>> posts = [];

  Future<void> init() async {
    await getPostFromFirestore();
    notifyListeners();
  }

  Future<void> getPostFromFirestore() async {
    try {
      final doc = await users.doc(user).get();
      final data = doc.data();
      posts = data!['posts'].cast<List<Map<String, dynamic>>>();
      notifyListeners();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future post(String text) async {
    try {
      posts.add(<String, dynamic>{
        'date': now,
        'text': text,
      });
      return users
          .doc(user)
          .set(<String, List<dynamic>>{
        'posts': posts,
      },
        SetOptions(merge: true),
      );
    } catch (e) {
      print(e);
    }
  }
}