import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase初期化
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider<FirebaseModel>(
        create: (_) => FirebaseModel()..init(),
        child : MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        )
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
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<FirebaseModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Center(
                child: Column(
                  children: [
                    Text(model.text),
                    Container(
                      width: 200,
                      child: TextField(
                        controller: myController,
                      ),
                    ),
                  ],
                )
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                model.post(myController.text);
                await model.getPostFromFirestore();
                },
              child: Icon(Icons.add),
            ),
          );
        });
  }
}