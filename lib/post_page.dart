import 'package:flutter/material.dart';
import 'package:flutter_samples/post_page_model.dart';
import 'package:provider/provider.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<PostPageModel>(
          builder: (context, model, child) {
            return Column(
              children: [
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text("キャンセル"),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        model.post(myController.text);
                        await model.getPostFromFirestore();
                        print(model.posts);
                        Navigator.pop(context);
                      },
                      child: Text("投稿"),
                    ),
                  ],
                ),
                TextField(
                  controller: myController,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}


Route createUpRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => PostPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0); // 変化量(速度)
      const end = Offset.zero;
      const curve = Curves.ease; // アニメーションの種類

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}