import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_samples/googleSignInMethod.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return MaterialApp(
      debugShowCheckedModeBanner: true,  // <- Debug の 表示を OFF
      home: TestPage(),
    );
  }
}

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ButtonTheme(
              minWidth: 350.0,
              // height: 100.0,
              child: RaisedButton(
                child: Text('Google認証',
                  style: TextStyle(fontWeight: FontWeight.bold),),
                textColor: Colors.white,
                color: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {
                  GoogleSignInMethod().googleSignIn();
                },
              ),
            ),
            ButtonTheme(
              minWidth: 350.0,
              // height: 100.0,
              child: RaisedButton(
                child: Text('Google認証ログアウト',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                textColor: Colors.white,
                color: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  print('サインアウトしました。');
                },
              ),
            ),
            Text('別のGoogleアカウントでログインしたい場合、一回ログアウトする必要がある。'),
          ],
        ),
      ),
    );
  }
}