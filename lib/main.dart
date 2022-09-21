import 'package:flutter/material.dart';
import 'package:test_flutter/widgets/to_do_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Handle(),
    );
  }
}

class Handle extends StatefulWidget {
  const Handle({Key? key}) : super(key: key);

  @override
  State<Handle> createState() => _HandleState();
}

class Task {
  String title;
  bool stutus;
  Task({required this.title, required this.stutus});
}

List all_tasks = [
  Task(title: "study" , stutus: true),
  Task(title: "launch", stutus: true),
  Task(title: "go gym", stutus: false),
  Task(title: "go out", stutus: false),
  
];

class _HandleState extends State<Handle> {
  //////////////////////////////////////////////dart

  ///////////////////////////////////////////////flutter
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 0.7),
      appBar: AppBar(
        elevation: 0, // shadow
        backgroundColor: Color.fromRGBO(58, 66, 86, 1),
        title: Text(
          "TO DO APP",
          style: TextStyle(
              color: Colors.white, fontSize: 33, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
    ...all_tasks.map((item) => ToDoCard(text: item.title ) )
          
          ],
        ),
      ),
    );
  }
}
