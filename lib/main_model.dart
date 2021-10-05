import 'package:flutter/cupertino.dart';
import 'package:flutter_samples/firebase_model.dart';
import 'package:flutter_samples/type.dart';

class MainModel extends ChangeNotifier {
  Types? type;

  Future<void> init() async {
    type = await getFromFirebase('test');
    notifyListeners();
  }

  updateType() async {
    type = await getFromFirebase('test');
    notifyListeners();
  }
}