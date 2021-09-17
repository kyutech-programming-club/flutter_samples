import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/post_page.dart';
import 'package:flutter_samples/post_page_model.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase初期化
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PostPageModel>(
      create: (_) => PostPageModel(),
      child : MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Consumer<PostPageModel>(
        builder: (context, model, child) {
          List<Widget> posts = model.posts.map((e) {
            Column(
              children: [
                Text(e['date']),
                Text(e['text']),
              ],
            );
          }).cast<Widget>().toList();

          Widget postList = Column(children: posts);

          return ListView.builder(
            itemBuilder: (context, index) {
              return postList;
            },
            itemCount: posts.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(createUpRoute()),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
